package com.cafe24.bitmall.vo;

public class SmallOptionVO {
	private Long no;
	private String name;
	private Long optionNo;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long  no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(Long  optionNo) {
		this.optionNo = optionNo;
	}
	
	@Override
	public String toString() {
		return "SmallOptionVO [no=" + no + ", name=" + name + ", optionNo=" + optionNo + "]";
	}
}
