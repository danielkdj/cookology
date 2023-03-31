package org.oaoc.cookology.order.model.vo;

import java.sql.Timestamp;

public class Order implements java.io.Serializable {
		private static final long serialVersionUID = -2722983012502663838L;

		private int order_id;								// PK - 주문고유번호(SEQ)
		private int cart_id;								// 장바구니고유번호
		private String user_email;							// 유저이메일(아이디)
		private int price;									// 가격
		private int number;									// 상품 갯수
		private int amount;									// 총금액
		private String order_success;						// 주문성공여부
		private java.sql.Timestamp create_at;				// 생성일시

		public Order() {
			super();
		}
		public Order(int order_id, int cart_id, String user_email, int price, int number, int amount, String order_success,
					Timestamp create_at) {
			super();
			this.order_id = order_id;
			this.cart_id = cart_id;
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
		public int getOrder_id() {
			return order_id;
		}
		public int getCart_id() {
			return cart_id;
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
		public void setOrder_id(int order_id) {
			this.order_id = order_id;
		}
		public void setCart_id(int cart_id) {
			this.cart_id = cart_id;
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
			return "Cart [order_id=" + order_id + ", cart_id=" + cart_id + ", user_email=" + user_email + ", price=" + price
					+ ", number=" + number + ", amount=" + amount + ", order_success=" + order_success + ", create_at="
					+ create_at + "]";
		}



	}
