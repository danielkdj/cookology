package org.oaoc.cookology.orders.model.vo;

import java.sql.Date;

public class Orders implements java.io.Serializable {
	private static final long serialVersionUID = -2722983012502663838L;

	private int order_seq_id;							// 주문 고유번호
	private int cart_seq_id;							// 장바구니 고유번호
	private int product_seq_id;							// 상품 고유번호
	private String user_email;							// 유저 이메일
	private int  orders_amount;							// 총금액
	private String orders_success;						// 주문성공여부
	private Date create_at;								// 생성일시
	private int point;									// 사용가능한 포인트
	private int deliveryfee	;							// 배송비

	public Orders() {
		super();
	}
	public Orders(int order_seq_id, int cart_seq_id, int product_seq_id,
				  String user_email, int orders_amount, String orders_success,
				  Date create_at, int point, int deliveryfee) {
		super();
		this.order_seq_id = order_seq_id;
		this.cart_seq_id = cart_seq_id;
		this.product_seq_id = product_seq_id;
		this.user_email = user_email;
		this.orders_amount = orders_amount;
		this.orders_success = orders_success;
		this.create_at = create_at;
		this.point = point;
		this.deliveryfee = deliveryfee;
	}
	public int getOrder_se_id() {
		return order_seq_id;
	}
	public void setOrder_seq_id(int order_seq_id){
		this.order_seq_id = order_seq_id;
	}
	public int getCart_seq_id() {
		return cart_seq_id;
	}
	public void setCart_seq_id(int cart_seq_id) {
		this.cart_seq_id = cart_seq_id;
	}
	public int getProduct_seq_id() {
		return product_seq_id;
	}
	public void setProduct_seq_id (int product_seq_id) {
		this.product_seq_id = product_seq_id;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getOrders_amount() {
		return orders_amount;
	}
	public void setOrders_amount(int orders_amount) {
		this.orders_amount = orders_amount;
	}
	public String getOrders_success() {
		return orders_success;
	}
	public void setOrders_success(String orders_success) {
		this.orders_success = orders_success;
	}
	public Date getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Date create_) {
		this.create_at = create_;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
			this.point = point;
	}
	public int deliveryfee() {
		return deliveryfee;
	}
	public void setDeliveryfee(int deliveryfee) {
		this.deliveryfee = deliveryfee;
	}

	@Override
	public String toString() {
		return "Orders [order_seq_id=" + order_seq_id + ", cart_seq_id=" + cart_seq_id
				+ ", product_seq_id=" + product_seq_id + ", user_email=" + user_email
				+ ", orders_amount=" + orders_amount + ", orders_success="
				+ ", create_at=" + create_at + ", point=" + point + ", deliveryfee="
				+ deliveryfee + "]";
	}
}
