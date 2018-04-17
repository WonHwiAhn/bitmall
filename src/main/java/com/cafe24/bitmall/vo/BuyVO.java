package com.cafe24.bitmall.vo;

public class BuyVO {
	private Long rNo;
	private int rTotalPrice;
	private String rZipcode;
	private String rDestination;
	private String rOrderNo;
	private String rOrderDate;
	private int rPaymentMethod;
	private String rRequire;
	private int rStatus;
	private Long rCustomerNo;
	
	
	public int getrStatus() {
		return rStatus;
	}
	public void setrStatus(int rStatus) {
		this.rStatus = rStatus;
	}
	public Long getrNo() {
		return rNo;
	}
	public void setrNo(Long rNo) {
		this.rNo = rNo;
	}
	public int getrTotalPrice() {
		return rTotalPrice;
	}
	public void setrTotalPrice(int rTotalPrice) {
		this.rTotalPrice = rTotalPrice;
	}
	public String getrZipcode() {
		return rZipcode;
	}
	public void setrZipcode(String rZipcode) {
		this.rZipcode = rZipcode;
	}
	public String getrDestination() {
		return rDestination;
	}
	public void setrDestination(String rDestination) {
		this.rDestination = rDestination;
	}
	public String getrOrderNo() {
		return rOrderNo;
	}
	public void setrOrderNo(String rOrderNo) {
		this.rOrderNo = rOrderNo;
	}
	public String getrOrderDate() {
		return rOrderDate;
	}
	public void setrOrderDate(String rOrderDate) {
		this.rOrderDate = rOrderDate;
	}
	public int getrPaymentMethod() {
		return rPaymentMethod;
	}
	public void setrPaymentMethod(int rPaymentMethod) {
		this.rPaymentMethod = rPaymentMethod;
	}
	public String getrRequire() {
		return rRequire;
	}
	public void setrRequire(String rRequire) {
		this.rRequire = rRequire;
	}
	public Long getrCustomerNo() {
		return rCustomerNo;
	}
	public void setrCustomerNo(Long rCustomerNo) {
		this.rCustomerNo = rCustomerNo;
	}
	
	@Override
	public String toString() {
		return "BuyVO [rNo=" + rNo + ", rTotalPrice=" + rTotalPrice + ", rZipcode=" + rZipcode + ", rDestination="
				+ rDestination + ", rOrderNo=" + rOrderNo + ", rOrderDate=" + rOrderDate + ", rPaymentMethod="
				+ rPaymentMethod + ", rRequire=" + rRequire + ", rStatus=" + rStatus + ", rCustomerNo=" + rCustomerNo
				+ "]";
	}
}
