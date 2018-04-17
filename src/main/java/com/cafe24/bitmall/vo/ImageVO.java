package com.cafe24.bitmall.vo;

public class ImageVO {
	private Long no;
	private String src;
	private Long goodsNo;
	
	public ImageVO() {}
	
	public ImageVO(String src, Long goodsNo) {
		this.src = src;
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
	public Long getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(Long goodsNo) {
		this.goodsNo = goodsNo;
	}
	
	@Override
	public String toString() {
		return "ImageVO [no=" + no + ", src=" + src + ", goods_no=" + goodsNo + "]";
	}
}
