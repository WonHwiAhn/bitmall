package com.cafe24.bitmall.vo;

public class CartVO {
	private int count;
	private int status;
	private String option;
	private Long goodsNo;
	private Long customerNo;
	private Long orderNo;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public Long getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(Long goodsNo) {
		this.goodsNo = goodsNo;
	}
	public Long getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(Long customerNo) {
		this.customerNo = customerNo;
	}
	public Long getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Long orderNo) {
		this.orderNo = orderNo;
	}
	
	@Override
	public String toString() {
		return "CartVO [count=" + count + ", status=" + status + ", option=" + option + ", goodsNo=" + goodsNo
				+ ", customerNo=" + customerNo + ", orderNo=" + orderNo + "]";
	}
}
