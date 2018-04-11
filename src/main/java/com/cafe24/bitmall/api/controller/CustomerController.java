package com.cafe24.bitmall.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.security.AuthUser;
import com.cafe24.bitmall.service.CustomerService;
import com.cafe24.bitmall.vo.CustomerVO;

@Controller("userVOAPIController")
@RequestMapping("/api/user")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	
	@ResponseBody
	@RequestMapping(value="/member_join", method=RequestMethod.POST)
	public JSONResult list(@RequestBody CustomerVO vo) {
		System.out.println("controller vo ==> " + vo);
		
		if(customerService.join(vo)) {
			return JSONResult.success("true");
		}
		
		return JSONResult.success("failed");
	}
	
	@ResponseBody
	@RequestMapping(value="/checkid", method=RequestMethod.POST)
	public JSONResult checkId(@RequestBody CustomerVO vo/*@RequestParam(value="id", required=false, defaultValue="") String id*/) {
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
	}
	
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
