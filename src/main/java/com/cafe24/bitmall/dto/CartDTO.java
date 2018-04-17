package com.cafe24.bitmall.dto;

public class CartDTO {
	private Long no;
	private String src;
	private String name;
	private String option;
	private int count;
	private int price;
	private int totalCount;
	private Long goodsNo;
	
	
	public Long getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(Long goodsNo) {
		this.goodsNo = goodsNo;
	}
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	@Override
	public String toString() {
		return "CartDTO [no=" + no + ", src=" + src + ", name=" + name + ", option=" + option + ", count=" + count
				+ ", price=" + price + ", totalCount=" + totalCount + ", goodsNo=" + goodsNo + "]";
	}
}
