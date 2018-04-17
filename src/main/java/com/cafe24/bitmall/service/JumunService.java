package com.cafe24.bitmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dto.JumunDTO;
import com.cafe24.bitmall.repository.JumunDAO;

@Service
public class JumunService {
	@Autowired
	private JumunDAO jumunDAO;
	
	public List<JumunDTO> getList(Long no){
		return jumunDAO.getList(no);
	}
}
