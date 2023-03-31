package org.oaoc.cookology.cart.model.vo;

public class Cart {

	private int cart_id;						// 장바구니 고유번호
	private String user_email;					// 유저 이메일
	private String user_name;					// 유저 이름
	private int product_seq_id;					// 상품 고유번호
	private String product_name;				// 상품 이름
	private double product_discount;			// 할인율
	private int price;							// 상품 가격
	private int number;							// 상품 갯수
	private int amount;							// 상품 총 가격

	// Constructor
	public Cart(int cart_id, String user_email, String user_name, int product_seq_id, String product_name, double product_discount, int price, int number, int amount) {
		this.cart_id = cart_id;
		this.user_email = user_email;
		this.user_name = user_name;
		this.product_seq_id = product_seq_id;
		this.product_name = product_name;
		this.product_discount = product_discount;
		this.price = price;
		this.number = number;
		this.amount = amount;
	}

	// Getters and setters
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getProduct_seq_id() {
		return product_seq_id;
	}
	public void setProduct_seq_id(int product_seq_id) {
		this.product_seq_id = product_seq_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public double getProduct_discount() {
		return product_discount;
	}
	public void setProduct_discount(double product_discount) {
		this.product_discount = product_discount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

}
