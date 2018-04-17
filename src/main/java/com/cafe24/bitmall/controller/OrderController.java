package com.cafe24.bitmall.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.dto.CartDTO;
import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.security.AuthUser;
import com.cafe24.bitmall.security.Auth.Role;
import com.cafe24.bitmall.service.CartService;
import com.cafe24.bitmall.service.CustomerService;
import com.cafe24.bitmall.service.OrderService;
import com.cafe24.bitmall.vo.BuyVO;
import com.cafe24.bitmall.vo.CustomerVO;
import com.cafe24.bitmall.vo.GoodsVO;
import com.cafe24.bitmall.vo.OrderGoodsVO;

@Controller
@Auth(role=Role.USER)
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private OrderService orderService;

	@RequestMapping("/now")
	public String buyNow(@AuthUser CustomerVO vo,
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
		
		// 장바구니 총 금액 구하기
		int sum = cartService.getCartTotalPrice(dto);
		
		// 로그인한 사용자의 정보
		CustomerVO userInfo = customerService.getCustomer(vo.getId());
		
		model.addAttribute("dto", dto);
		model.addAttribute("map", map);
		model.addAttribute("sum", sum);
		model.addAttribute("vo", userInfo);
		return "order/order";
	}
	
	@RequestMapping("/order_pay")
	public String pay(/*@RequestParam(value="goodsList", required=false) String list,*/
					  @ModelAttribute CustomerVO customerVO,
					  @ModelAttribute BuyVO buyVO,
					  Model model) {
		
		// status 3은 이미 종료된 아이템을 의미 따라서 가져올 필요가 없다.
		
		List<CartDTO> dto = cartService.getItems(buyVO.getrCustomerNo());
		
		HashMap<Long, Object> map = cartService.getSoption(dto);
		System.out.println("/cart / map ==> " + map);
		
		// 장바구니 총 금액 구하기
		int sum = cartService.getCartTotalPrice(dto);
		
		System.out.println("/order_pay customerVO ==>  " + customerVO);
		System.out.println("/order_pay buyVO ==>  " + buyVO);
		System.out.println("/order_pay CartDTO ==>  " + dto);
		
		model.addAttribute("buyVO", buyVO);
		model.addAttribute("dto", dto);
		model.addAttribute("map", map);
		model.addAttribute("sum", sum);
		////////////////////////////////////////// 밑에 2줄 주석 해제 해야 아이템 추가됨.
		orderService.addItem(buyVO);
		
		buyVO.setrOrderNo(""+(100000+buyVO.getrNo()));
		model.addAttribute("buyVO", buyVO);
		
		
		return "order/order_pay";
	}
	
	@RequestMapping("/check")
	public String check(@AuthUser CustomerVO vo,
						@RequestParam(value="orderNo", required=true) Long orderNo,
					    @RequestParam(value="paymentMethod", required=true) int paymentMethod,
						@RequestParam(value="paymentInfo", required=true) String paymentInfo) {
		System.out.println("/order_pay /check vo ==>" + vo);
		System.out.println("/order_pay /check orderNo ==>" + orderNo);
		System.out.println("/order_pay /check paymentMethod ==>" + paymentMethod);
		System.out.println("/order_pay /check paymentInfo ==>" + paymentInfo);
		
		/*for(int i=0;i<dto.size();i++) {
			orderService.addOrderList(buyVO.getrNo(), dto.get(i).getGoodsNo());
		}*/
		
		List<CartDTO> cartList = cartService.getItems((long)vo.getNo());
		
		BuyVO dto = orderService.getInfo(orderNo);
		// 결제 방식 세팅
		dto.setrPaymentMethod(paymentMethod);
		orderService.update(dto);
		//BuyVO dto1 = orderService.getInfo(1L);
		
		// ordergoods 테이블에 값 넣는 곳
		OrderGoodsVO orderVO = new OrderGoodsVO();
		orderVO.setOrderNo(dto.getrNo());
		orderVO.setStatus(0);
		orderVO.setPayment_info(paymentInfo);
		
		// 현재 유저의 장바구니에 있는 아이템(status가 0인)들을 모두 검색해 테이블에 넣어줌.
		orderService.addOrderGoods(orderVO, cartList);
		
		// 현재 장바구니에 있는 아이템들의 status를 1로 변경.
		cartService.updateStatus((long)vo.getNo());
		
		System.out.println("/check cartList ==> " + cartList);
		System.out.println("/check dto ==> " + dto);
		
		return "redirect:/order/order_ok";
	}
	
	@RequestMapping("/order_ok")
	public String orderOk() {
		return "order/order_ok";
	}
}
