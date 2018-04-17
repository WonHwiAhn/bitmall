package com.cafe24.bitmall.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.vo.CartVO;

@Controller("cartVOAPIController")
@RequestMapping("/api/cart")
public class CartController {
	@Autowired
	private CartService cartService;
	
	// 장바구니에 옵션이 있는지 없는지 체크
	@ResponseBody
	@RequestMapping(value="/checkoption")
	public JSONResult checkOption(@ModelAttribute CartVO vo) {
		System.out.println("/api/cart/checkoption ==> " + vo);
		return JSONResult.success(cartService.checkOption(vo) ? "exist" : "not exist");
	}
	
	// 장바구니에 아이템 추가
	@ResponseBody
	@RequestMapping(value="/add")
	public JSONResult add(@ModelAttribute CartVO vo) {
		System.out.println("/api/cart/add ==> " + vo);
		//System.out.println(cartService.addItem(vo));
		return JSONResult.success(cartService.addItem(vo) ? "success" : "fail");
	}
}
