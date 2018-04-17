package com.cafe24.bitmall.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.IconDAO;
import com.cafe24.bitmall.vo.IconVO;

@Service
public class IconService {
	@Autowired
	private IconDAO iconDAO;
	
	public boolean insertIcon(Long goodsNo, String iconData) {
		// iconData formmating
		HashMap<String, Long> map = new HashMap<String, Long>();
		String[] iconDatas = iconData.split("-");
		Long[] iconDatasL = new Long[iconDatas.length];
		
		for(int i=0;i<iconDatas.length;i++) {
			iconDatasL[i] = Long.parseLong(iconDatas[i]);
		}
		
		for(int i=0;i<iconDatasL.length;i++) {
			map.put("goodsNo", goodsNo);
			map.put("iconNo", iconDatasL[i]);
			iconDAO.insertDAO(map);
		}
		
		return true;
	}
	
	public List<IconVO> getList(){
		return iconDAO.getList();
	}
}
