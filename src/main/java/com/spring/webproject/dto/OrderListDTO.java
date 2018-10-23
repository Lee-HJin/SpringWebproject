package com.spring.webproject.dto;

public class OrderListDTO {
	
	private int orderId;
	private int orderPrice;
	private String shipmentsStatusCode;
	private String handlingDate;
	private String expectedDate;
	private String status;
	private String mainTitle;
	private String quantity;
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getShipmentsStatusCode() {
		return shipmentsStatusCode;
	}
	public void setShipmentsStatusCode(String shipmentsStatusCode) {
		this.shipmentsStatusCode = shipmentsStatusCode;
	}
	public String getHandlingDate() {
		return handlingDate;
	}
	public void setHandlingDate(String handlingDate) {
		this.handlingDate = handlingDate;
	}
	public String getExpectedDate() {
		return expectedDate;
	}
	public void setExpectedDate(String expectedDate) {
		this.expectedDate = expectedDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getMainTitle() {
		return mainTitle;
	}
	public void setMainTitle(String mainTitle) {
		this.mainTitle = mainTitle;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
}
