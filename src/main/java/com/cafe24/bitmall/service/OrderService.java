package com.cafe24.bitmall.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dto.CartDTO;
import com.cafe24.bitmall.repository.OrderDAO;
import com.cafe24.bitmall.vo.BuyVO;
import com.cafe24.bitmall.vo.OrderGoodsVO;

@Service
public class OrderService {
	@Autowired
	private OrderDAO orderDAO;
	
	// 아이템 추가
	public boolean addItem(BuyVO vo) {
		Long no = orderDAO.addBuy(vo);
		vo.setrOrderNo(""+(no+100000L));
		return orderDAO.updateItem(vo);
	}
	
	// 구매내역 테이블에 추가하기
	/*public boolean addOrderList(Long buyNo, Long goodsNo) {
		HashMap<Object, Object> orderList = new HashMap<Object, Object>();
		orderList.put(buyNo, goodsNo);
		return orderDAO.addOrderList(orderList);
	}*/
	
	// 구매 정보 가져오기 (기본키 활용해서)
	public BuyVO getInfo(Long no) {
		return orderDAO.getInfo(no);
	}
	
	// 구매가 이뤄지면 결제방법 업데이트
	public boolean update(BuyVO dto) {
		return orderDAO.update(dto);
	}
	
	// orderGoods 데이터 추가
	public void addOrderGoods(OrderGoodsVO vo, List<CartDTO> list) {
		for(int i=0; i<list.size();i++) {
			vo.setCount(list.get(i).getCount());
			vo.setPrice(list.get(i).getPrice());
			vo.setGoodsNo(list.get(i).getGoodsNo());
			
			System.out.println("addOrderGoods ==> " + vo);
			
			orderDAO.insertOrderGoods(vo);
		}
		
		System.out.println("");
	}
}
