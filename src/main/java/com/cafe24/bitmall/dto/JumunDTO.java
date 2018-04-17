package com.cafe24.bitmall.dto;

public class JumunDTO {
	private String orderDate;
	private Long orderNo;
	private String name;
	private int totalPrice;
	private int status;
	
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public Long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "JumunDTO [orderDate=" + orderDate + ", orderNo=" + orderNo + ", name=" + name + ", totalPrice="
				+ totalPrice + ", status=" + status + "]";
	}
}
