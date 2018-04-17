package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.ImageVO;

@Repository
public class ImageDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 이미지 삽입
	public boolean insertImage(ImageVO vo) {
		int count = sqlSession.insert("image.insertImage", vo);
		return count == 1;
	}
	
	// 이미지 리스트
	public List<ImageVO> getImageList() {
		return sqlSession.selectList("image.getImageList");
	}
	
	// 이미지 리스트 (해당 번호만)
	public ImageVO getImageList(Long no){
		return sqlSession.selectOne("image.getImageListNo", no);
	}
}
