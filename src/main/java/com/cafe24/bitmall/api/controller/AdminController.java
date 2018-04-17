package com.cafe24.bitmall.api.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.dto.SearchCriteria;
import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.security.AuthUser;
import com.cafe24.bitmall.service.AdminService;
import com.cafe24.bitmall.vo.CustomerVO;
import com.cafe24.bitmall.vo.OptionVO;
import com.cafe24.bitmall.vo.SmallOptionVO;

//@Auth(role=Auth.Role.ADMIN)
@Controller("adminVOAPIController")
@RequestMapping("/api/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@ResponseBody
	@RequestMapping(value="/member_list", method=RequestMethod.POST)
	public JSONResult list(@ModelAttribute SearchCriteria vo,
			/*@RequestParam(value="keyword", required=false, defaultValue="MONIBUYBGTF") String keyword,
			@RequestParam(value="searchType", required=false, defaultValue="") String type,*/
			@RequestParam String page,
			Model model) {
		List<CustomerVO> list = null;
		System.out.println("controller cri ==> " + vo);
		int count = 0;
		/*System.out.println("controller keyword ==> " + keyword);
		System.out.println("controller type ==> " + type);*/
		System.out.println("controller page ==> " + page);
		
		//String keyword = cri.getKeyword();
		
		/* 회원리스트 가져오기 */
		if("".equals(vo.getSearchType()) || vo.getSearchType() == null) {
			if("".equals(vo.getKeyword()) || vo.getKeyword() == null){
				list = adminService.getList();
				count = adminService.getTotalCount();
			}
		}else { // 검색 조건이 있을 경우
			if(!"".equals(vo.getKeyword()) || vo.getKeyword() != null){
				list = adminService.getList(vo.getKeyword(), vo.getSearchType());
				count = adminService.getTotalCount(vo.getKeyword(), vo.getSearchType());
			}
		}
		
		/*if(!"MONIBUYBGTF".equals(keyword)) {
			model.addAttribute("list", adminService.getList(keyword, page));
			model.addAttribute("keyword", keyword);
		}else { // 키워드 없을 경우
			//System.out.println(adminService.getList(page));
			list = adminService.getList(page);
			model.addAttribute("test", "test");
		}*/
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		//System.out.println(adminService.getList(keyword, page));
		
		//model.addAttribute("pageMap", adminService.calcPage(page, adminService.totalCount()));
		
		
		return JSONResult.success(list.isEmpty() ? "nodata" : map);
		//return JSONResult.success(list.isEmpty() ? "nodata" : list);
	}
	
	// 회원 삭제
	// 옵션 삭제
	@ResponseBody
	@RequestMapping(value="/member_delete", method=RequestMethod.POST)
	public JSONResult deleteMember(@ModelAttribute SearchCriteria vo,
								   @RequestParam Long no) {
		System.out.println("/member_delete no == > " + no);
		
		boolean success = adminService.deleteMember(no);
		List<CustomerVO> list = null;
		int count = 0;
		
		System.out.println("/member_delete success == > " + success);
		
		if(success) {
			/* 회원리스트 가져오기 */
			if("".equals(vo.getSearchType()) || vo.getSearchType() == null) {
				if("".equals(vo.getKeyword()) || vo.getKeyword() == null){
					list = adminService.getList();
					count = adminService.getTotalCount();
				}
			}else { // 검색 조건이 있을 경우
				if(!"".equals(vo.getKeyword()) || vo.getKeyword() != null){
					list = adminService.getList(vo.getKeyword(), vo.getSearchType());
					count = adminService.getTotalCount(vo.getKeyword(), vo.getSearchType());
				}
			}
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		
		return JSONResult.success(success ? map : "not exist");
		//return JSONResult.success("exist");
	}
	
	// 옵션 추가
	@ResponseBody
	@RequestMapping(value="/addOption", method=RequestMethod.POST)
	public JSONResult addOption(@RequestParam(value="optionName", required=false, defaultValue="") String optionName) {
		System.out.println("option name == > " + optionName);
		
		return JSONResult.success(adminService.addOption(optionName) ? "exist" : "not exist");
		//return JSONResult.success("exist");
	}
	
	// 옵션 삭제
	@ResponseBody
	@RequestMapping(value="/opt_delete", method=RequestMethod.POST)
	public JSONResult addOption(@RequestParam int no) {
		System.out.println("option no == > " + no);
		
		boolean success = adminService.deleteOption(no);
		List<OptionVO> list = null;
		if(success) {
			list = adminService.getOptionList();
		}
		
		return JSONResult.success(success ? list : "not exist");
		//return JSONResult.success("exist");
	}
	
	// 소옵션 삭제
	@ResponseBody
	@RequestMapping(value="/opts_delete", method=RequestMethod.POST)
	public JSONResult deleteSmallOption(@RequestParam int no) {
		System.out.println("smalloption no == > " + no);
		SmallOptionVO vo = adminService.getSmallOptionInfo(no);
		//SmallOptionVO optionNo = adminService.getSmallOptionInfo(vo);
		boolean success = adminService.deleteSmallOption(no);
		List<SmallOptionVO> list = null;
		if(success) {
			list = adminService.getSmallOptionList(vo.getOptionNo().intValue());
		}
		
		return JSONResult.success(success ? list : "not exist");
		//return JSONResult.success("exist");
	}
	
	// 소옵션 추가
	@ResponseBody
	@RequestMapping(value="/addSmallOption", method=RequestMethod.POST)
	public JSONResult addSmallOption(@ModelAttribute SmallOptionVO vo) {
		System.out.println("option vo == > " + vo);
		
		return JSONResult.success(adminService.addSmallOption(vo) ? "exist" : "not exist");
		//return JSONResult.success("exist");
	}
	
	// 옵션 선택했을 시 소옵션 리스트 뿌려주기
	@ResponseBody
	@RequestMapping(value="/getSmallOption", method=RequestMethod.POST)
	public JSONResult getSmallOption(@ModelAttribute SmallOptionVO vo) {
		System.out.println("/getSmallOption soption vo == > " + vo);
		
		List<SmallOptionVO> list = adminService.getSmallOptionList(vo.getOptionNo());
		
		return JSONResult.success(list);
		//return JSONResult.success("exist");
	}
	
	/*@ResponseBody
	@RequestMapping(value="/checkid", method=RequestMethod.POST)
	public JSONResult checkId(@RequestBody CustomerVO vo@RequestParam(value="id", required=false, defaultValue="") String id) {
		System.out.println("controller id == > " + vo);
		
		return JSONResult.success(customerService.checkId(vo.getId()) ? "exist" : "not exist");
		//return JSONResult.success("exist");
	}
	
	// 회원 정보 수정 폼
	@ResponseBody
	@RequestMapping(value="/member_modify", method=RequestMethod.POST)
	public JSONResult modify(@RequestBody CustomerVO vo,
						 @AuthUser CustomerVO userInfo) {
		
		boolean success = false;
		String result = "false";
		
		if(userInfo != null) { // 로그인이 된 경우에만 접근 가능하도록
			
			System.out.println("modify vo ==> " + vo);
			if(!"".equals(vo.getPassword()) || vo.getPassword() != null)
				success = customerService.update(vo);
			else
				success = customerService.updateWithoutPass(vo);
			
			result = success ? "success" : "fail";
		}
		
		return JSONResult.success(result);
	}*/
	
	/*@ResponseBody
	@RequestMapping("/insert")
	public JSONResult insert(@RequestBody GuestbookVO vo) {
		System.out.println("model vo ==> " +  vo);
		GuestbookVO guestbookVO = guestbookService.insertMessage(vo);
		System.out.println("model guestbookVO ==> " +  guestbookVO);
		return JSONResult.success(guestbookVO);
	}

	@ResponseBody
	@RequestMapping("/delete")
	public JSONResult list(@ModelAttribute GuestbookVO vo) {
		System.out.println("delete guestbookvo ==> " + vo);
		boolean result = guestbookService.deleteMessage(vo); // 현재 service dao에 no값 받아서 처리하는 것 밖에 없음
		return JSONResult.success(result ? vo.getNo() : -1);
		//return JSONResult.success(list);
	}*/
}
