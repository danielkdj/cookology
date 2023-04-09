package org.oaoc.cookology.productDescription.model.vo;



public class ProductDescription implements java.io.Serializable {

	private static final long serialVersionUID = 3259544964729895681L;
		
	
	private int product_seq_id;
	private String original_img;
	private String rename_img;
	private String description; // 밀키트 설명
	
	public ProductDescription() {
		super();
	}

	public ProductDescription(int product_seq_id, String original_img, String rename_img, String description) {
		super();
		this.product_seq_id = product_seq_id;
		this.original_img = original_img;
		this.rename_img = rename_img;
		this.description = description;
	}

	public int getProduct_seq_id() {
		return product_seq_id;
	}

	public void setProduct_seq_id(int product_seq_id) {
		this.product_seq_id = product_seq_id;
	}

	public String getOriginal_img() {
		return original_img;
	}

	public void setOriginal_img(String original_img) {
		this.original_img = original_img;
	}

	public String getRename_img() {
		return rename_img;
	}

	public void setRename_img(String rename_img) {
		this.rename_img = rename_img;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ProductDescription [product_seq_id=" + product_seq_id + ", original_img=" + original_img
				+ ", rename_img=" + rename_img + ", description=" + description + "]";
	}

	
	
	
	
	
	
	
	
	
	
}
