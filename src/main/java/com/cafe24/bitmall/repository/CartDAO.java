package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.dto.CartDTO;
import com.cafe24.bitmall.vo.CartVO;

@Repository
public class CartDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 카트에 이미 있는 옵션인지 체크
	public boolean checkOption(CartVO vo) {
		if(sqlSession.selectOne("cart.checkOption", vo) != null) {
			return true;
		}
		return false;
	}
	
	// 카트에 아이템 추가
	public boolean addItem(CartVO vo) {
		int count = sqlSession.insert("cart.addItem", vo);
		
		return count == 1;
	}
	
	// 카트 리스트 가져오기
	public List<CartDTO> getItems(Long no){
		return sqlSession.selectList("cart.getItems", no);
	}
	
	// 현재 유저의 장바구니에 있는 아이템들의 Status값을 0->1로 변경
	public boolean updateStatus(Long no) {
		int count = sqlSession.update("cart.updateStatus", no);
		return count == 1;
	}
}
