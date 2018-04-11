package com.cafe24.bitmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.security.AuthUser;
import com.cafe24.bitmall.vo.CustomerVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
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
	
	// 관리자 회원페이지
	@Auth(role=Auth.Role.ADMIN)
	@RequestMapping("/member")
	public String memberIndex() {
		return "admin/member";
	}
}
