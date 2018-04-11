package com.cafe24.bitmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.CustomerDAO;
import com.cafe24.bitmall.vo.CustomerVO;

@Service
public class CustomerService {
	
	@Autowired
	private CustomerDAO customerDAO;
	
	// 유저 회원 가입시
	public boolean join(CustomerVO vo) {
		return customerDAO.join(vo);
	}
	
	// 가입시 아이디 중복체크
	public boolean checkId(String id) {
		return customerDAO.checkId(id);
	}
	
	// 아이디와 패스워드로 유저 정보 가져오기
	public CustomerVO getCustomer(CustomerVO vo) {
		return customerDAO.getCustomer(vo);
	}
	
	// 아이디로 유저 정보 가져오기
	public CustomerVO getCustomer(String id) {
		return customerDAO.getCustomer(id);
	}
	
	// 유저 정보 업데이트 (패스워드까지 수정을 원할 경우)
	public boolean update(CustomerVO vo) {
		return customerDAO.update(vo);
	}
	
	// 유저 정보 업데이트 (패스워드까지 수정을 원하지 않을 경우)
	public boolean updateWithoutPass(CustomerVO vo) {
		return customerDAO.updateWithoutPass(vo);
	}
}
