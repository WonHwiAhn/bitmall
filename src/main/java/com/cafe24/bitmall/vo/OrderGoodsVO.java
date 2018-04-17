package com.cafe24.bitmall.vo;

public class OrderGoodsVO {
	private int count;
	private int price;
	private String payment_info;
	private int status;
	private Long goodsNo;
	private Long orderNo;
	
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
	public String getPayment_info() {
		return payment_info;
	}
	public void setPayment_info(String payment_info) {
		this.payment_info = payment_info;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Long getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(Long goodsNo) {
		this.goodsNo = goodsNo;
	}
	public Long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}
	
	@Override
	public String toString() {
		return "OrderGoodsVO [count=" + count + ", price=" + price + ", payment_info=" + payment_info + ", status="
				+ status + ", goodsNo=" + goodsNo + ", orderNo=" + orderNo + "]";
	}
}
