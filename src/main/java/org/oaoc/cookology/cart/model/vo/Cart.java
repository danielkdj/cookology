package org.oaoc.cookology.cart.model.vo;

public class Cart {
	    
	    private int cart_id;
	    private String user_email;
	    private String user_name;
	    private int product_seq_id ;
	    private String product_name;
	    private int price;
	    private int number;
	    private int amount;
	    
		public Cart() {
			super();
		}
		public Cart(int cart_id, String user_email, String user_name, int product_seq_id, String product_name,
				int price, int number, int amount) {
			super();
			this.cart_id = cart_id;
			this.user_email = user_email;
			this.user_name = user_name;
			this.product_seq_id = product_seq_id;
			this.product_name = product_name;
			this.price = price;
			this.number = number;
			this.amount = amount;
		}
		
		public int getCart_id() {
			return cart_id;
		}
		public String getUser_email() {
			return user_email;
		}
		public String getUser_name() {
			return user_name;
		}
		public int getProduct_seq_id() {
			return product_seq_id;
		}
		public String getProduct_name() {
			return product_name;
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
		
		public void setCart_id(int cart_id) {
			this.cart_id = cart_id;
		}
		public void setUser_email(String user_email) {
			this.user_email = user_email;
		}
		public void setUser_name(String user_name) {
			this.user_name = user_name;
		}
		public void setProduct_seq_id(int product_seq_id) {
			this.product_seq_id = product_seq_id;
		}
		public void setProduct_name(String product_name) {
			this.product_name = product_name;
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
		
		@Override
		public String toString() {
			return "Cart [cart_id=" + cart_id + ", user_email=" + user_email + ", user_name=" + user_name
					+ ", product_seq_id=" + product_seq_id + ", product_name=" + product_name + ", price=" + price
					+ ", number=" + number + ", amount=" + amount + "]";
		}
	    
}
