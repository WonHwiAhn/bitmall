package com.cafe24.bitmall.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.bitmall.repository.AdminDAO;
import com.cafe24.bitmall.vo.CustomerVO;
import com.cafe24.bitmall.vo.OptionVO;
import com.cafe24.bitmall.vo.SmallOptionVO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;
	
	// 회원 리스트 구해오기
	public List<CustomerVO> getList(){
		return adminDAO.getList();
	}
	
	// 키워드와 페이지로 리스트 구해오기
	public List<CustomerVO> getList(String keyword, String searchType){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		return adminDAO.getList(map);
	}
	
	// 키워드가 없을 경우 리스트 구하기
	public List<CustomerVO> getList(String page){
		return adminDAO.getList(Integer.parseInt(page));
	}
	
	// 회원 총 수 구해오기
	public int getTotalCount() {
		return adminDAO.getTotalCount();
	}
	
	// 회원 총 수 구해오기
	public int getTotalCount(String keyword, String searchType) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		return adminDAO.getTotalCount(map);
	}
	
	// 회원 삭제
	public boolean deleteMember(Long no) {
		return adminDAO.deleteMember(no);
	}
	
	/****************************************
	 * 옵션
	 ****************************************/
	
	// 옵션 삽입 
	public boolean addOption(String optionName) {
		return adminDAO.addOption(optionName);
	}
	
	// 옵션 리스트 구하기 
	public List<OptionVO> getOptionList() {
		return adminDAO.getOptionList();
	}
	
	// 옵션 총 개수 구하기
	public int getOptionCount() {
		return adminDAO.getOptionCount();
	}
	
	// 옵션 번호를 통해서 옵션 정보 가져오기
	public OptionVO getOptionInfo(int no) {
		return adminDAO.getOptionInfo(no);
	}
	
	// 옵션 번호를 통해서 옵션 정보 가져오기
	public List<OptionVO> getOptionInfo(Long no) {
		return adminDAO.getOptionInfo(no);
	}
	
	// 옵션 수정 작업
	public boolean updateOption(OptionVO vo) {
		return adminDAO.updateOption(vo);
	}
	
	// 옵션 삭제 작업
	public boolean deleteOption(int no) {
		return adminDAO.deleteOption(no);
	}
	
	/****************************************
	 * 소옵션
	 ****************************************/
	
	// 소옵션 리스트 구하는 쿼리
	// 소옵션 리스트 구하기 
	public List<SmallOptionVO> getSmallOptionList(int no) {
		return adminDAO.getSmallOptionList(no);
	}
	
	// 소옵션  정보구하기 번호로 --> 옵션번호로 구하기
	public List<SmallOptionVO> getSmallOptionList(Long no) {
		/*HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("no1", no1);
		map.put("no2", no2);*/
		return adminDAO.getSmallOptionList(no);
	}
	
	// 소옵션  정보구하기
	public SmallOptionVO getSmallOptionInfo(SmallOptionVO vo) {
		/*HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("no1", no1);
		map.put("no2", no2);*/
		return adminDAO.getSmallOptionInfo(vo);
	}
	
	// 소옵션  정보구하기 번호로
	public SmallOptionVO getSmallOptionInfo(int no) {
		/*HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("no1", no1);
		map.put("no2", no2);*/
		return adminDAO.getSmallOptionInfo(no);
	}
	
	// 소옵션  수정하기
	public boolean updateSmallOption(SmallOptionVO vo) {
		/*HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("no1", no1);
		map.put("no2", no2);*/
		return adminDAO.updateSmallOption(vo);
	}
	
	// 소옵션 삭제하기
	public boolean deleteSmallOption(int no) {
		return adminDAO.deleteSmallOption(no);
	}
	
	// 소옵션 삽입 
	public boolean addSmallOption(SmallOptionVO vo) {
		return adminDAO.addSmallOption(vo);
	}
	
	/****************************************
	 * 상품 & 소옵션 데이터 넣기
	 ****************************************/
	// 소옵션 삽입 
	public boolean insertGoodsSmallOption(Long no, String sopt) {
		HashMap<String, Long> map = new HashMap<String, Long>();
		map.put("goodsNo", no);
		map.put("soptionData", Long.parseLong(sopt));
		return adminDAO.insertGoodsSmallOption(map);
	}
	
}
