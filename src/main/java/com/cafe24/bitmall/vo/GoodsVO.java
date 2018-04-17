package com.cafe24.bitmall.vo;

public class GoodsVO {
	private Long no;
	private String code;
	private String name;
	private String maker;
	private int price;
	private String description;
	private int status;
	private String iconData;
	private int discount;
	private Long categoryNo;
	private Long optionNo;
	private String soptionData;
	
	
	public String getIconData() {
		return iconData;
	}
	public void setIconData(String iconData) {
		this.iconData = iconData;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getSoptionData() {
		return soptionData;
	}
	public void setSoptionData(String soptionData) {
		this.soptionData = soptionData;
	}
	public Long getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(Long optionNo) {
		this.optionNo = optionNo;
	}
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
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
	
	@Override
	public String toString() {
		return "GoodsVO [no=" + no + ", code=" + code + ", name=" + name + ", maker=" + maker + ", price=" + price
				+ ", description=" + description + ", status=" + status + ", iconData=" + iconData + ", discount="
				+ discount + ", categoryNo=" + categoryNo + ", optionNo=" + optionNo + ", soptionData=" + soptionData
				+ "]";
	}
}
