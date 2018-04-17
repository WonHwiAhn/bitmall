package com.cafe24.bitmall.vo;

public class IconVO {
	private Long no;
	private String name;
	private String src;
	
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
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	
	@Override
	public String toString() {
		return "IconVO [no=" + no + ", name=" + name + ", src=" + src + "]";
	}
}
