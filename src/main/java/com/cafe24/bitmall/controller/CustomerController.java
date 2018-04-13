package com.cafe24.bitmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cafe24.bitmall.security.AuthUser;
import com.cafe24.bitmall.service.CustomerService;
import com.cafe24.bitmall.vo.CustomerVO;

@Controller
@RequestMapping("/user")
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	// 회원 로그인 폼 GET
	@RequestMapping(value= {"/member_login", "/", ""})
	public String login() {
		return "user/member_login";
	}
	
	// 회원 로그인 폼 POST --> interceptor 처리
	/*@RequestMapping(value= "/member_login", method=RequestMethod.POST)
	public String login(@ModelAttribute CustomerVO vo) {
		System.out.println("userController login vo == > " + vo);
		return "user/member_login";
	}*/
	
	// 회원가입 동의 페이지
	@RequestMapping(value="/member_agree")
	public String agree() {
		return "user/member_agree";
	}
	
	// 회원 가입 폼
	@RequestMapping(value="/member_join")
	public String register() {
		return "user/member_join";
	}
	
	// 회원 가입 폼 POST
	@RequestMapping(value="/member_join", method=RequestMethod.POST)
	public String register(@ModelAttribute CustomerVO vo) {
		System.out.println("controller vo ==> " + vo);
		
		customerService.join(vo);
		
		return "/user/member_login";
	}
	
	// 회원 가입 완료한 다음 폼
	@RequestMapping(value="/member_joinend")
	public String joinEnd() {
		return "user/member_joinend";
	}
	
	// 로그인 실패시
	@RequestMapping(value="/member_login_fail")
	public String loginFail() {
		return "user/member_login_fail";
	}
	
	// 회원 정보 수정 폼
	@RequestMapping(value="/member_modify/{id}", method=RequestMethod.GET)
	public String modify(@PathVariable(value="id") String id,
						 @AuthUser CustomerVO userInfo,
						 Model model) {
		
		if(userInfo != null) { // 로그인이 된 경우에만 접근 가능하도록
			CustomerVO vo = customerService.getCustomer(id);
			
			System.out.println("id vo ==> " + vo);
			
			model.addAttribute("vo", vo);
			
			return "user/member_modify";
		}else {
			return "user/member_login";
		}
	}
	
	// 회원 정보 수정 성공시
	@RequestMapping(value="/member_modify_success", method=RequestMethod.GET)
	public String modifySuccess(Model model,
								@AuthUser CustomerVO vo) {
		//rttr을 이용해서 성공페이지가기 전에 나눠줌
		System.out.println("vogetAuth ==> " + vo.getAuth());
		if(vo.getAuth() == 1) {
			model.addAttribute("auth", "auth");
		}else if(vo.getAuth() == 5) {
			model.addAttribute("auth", "user");
		}
		
		return "user/member_modify_success";
	}
}
