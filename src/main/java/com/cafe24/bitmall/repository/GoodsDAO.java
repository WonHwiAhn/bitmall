package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.GoodsVO;

@Repository
public class GoodsDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 상품 추가
	public Long insertGoods(GoodsVO vo) {
		if(vo.getSoptionData().equals("0")) {
			return (long) sqlSession.insert("goods.insertGoodsNosopt", vo);
		}else {
			return (long) sqlSession.insert("goods.insertGoods", vo);
		}
	}
	
	// 상품 리스트
	public List<GoodsVO> getList(){
		return sqlSession.selectList("goods.getList");
	}
	
	// 상품 총 개수
	public int getProductCount() {
		return sqlSession.selectOne("goods.getProductCount");
	}
	
	// 상품 정보 얻기 (번호)
	public GoodsVO getInfo(Long no) {
		return sqlSession.selectOne("goods.getInfo", no);
	}
}
