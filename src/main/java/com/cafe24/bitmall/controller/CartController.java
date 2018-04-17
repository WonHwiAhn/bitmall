package com.cafe24.bitmall.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.bitmall.dto.CartDTO;
import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.security.Auth.Role;
import com.cafe24.bitmall.security.AuthUser;
import com.cafe24.bitmall.service.AdminService;
import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.vo.CustomerVO;

@Controller
@Auth(role=Role.USER)
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@RequestMapping(value= {"/", ""})
	public String cartIndex(@AuthUser CustomerVO vo,
							Model model) {
		// 로그인 된 유저의 번호 체크
		System.out.println("/cart / userNo ==> " + vo.getNo());
		
		// 해당 유저의 카트 리스트가져오기
		List<CartDTO> dto = cartService.getItems((long)vo.getNo());
		System.out.println("/cart / dto ==> " + dto);
		
		// 옵션 가져오기
		HashMap<Long, Object> map = cartService.getSoption(dto);
		System.out.println("/cart / map ==> " + map);
		//System.out.println(map.get(1));
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("map", map);
		model.addAttribute("dtoSize", dto.size());
		
		return "cart/cart";
	}
}
