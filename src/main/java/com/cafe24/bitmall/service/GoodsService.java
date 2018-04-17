package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.GoodsDAO;
import com.cafe24.bitmall.vo.GoodsVO;

@Service
public class GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;
	
	// 상품 추가
	public Long insertGoods(GoodsVO vo) {
		return goodsDAO.insertGoods(vo);
	}
	
	// 상품 전체리스트
	public List<GoodsVO> getList(){
		return goodsDAO.getList();
	}
	
	// 상품 총 개수
	public int getProductCount() {
		return goodsDAO.getProductCount();
	}
	
	// 상품 정보 (no통해서)
	public GoodsVO getInfo(Long no) {
		return goodsDAO.getInfo(no);
	}
}
