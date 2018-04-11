package com.cafe24.bitmall.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CustomerVO;

@Repository
public class CustomerDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 회원 가입 DAO
	public boolean join(CustomerVO vo) {
		int count = sqlSession.insert("customer.insert", vo);
		return count == 1;
	}
	
	// 아이디 중복체크 DAO
	public boolean checkId(String id) {
		if(sqlSession.selectOne("customer.checkId", id) != null) {
			return true;
		}
		return false;
	}
	
	// 유저 정보 가져오는 DAO 1명에 대한
	public CustomerVO getCustomer(CustomerVO vo) {
		return sqlSession.selectOne("customer.getCustomer", vo);
	}
	
	// 유저 정보 가져오기 1명꺼 (id를 통해서)
	public CustomerVO getCustomer(String id) {
		return sqlSession.selectOne("customer.getCustomerId", id);
	}
	
	// 유저 정보 수정 (패스워드까지 수정을 원할 경우)
	public boolean update(CustomerVO vo) {
		int count = sqlSession.update("customer.update", vo);
		return count == 1;
	}
	
	// 유저 정보 수정 (패스워드 수정을 원하지 않을 경우)
	public boolean updateWithoutPass(CustomerVO vo) {
		int count = sqlSession.update("customer.updateWithoutPass", vo);
		return count == 1;
	}
}
