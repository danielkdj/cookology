package org.oaoc.cookology.order.model.vo;

import java.sql.Timestamp;

public class Order implements java.io.Serializable {
	
// Fields
	private static final long serialVersionUID = -2722983012502663838L;
	
	private int order_id;								// PK - 주문고유번호(SEQ)
	private int cart_seq_id;							// 장바구니고유번호
	private String user_email;							// 유저이메일(아이디)
	private int amount;									// 총금액
	private String cancellation;						// 취소여부
	private String order_success;						// 주문성공여부
	private java.sql.Timestamp create_at;				// 생성일시
	private java.sql.Timestamp modified_at;				// 수정일시
	
// Constructor 	
	public Order() {
		super();
	}
	public Order(int order_id, int cart_seq_id, String user_email, int amount, String cancellation,
			String order_success, Timestamp create_at, Timestamp modified_at) {
		super();
		this.order_id = order_id;
		this.cart_seq_id = cart_seq_id;
		this.user_email = user_email;
		this.amount = amount;
		this.cancellation = cancellation;
		this.order_success = order_success;
		this.create_at = create_at;
		this.modified_at = modified_at;
	}
	
	
// Method
		
	// Getters 
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getOrder_id() {
		return order_id;
	}
	public int getCart_seq_id() {
		return cart_seq_id;
	}
	public String getUser_email() {
		return user_email;
	}
	public int getAmount() {
		return amount;
	}
	public String getCancellation() {
		return cancellation;
	}
	public String getOrder_success() {
		return order_success;
	}
	public java.sql.Timestamp getCreate_at() {
		return create_at;
	}
	public java.sql.Timestamp getModified_at() {
		return modified_at;
	}
	
	// Setters
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public void setCart_seq_id(int cart_seq_id) {
		this.cart_seq_id = cart_seq_id;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public void setCancellation(String cancellation) {
		this.cancellation = cancellation;
	}
	public void setOrder_success(String order_success) {
		this.order_success = order_success;
	}
	public void setCreate_at(java.sql.Timestamp create_at) {
		this.create_at = create_at;
	}
	public void setModified_at(java.sql.Timestamp modified_at) {
		this.modified_at = modified_at;
	}
	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", cart_seq_id=" + cart_seq_id + ", user_email=" + user_email
				+ ", amount=" + amount + ", cancellation=" + cancellation + ", order_success=" + order_success
				+ ", create_at=" + create_at + ", modified_at=" + modified_at + "]";
	}
		
}
