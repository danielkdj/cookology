package org.oaoc.cookology.order.model.vo;

import java.sql.Timestamp;

public class Order implements java.io.Serializable {
	private static final long serialVersionUID = -2722983012502663838L;

	private int order_seq_id;							// PK - 주문고유번호(SEQ)

	private String user_email;							// 유저이메일(아이디)
	private String user_name;							// 유저 이름
	private String user_phone; 							// 유저 핸드폰번호
	private String user_address; 						// 유저 주소
	private String user_postcode; 						// 유저 우편번호
	private String product_name; 						// 상품 이름
	private int price;									// 가격
	private int number;									// 상품 갯수
	private int amount;									// 총금액
	private String order_success;						// 주문성공여부
	private java.sql.Timestamp create_at;				// 생성일시
	private int point;									// 사용가능한 포인트
	private int deliveryfee	;							// 배송비

	public Order() {
		super();
	}
	public Order(int order_seq_id, int cart_seq_id, String user_email, int price, int number, int amount, String order_success,
				 Timestamp create_at) {
		super();
		this.order_seq_id = order_seq_id;
		this.cart_seq_id = cart_seq_id;
		this.user_email = user_email;
		this.price = price;
		this.number = number;
		this.amount = amount;
		this.order_success = order_success;
		this.create_at = create_at;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public int getOrder_se_id() {
		return order_seq_id;
	}
	public int getCart_seq_id() {
		return cart_seq_id;
	}
	public String getUser_email() {
		return user_email;
	}
	public int getPrice() {
		return price;
	}
	public int getNumber() {
		return number;
	}
	public int getAmount() {
		return amount;
	}
	public String getOrder_success() {
		return order_success;
	}
	public java.sql.Timestamp getCreate_at() {
		return create_at;
	}
	public void setOrder_seq_id(int order_seq_id) {
		this.order_seq_id = order_seq_id;
	}
	public void setCart_seq_id(int cart_seq_id) {
		this.cart_seq_id = cart_seq_id;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public void setOrder_success(String order_success) {
		this.order_success = order_success;
	}
	public void setCreate_at(java.sql.Timestamp create_at) {
		this.create_at = create_at;
	}
	@Override
	public String toString() {
		return "Cart [order_seq_id=" + order_seq_id + ", cart_seq_id=" + cart_seq_id + ", user_email=" + user_email + ", price=" + price
				+ ", number=" + number + ", amount=" + amount + ", order_success=" + order_success + ", create_at="
				+ create_at + "]";
	}



}
