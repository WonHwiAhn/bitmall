package com.cafe24.bitmall.vo;

public class CategoryVO {
	private Long no;
	private String name;
	private int depth;
	
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
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [no=" + no + ", name=" + name + ", depth=" + depth + "]";
	}
}
