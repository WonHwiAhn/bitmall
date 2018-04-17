package com.cafe24.bitmall.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.dto.JumunDTO;

@Repository
public class JumunDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<JumunDTO> getList(Long no){
		return sqlSession.selectList("jumun.getJumunList", no);
	}
}
