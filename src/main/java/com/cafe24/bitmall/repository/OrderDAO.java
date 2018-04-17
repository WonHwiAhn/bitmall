package com.cafe24.bitmall.repository;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.dto.CartDTO;
import com.cafe24.bitmall.vo.BuyVO;
import com.cafe24.bitmall.vo.OrderGoodsVO;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 아이템 추가 (update까지 탐)
	public Long addBuy(BuyVO vo) {
		int count = sqlSession.insert("order.addItem", vo);
		Long no = 0L;
		if(count == 1) {
			no = vo.getrNo();
		}
		return no;
	}
	
	// 생성할 때 order_no를 만들어주기 위함
	public boolean updateItem(BuyVO vo) {
		int count = sqlSession.insert("order.updateItem", vo);
		
		return count == 1;
	}
	
	/*// 주문 내역에 아이템 추가
	public boolean addOrderList(HashMap<Object, Object> map) {
		sqlSession.insert("order.addOrderList", map);
		return
	}*/
	
	// 고유번호로 1개의 vo 정보가져오기
	public BuyVO getInfo(Long no) {
		return sqlSession.selectOne("order.getInfo", no);
	}
	
	// 주문이 이뤄질 경우 정보 최신화
	public boolean update(BuyVO vo) {
		int count = sqlSession.update("order.update", vo);
		return count == 1;
	}
	
	// insertOrderGoods테이블에 값 넣기
	public boolean insertOrderGoods(OrderGoodsVO vo) {
		int count = sqlSession.insert("order.insertOrderGoods", vo);
		return count == 1;
	}
}
