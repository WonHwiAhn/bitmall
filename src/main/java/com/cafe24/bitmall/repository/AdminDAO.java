package com.cafe24.bitmall.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.bitmall.vo.CustomerVO;
import com.cafe24.bitmall.vo.OptionVO;
import com.cafe24.bitmall.vo.SmallOptionVO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 키워드 있을 때 리스트 구하는 쿼리
	public List<CustomerVO> getList(){
		return sqlSession.selectList("admin.getListNo");
	}
	
	// 키워드 있을 때 리스트 구하는 쿼리
	public List<CustomerVO> getList(HashMap<String, String> map){
		System.out.println("DAO map ==> " + map );
		return sqlSession.selectList("admin.getList", map);
	}
	
	// 키워드 없을 때 리스트 구하는 쿼리
	public List<CustomerVO> getList(int page){
		return sqlSession.selectList("admin.getListInt", page);
	}
	
	// 회원 수 구해오는 쿼리
	public int getTotalCount() {
		return sqlSession.selectOne("admin.getCustomerTotalCountNoOption");
	}
	
	// 회원 수 구해오는 쿼리
	public int getTotalCount(HashMap<String, String> map) {
		return sqlSession.selectOne("admin.getCustomerTotalCount", map);
	}
	
	// 회원 삭제
	public boolean deleteMember(Long no) {
		int count = sqlSession.delete("admin.deleteMember", no);
		return count == 1;
	}
	
	/****************************************
	 * 옵션
	 ****************************************/
	
	// 옵션 추가 쿼리
	public boolean addOption(String optionName) {
		int count = sqlSession.insert("admin.addOption", optionName);
		return count == 1;
	}
	
	// 옵션 리스트 구하는 쿼리
	public List<OptionVO> getOptionList() {
		List<OptionVO> list = sqlSession.selectList("admin.getOptionList");
		return list;
	}
	
	// 옵션 리스트 구하는 쿼리
	public int getOptionCount() {
		return sqlSession.selectOne("admin.getOptionCount");
	}
	
	// 옵션 번호를 통해서 옵션 정보 가져오기
	public OptionVO getOptionInfo(int no) {
		return sqlSession.selectOne("admin.getOptionInfo", no);
	}
	
	// 옵션 번호를 통해서 옵션 정보 가져오기
	public List<OptionVO> getOptionInfo(Long no) {
		return sqlSession.selectList("admin.getOptionInfoLong", no);
	}
	
	// 옵션 번호를 통해서 옵션 정보 가져오기
	public boolean updateOption(OptionVO vo) {
		int count = sqlSession.update("admin.updateOption", vo);
		return count == 1;
	}
	
	// 옵션 번호를 통해서 옵션 삭제하기
	public boolean deleteOption(int no) {
		int count = sqlSession.delete("admin.deleteOption", no);
		return count == 1;
	}
	
	/****************************************
	 * 소옵션
	 ****************************************/
	// 소옵션 리스트 구하기 --> 소옵션 번호로 구하는 것!
	public List<SmallOptionVO> getSmallOptionList(int no) {
		return sqlSession.selectList("admin.getSmallOptionList", no);
	}
	
	// 소옵션 리스트 구하기 --> 옵션 번호로 구하는 것!
	public List<SmallOptionVO> getSmallOptionList(Long no) {
		return sqlSession.selectList("admin.getSmallOptionList", no);
	}
	
	// 소옵션 정보 구하기
	public SmallOptionVO getSmallOptionInfo(SmallOptionVO vo) {
		return sqlSession.selectOne("admin.getSmallOptionInfo", vo);
	}
	
	// 소옵션 정보 구하기
	public SmallOptionVO getSmallOptionInfo(int no) {
		return sqlSession.selectOne("admin.getSmallOptionInfoInt", no);
	}

	// 소옵션 수정하기
	public boolean updateSmallOption(SmallOptionVO vo) {
		int count = sqlSession.update("admin.updateSmallOption", vo);
		return count == 1;
	}
	
	// 소옵션 수정하기
	public boolean deleteSmallOption(int no) {
		int count = sqlSession.delete("admin.deleteSmallOption", no);
		return count == 1;
	}
	
	// 소옵션 추가 쿼리
	public boolean addSmallOption(SmallOptionVO vo) {
		int count = sqlSession.insert("admin.addSmallOption", vo);
		return count == 1;
	}
	
	/****************************************
	 * 상품 & 소옵션 데이터 넣기
	 ****************************************/
	
	public boolean insertGoodsSmallOption(HashMap<String, Long> map) {
		int count = sqlSession.insert("admin.insertGoodsSmallOption", map);
		return count == 1;
	}
}
