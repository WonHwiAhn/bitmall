package com.cafe24.bitmall.vo;

public class CompanyVO {
	private Long no;
	private String name;
	private String field;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	
	@Override
	public String toString() {
		return "CompanyVO [no=" + no + ", name=" + name + ", field=" + field + "]";
	}
}
