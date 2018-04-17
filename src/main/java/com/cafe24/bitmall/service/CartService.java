package com.cafe24.bitmall.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.dto.CartDTO;
import com.cafe24.bitmall.repository.CartDAO;
import com.cafe24.bitmall.vo.CartVO;
import com.cafe24.bitmall.vo.SmallOptionVO;

@Service
public class CartService {
	@Autowired
	private CartDAO cartDAO;
	@Autowired
	private AdminService adminService;
	
	// 옵션 중복 체크용
	public boolean checkOption(CartVO vo) {
		return cartDAO.checkOption(vo);
	}
	
	// 장바구니에 아이템 추가
	public boolean addItem(CartVO vo) {
		return cartDAO.addItem(vo);
	}
	
	// 장바구니 리스트 가져오기
	public List<CartDTO> getItems(Long no){
		return cartDAO.getItems(no);
	}
	
	// 소옵션 가져오기
	public HashMap<Long, Object> getSoption(List<CartDTO> dto){
		//List<SmallOptionVO> optionList = new ArrayList<SmallOptionVO>();
		HashMap<Long, Object> map = new HashMap<Long, Object>();
		
		for(int i=dto.size()-1; i>=0; i--) {
			System.out.println("dto ======> " + dto);
			String[] optionValue = dto.get(i).getOption().split("-");
			List<SmallOptionVO> list = adminService.getSmallOptionList(Long.parseLong(optionValue[0]));
			
			if(!list.isEmpty()) {
				System.out.println("나중");
				for(int j=0;j<list.size();j++) {
					if(optionValue.length > 1) {
						if(list.get(j).getNo() == Long.parseLong(optionValue[1])) {
							System.out.println("long ===> " + Long.parseLong(optionValue[1]));
							map.put(dto.get(i).getNo(), list.get(j).getName());
						}
					}
				}
					//map.put(list.get(j).getNo(), list.get(j).getName());
			}else {
				System.out.println("먼저");
				map.put(dto.get(i).getNo(), 0);
				System.out.println("else ==> " + map);
			}
		}
		
		return map;
	}
	
	public int getCartTotalPrice(List<CartDTO> dto) {
		int sum = 0;
		for(int i=dto.size()-1; i>=0; i--) {
			sum += dto.get(i).getTotalCount();
		}
		return sum;
	}
	
	// 카트에 있는 status 0->1변경
	public boolean updateStatus(Long no) {
		return cartDAO.updateStatus(no);
	}
}
