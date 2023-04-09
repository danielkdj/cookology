package org.oaoc.cookology.orders.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Orders implements java.io.Serializable {
	
// Fields
	private static final long serialVersionUID = -2722983012502663838L;
	
	

	

	  
	  private int orders_seq_id;
	  private int cart_seq_id;							// 장바구니고유번호
	  private String business_number;
	  private String product_name;
	  private int product_price;
	  private int product_number;									// 상품 갯수
	  private int amount;
	  private String user_email;
	  private String user_name;
	  private String user_phone;
	  private String user_address;
	  private String user_post_code;
	  private String cancellation;
	  private String orders_success;
	  private int amount_day;
	  private int amount_month;
	  private java.sql.Date create_at;	// 생성일시
	private int point;									// 사용가능한 포인트
	private int deliveryfee	;							// 배송비
	  
	
// Constructor 	
	public Orders() {
		super();
	}


	public Orders(int orders_seq_id, int cart_seq_id, String business_number, String product_name
				, int product_price, int product_number, int amount, String user_email, String user_name
				, String user_phone, String user_address, String user_post_code, String cancellation
				, String orders_success, int amount_day, int amount_month, Date create_at, int point, int deliveryfee) {

		super();
		this.orders_seq_id = orders_seq_id;
		this.cart_seq_id = cart_seq_id;
		this.business_number = business_number;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_number = product_number;
		this.amount = amount;
		this.user_email = user_email;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_address = user_address;
		this.user_post_code = user_post_code;
		this.cancellation = cancellation;
		this.orders_success = orders_success;
		this.amount_day = amount_day;
		this.amount_month = amount_month;
		this.create_at = create_at;
		this.point = point;
		this.deliveryfee = deliveryfee;
	}

	public int getOrders_seq_id() {
        return orders_seq_id;
    }
	public void setOrders_seq_id(int orders_seq_id) {
        this.orders_seq_id = orders_seq_id;
    }
	public int getCart_seq_id() {
        return cart_seq_id;
    }

	
	
}
