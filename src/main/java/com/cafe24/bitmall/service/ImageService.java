package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.ImageDAO;
import com.cafe24.bitmall.vo.ImageVO;

@Service
public class ImageService {
	@Autowired
	private ImageDAO imageDAO;
	
	// 이미지 url 삽입
	public boolean insertImage(ImageVO vo) {
		return imageDAO.insertImage(vo);
	}
	
	// 이미지 리스트 구하기
	public List<ImageVO> getImageList(){
		return imageDAO.getImageList();
	}
	
	// 이미지 리스트 구하기 (해당 번호)
	public ImageVO getImageList(Long no){
		return imageDAO.getImageList(no);
	}
}
