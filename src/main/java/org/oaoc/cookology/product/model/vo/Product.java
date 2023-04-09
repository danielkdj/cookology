package org.oaoc.cookology.product.model.vo;

import java.sql.Date;
import java.util.Arrays;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;



public class Product implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	private int product_seq_id;			//��ǰ������ȣ pk	
	private String business_number;		//����� ��� ��ȣ
	private String thumb_url;			//��ǰ�̹��� url
	
	private String product_name;		//��ǰ��
	
	private int price;					//��ǰ�ݾ�
	
	private int stock;					//��ǰ���
	
	private int claims_num;				//Ŭ���� Ƚ��
	
	private Date create_at;	//��ǰ ������
	
	private Date modified_at;	//��ǰ ������
	
	private String admin_inspection;	//������ �˼� ����
	
	private String tag;					//�˻��±׸�
	

	private String original_filepath;	//���� ���� �̸�
	private String rename_filepath;		//�� ���� �̸�
	private String content;
	private int product_no;				//��ǰ ��ȣ
	
	public Product() {
		super();
	}

	public Product(int product_seq_id, String business_number, String thumb_url, String product_name, int price,
			int stock, int claims_num, Date create_at, Date modified_at, String admin_inspection, String tag,
			String original_filepath, String rename_filepath, String content, int product_no) {
		super();
		this.product_seq_id = product_seq_id;
		this.business_number = business_number;
		this.thumb_url = thumb_url;
		this.product_name = product_name;
		this.price = price;
		this.stock = stock;
		this.claims_num = claims_num;
		this.create_at = create_at;
		this.modified_at = modified_at;
		this.admin_inspection = admin_inspection;
		this.tag = tag;
		this.original_filepath = original_filepath;
		this.rename_filepath = rename_filepath;
		this.content = content;
		this.product_no = product_no;
	}

	public int getProduct_seq_id() {
		return product_seq_id;
	}

	public void setProduct_seq_id(int product_seq_id) {
		this.product_seq_id = product_seq_id;
	}

	public String getBusiness_number() {
		return business_number;
	}

	public void setBusiness_number(String business_number) {
		this.business_number = business_number;
	}

	public String getThumb_url() {
		return thumb_url;
	}

	public void setThumb_url(String thumb_url) {
		this.thumb_url = thumb_url;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getClaims_num() {
		return claims_num;
	}

	public void setClaims_num(int claims_num) {
		this.claims_num = claims_num;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	public Date getModified_at() {
		return modified_at;
	}

	public void setModified_at(Date modified_at) {
		this.modified_at = modified_at;
	}

	public String getAdmin_inspection() {
		return admin_inspection;
	}

	public void setAdmin_inspection(String admin_inspection) {
		this.admin_inspection = admin_inspection;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getOriginal_filepath() {
		return original_filepath;
	}

	public void setOriginal_filepath(String original_filepath) {
		this.original_filepath = original_filepath;
	}

	public String getRename_filepath() {
		return rename_filepath;
	}

	public void setRename_filepath(String rename_filepath) {
		this.rename_filepath = rename_filepath;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Product [product_seq_id=" + product_seq_id + ", business_number=" + business_number + ", thumb_url="
				+ thumb_url + ", product_name=" + product_name + ", price=" + price + ", stock=" + stock
				+ ", claims_num=" + claims_num + ", create_at=" + create_at + ", modified_at=" + modified_at
				+ ", admin_inspection=" + admin_inspection + ", tag=" + tag + ", original_filepath=" + original_filepath
				+ ", rename_filepath=" + rename_filepath + ", content=" + content + ", product_no=" + product_no + "]";
	}

	
	
	

	
	
}
