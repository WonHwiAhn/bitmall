package com.cafe24.bitmall.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.dto.SearchCriteria;
import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.security.AuthUser;
import com.cafe24.bitmall.service.AdminService;
import com.cafe24.bitmall.service.CategoryService;
import com.cafe24.bitmall.service.FileUploadService;
import com.cafe24.bitmall.service.GoodsService;
import com.cafe24.bitmall.service.IconService;
import com.cafe24.bitmall.service.ImageService;
import com.cafe24.bitmall.vo.CategoryVO;
import com.cafe24.bitmall.vo.CustomerVO;
import com.cafe24.bitmall.vo.GoodsVO;
import com.cafe24.bitmall.vo.IconVO;
import com.cafe24.bitmall.vo.ImageVO;
import com.cafe24.bitmall.vo.OptionVO;
import com.cafe24.bitmall.vo.SmallOptionVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private FileUploadService fileUploadService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private IconService iconService;
	/****************************************
	 * 로그인
	 ****************************************/
	
	// 관리자 페이지에서 로그인
	@RequestMapping(value= {"", "/", "/main", "/login"})
	public String index(@AuthUser CustomerVO vo) {
		System.out.println("관리자 페이지 vo ==> " + vo);
		if(vo == null)
			return "admin/login";
		else if(vo.getAuth() != 1)
			return "redirect:/";
		else
			return "admin/product";
	}
	
	// 관리자 페이지에서 로그인 실패
	@RequestMapping("/member_login_fail")
	public String loginFail() {
		return "admin/member_login_fail";
	}
	
	// 관리자 회원페이지
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/member")
	public String memberIndex(@ModelAttribute SearchCriteria vo,
							  Model model) {
		System.out.println("/member vo ==> " + vo);
		int count = 0;
		List<CustomerVO> list = null;
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
		
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		return "admin/member";
	}
	
	/****************************************
	 * 상품
	 ****************************************/
	
	// 관리자 상품페이지
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/product")
	public String productIndex(Model model) {
		// 리스트 겟 --> 카테고리 정보 겟 --> icon정보 겟 --> option정보 겟
		List<GoodsVO> list = goodsService.getList();
		System.out.println("/product list ==> " + list);
		
		List<CategoryVO> categoryList = categoryService.getCategoryList();
		System.out.println("/product categoryList ==> " + categoryList);
		
		List<IconVO> iconList = iconService.getList();
		System.out.println("/product iconList ==> " + iconList);
		
		List<OptionVO> optionList = adminService.getOptionList();
		System.out.println("/product optionList ==> " + optionList);
		
		int count = goodsService.getProductCount();
		
		model.addAttribute("list", list);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("iconList", iconList);
		model.addAttribute("optionList", optionList);
		model.addAttribute("count", count);
		return "admin/product";
	}
	
	// 관리자 상품페이지
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping(value="/product_new", method=RequestMethod.GET)
	public String productNew(Model model) {
		
		// 상품분류 리스트 
		List<CategoryVO> categoryList = categoryService.getCategoryList();
		System.out.println("product_new category list ==> " + categoryList);
		
		// 옵션 리스트
		List<OptionVO> optionList = adminService.getOptionList();
		System.out.println("product_new option list ==> " + optionList);
		
		// 카테고리
		// 아이콘
		// 회사
		// 옵션
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("optionList", optionList);
		
		return "admin/product_new";
	}
	
	// 관리자 상품페이지
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping(value="/product_new", method=RequestMethod.POST)
	public String productNew(@ModelAttribute GoodsVO vo,
							 @RequestParam(value="file", required=false, defaultValue="") MultipartFile multipartFile,
							 @RequestParam(value="file2", required=false, defaultValue="") MultipartFile multipartFile2) {
		
		System.out.println("/product_new POST vo ==> " + vo);
		
		// 파일 처리
		String url = fileUploadService.restore(multipartFile);
		String url2 = fileUploadService.restore(multipartFile2);
		
		System.out.println("url ===> " + url);
		System.out.println("url ===> " + url2);
		
		url = url + "*" + url2; // 파일명에 *은 입력할 수 없음. 그래서 *로 구분
		
		// 여기서 no는 상품번호의 기본키를 의미한다.
		
		/**************************************
		 *  여기 insert vo값이 0인거에 따라서 if문 나눡 ㄱㄱㄱ
		 ***********************************/
		goodsService.insertGoods(vo);
		Long no = vo.getNo();
		
		System.out.println("/product_new last key ---> " + no);
		
		// 상품에 대한 이미지를 image table에 삽입
		if(!"".equals(url)) {
			ImageVO imgVO = new ImageVO(url, no);
			imageService.insertImage(imgVO);
		}
		
		// 상품에 대한 아이콘 정보를 icon_data table에 삽입
		if(!"".equals(vo.getIconData())) {
			String iconInfo = vo.getIconData();
			iconService.insertIcon(no, iconInfo);
		}
		
		/*if(vo.getSoptionData().equals("0")) {
			vo.setSoptionData("");
		}*/
		System.out.println("insergoodssmalloption soptionData ===> " + vo.getSoptionData());
		// 소옵션에 대한 정보를 small_option_data table에 삽입
		if(!vo.getSoptionData().equals("0")) {
			adminService.insertGoodsSmallOption(no, vo.getSoptionData());
		}
		
		/*model.addAttribute("categoryList", categoryList);
		model.addAttribute("optionList", optionList);*/
		
		return "redirect:/admin/product";
	}
	
	
	// 관리자 주문페이지
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/jumun")
	public String jumunIndex() {
		return "admin/jumun";
	}
	
	/****************************************
	 * 옵션
	 ****************************************/
	
	// 관리자 옵션페이지
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/opt")
	public String optIndex(Model model) {
		model.addAttribute("totalCount", adminService.getOptionCount());
		
		model.addAttribute("list", adminService.getOptionList());
		
		return "admin/opt";
	}
	
	// 관리자 옵션페이지
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/opt_edit")
	public String optEdit(@RequestParam int no,
						  Model model) {
		System.out.println("opt edit no ==> " +no);
		
		OptionVO vo = adminService.getOptionInfo(no);
		System.out.println("vo ==> " + vo);
		
		model.addAttribute("vo", vo);
		return "admin/opt_edit";
	}
	
	// 관리자 옵션페이지 (수정)
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/opt_update")
	public String optUpdate(@ModelAttribute OptionVO vo,
						    Model model) {
		System.out.println("opt update vo ==> " + vo);
		
		adminService.updateOption(vo);
		
		return "redirect:/admin/opt";
	}
	
	// 관리자 옵션페이지
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/opt_new")
	public String optNew() {
		return "admin/opt_new";
	}
	
	/****************************************
	 * 소옵션
	 ****************************************/
	
	// 관리자 소옵션 관리 페이지 (전체 리스트)
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/opts")
	public String optSmall(//RedirectAttributes redirectAttributes,
							@RequestParam(value="no", required=false) Long no,
						   Model model) {
		
		System.out.println("opts no ==> " + no);
		//System.out.println("RedirectAttributes no ==> " + redirectAttributes.getFlashAttributes());
		
		//model.addAttribute("totalCount", adminService.getOptionCount());
		model.addAttribute("no", no);
		model.addAttribute("list", adminService.getSmallOptionList(no.intValue()));
		
		return "admin/opts";
	}
	
	// 관리자 소옵션 관리 페이지 (수정)
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/opts_edit")
	public String optSmallEdit(/*@RequestParam(value="no1", required=true) Long no1,
							   @RequestParam(value="no2", required=true) Long no2,*/
							   @ModelAttribute SmallOptionVO vo,
							   Model model) {
		System.out.println("samlloption vo ==> " + vo);
		
		
		
		/*model.addAttribute("totalCount", adminService.getOptionCount());
		
		model.addAttribute("list", adminService.getSmallOptionList());*/
		model.addAttribute("vo", adminService.getSmallOptionInfo(vo));
		
		return "admin/opts_edit";
	}
	
	// 관리자 소옵션 관리 페이지 (수정)
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/opts_update")
	public String optSmallUpdate(/*@RequestParam(value="no1", required=true) Long no1,
							   @RequestParam(value="no2", required=true) Long no2,*/
							   @ModelAttribute SmallOptionVO vo,
							   RedirectAttributes rttr
							   /*Model model*/) {
		System.out.println("samlloption vo ==> " + vo);
		
		adminService.updateSmallOption(vo);
		
		//rttr.addFlashAttribute("no", vo.getOptionNo());
		
		return "redirect:/admin/opts?no="+vo.getOptionNo();
		//return "redirect:/admin/opts";
	}
	
	// 관리자 소옵션 관리 페이지 (추가)
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/opts_new")
	public String optSmallAdd(@RequestParam(value = "optionNo", required=true) int no,
							  Model model) {
		System.out.println("opts_new no ==> " + no);
		model.addAttribute("no", no);
		return "/admin/opts_new";
	}
	
	/****************************************
	 * faq
	 ****************************************/
	
	// 관리자 faq페이지
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/faq")
	public String faqIndex() {
		return "admin/faq";
	}
}
