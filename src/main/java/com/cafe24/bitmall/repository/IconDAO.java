package com.cafe24.bitmall.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.IconVO;

@Repository
public class IconDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public boolean insertDAO(HashMap<String, Long> map) {
		int count = sqlSession.insert("icon.insertIcon", map);
		return count == 1;
	}
	
	public List<IconVO> getList(){
		return sqlSession.selectList("icon.getList");
	}
}
