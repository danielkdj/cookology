package org.oaoc.cookology.client.model.vo;

import java.sql.Date;

public class Client implements java.io.Serializable {
	private static final long serialVersionUID = -433439010977819191L;
		
	private String business_number;	//사업자등록번호
	private String client_password;	//비밀번호
	
	private String client_name; 	//상호명
	
	private String client_phone1;	//사업장전화번호
	private String clinet_phone2;	//휴대전화번호
	private String client_email;	//이메일
	private String client_address1;	//기본주소
	private String client_address2;	//상세주소
	private String client_post_code;//우편번호
	private int clame_num;			//클레임받은횟수
	private String account_activation;//계정활성화
	private String client_profile_url;

	
	public Client() {
		super();
	}


	public Client(String business_number, String client_password, String client_name, String client_phone1,
			String clinet_phone2, String client_email, String client_address1, String client_address2,
			String client_post_code, int clame_num, String account_activation, String client_profile_url) {
		super();
		this.business_number = business_number;
		this.client_password = client_password;
		this.client_name = client_name;
		this.client_phone1 = client_phone1;
		this.clinet_phone2 = clinet_phone2;
		this.client_email = client_email;
		this.client_address1 = client_address1;
		this.client_address2 = client_address2;
		this.client_post_code = client_post_code;
		this.clame_num = clame_num;
		this.account_activation = account_activation;
		this.client_profile_url = client_profile_url;
	}


	public String getBusiness_number() {
		return business_number;
	}


	public void setBusiness_number(String business_number) {
		this.business_number = business_number;
	}


	public String getClient_password() {
		return client_password;
	}


	public void setClient_password(String client_password) {
		this.client_password = client_password;
	}


	public String getClient_name() {
		return client_name;
	}


	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}


	public String getClient_phone1() {
		return client_phone1;
	}


	public void setClient_phone1(String client_phone1) {
		this.client_phone1 = client_phone1;
	}


	public String getClinet_phone2() {
		return clinet_phone2;
	}


	public void setClinet_phone2(String clinet_phone2) {
		this.clinet_phone2 = clinet_phone2;
	}


	public String getClient_email() {
		return client_email;
	}


	public void setClient_email(String client_email) {
		this.client_email = client_email;
	}


	public String getClient_address1() {
		return client_address1;
	}


	public void setClient_address1(String client_address1) {
		this.client_address1 = client_address1;
	}


	public String getClient_address2() {
		return client_address2;
	}


	public void setClient_address2(String client_address2) {
		this.client_address2 = client_address2;
	}


	public String getClient_post_code() {
		return client_post_code;
	}


	public void setClient_post_code(String client_post_code) {
		this.client_post_code = client_post_code;
	}


	public int getClame_num() {
		return clame_num;
	}


	public void setClame_num(int clame_num) {
		this.clame_num = clame_num;
	}


	public String getAccount_activation() {
		return account_activation;
	}


	public void setAccount_activation(String account_activation) {
		this.account_activation = account_activation;
	}


	public String getClient_profile_url() {
		return client_profile_url;
	}


	public void setClient_profile_url(String client_profile_url) {
		this.client_profile_url = client_profile_url;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "Client [business_number=" + business_number + ", client_password=" + client_password + ", client_name="
				+ client_name + ", client_phone1=" + client_phone1 + ", clinet_phone2=" + clinet_phone2
				+ ", client_email=" + client_email + ", client_address1=" + client_address1 + ", client_address2="
				+ client_address2 + ", client_post_code=" + client_post_code + ", clame_num=" + clame_num
				+ ", account_activation=" + account_activation + ", client_profile_url=" + client_profile_url + "]";
	}
	
	
	
	
	
	
}
