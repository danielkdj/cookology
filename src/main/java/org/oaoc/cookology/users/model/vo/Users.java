package org.oaoc.cookology.users.model.vo;

import java.util.Date;

public class Users implements java.io.Serializable{

	private static final long serialVersionUID = 5685729819318919369L;
	private String user_email;
	private String user_password;
	private String user_name;
	private String user_phone;
	private String user_address1;
	private String user_address2;
	private String user_post_code;
	private String user_allergy;
	private Date create_at;
	private Date modified_at;
	private String login_ok;
	private String is_admin;

	public Users(){}

	public Users(String user_email, String user_password, String user_name, String user_phone, String user_address1, String user_address2, String user_post_code, String user_allergy, Date create_at, Date modified_at, String login_ok, String is_admin) {
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.user_address1 = user_address1;
		this.user_address2 = user_address2;
		this.user_post_code = user_post_code;
		this.user_allergy = user_allergy;
		this.create_at = create_at;
		this.modified_at = modified_at;
		this.login_ok = login_ok;
		this.is_admin = is_admin;
	}

	public String getUser_email() {return user_email;}

	public void setUser_email(String users_email) {this.user_email = users_email;}

	public String getUser_password() {return user_password;}

	public void setUser_password(String user_password) {this.user_password = user_password;}

	public String getUser_name() {return user_name;}

	public void setUser_name(String user_name) {this.user_name = user_name;}

	public String getUser_phone() {return user_phone;}

	public void setUser_phone(String user_phone) {this.user_phone = user_phone;}

	public String getUser_address1() {return user_address1;}

	public void setUser_address1(String user_address1) {this.user_address1 = user_address1;}

	public String getUser_address2() {return user_address2;}

	public void setUser_address2(String user_address2) {this.user_address2 = user_address2;}

	public String getUser_post_code() {return user_post_code;}

	public void setUser_post_code(String user_post_code) {this.user_post_code = user_post_code;}

	public String getUser_allergy() {return user_allergy;}

	public void setUser_allergy(String user_allergy) {this.user_allergy = user_allergy;}

	public Date getCreate_at() {return create_at;}

	public void setCreate_at(Date create_at) {this.create_at = create_at;}

	public Date getModified_at() {return modified_at;}

	public void setModified_at(Date modified_at) {this.modified_at = modified_at;}

	public String getLogin_ok() {return login_ok;}

	public void setLogin_ok(String login_ok) {this.login_ok = login_ok;}

	public String getIs_admin() {return is_admin;}

	public void setIs_admin(String is_admin) {this.is_admin = is_admin;}

	@Override
	public String toString() {
		return "Users{" +
				"user_email='" + user_email + '\'' +
				", user_password='" + user_password + '\'' +
				", user_name='" + user_name + '\'' +
				", user_phone='" + user_phone + '\'' +
				", user_address1='" + user_address1 + '\'' +
				", user_address2='" + user_address2 + '\'' +
				", user_post_code='" + user_post_code + '\'' +
				", user_allergy='" + user_allergy + '\'' +
				", create_at=" + create_at +
				", modified_at=" + modified_at +
				", login_ok='" + login_ok + '\'' +
				", is_admin='" + is_admin + '\'' +
				'}';
	}
}