package com.cafe24.bitmall.vo;

public class IconDataVO {
	private Long goodsNo;
	private Long iconNo;
	
	public Long getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(Long goodsNo) {
		this.goodsNo = goodsNo;
	}
	public Long getIconNo() {
		return iconNo;
	}
	public void setIconNo(Long iconNo) {
		this.iconNo = iconNo;
	}
	
	@Override
	public String toString() {
		return "IconDataVO [goodsNo=" + goodsNo + ", iconNo=" + iconNo + "]";
	}
}
