package com.cafe24.bitmall.controller;

import java.lang.ProcessBuilder.Redirect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.security.AuthUser;
import com.cafe24.bitmall.service.AdminService;
import com.cafe24.bitmall.vo.CustomerVO;
import com.cafe24.bitmall.vo.OptionVO;
import com.cafe24.bitmall.vo.SmallOptionVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	/****************************************
	 * 로그인
	 ****************************************/
	
	// 관리자 페이지에서 로그인
	@RequestMapping(value= {"", "/", "/main", "/login"})
	public String index(@AuthUser CustomerVO vo) {
		System.out.println("관리자 페이지 vo ==> " + vo);
		if(vo == null)
			return "admin/login";
		else
			return "admin/product";
	}
	
	// 관리자 페이지에서 로그인 실패
	@RequestMapping("/member_login_fail")
	public String loginFail() {
		return "admin/member_login_fail";
	}
	
	// 관리자 상품페이지
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/product")
	public String productIndex() {
		return "admin/product";
	}
	
	// 관리자 상품페이지
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/product_new")
	public String productNew() {
		return "admin/product_new";
	}
	
	// 관리자 회원페이지
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/member")
	public String memberIndex() {
		
		/* 회원리스트 가져오기 */
		
		return "admin/member";
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
