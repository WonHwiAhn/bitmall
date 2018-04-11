package com.cafe24.bitmall.vo;

public class GoodsVO {
	private Long no;
	private String title;
	private String name;
	private String maker;
	private int price;
	private String description;
	private Long categoryNo;
	private Long iconNo;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Long getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(Long categoryNo) {
		this.categoryNo = categoryNo;
	}
	public Long getIconNo() {
		return iconNo;
	}
	public void setIconNo(Long iconNo) {
		this.iconNo = iconNo;
	}
	
	@Override
	public String toString() {
		return "GoodsVO [no=" + no + ", title=" + title + ", name=" + name + ", maker=" + maker + ", price=" + price
				+ ", description=" + description + ", categoryNo=" + categoryNo + ", iconNo=" + iconNo + "]";
	}
}
