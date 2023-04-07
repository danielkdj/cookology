package org.oaoc.cookology.users.model.vo;

import java.sql.Date;
import java.util.Objects;

public class Users implements java.io.Serializable {
		
	private static final long serialVersionUID = 5920902628854033976L;

// Fields 
	private String user_email;				// 유저이메일
	private String is_admin;

	private String user_password;				// 유저 패스워드

	private String user_name;				// 유저이름
	private String user_nickname;
	private String user_phone;					// 유저 연락처
	private Date create_at;					// 생성일시 
	private Date modified_at;				// 수정일시
	private String account_activation;				// 관리자 여부
	private String user_allergy;			// 사용자알러지정보
	private String user_profile_url;






// Constructor 

	public Users() {
	}

	public Users(String user_email, String user_password, String user_name, String user_phone, Date create_at, Date modified_at, String is_admin, String user_allergy, String user_profile_url, String account_activation, String user_nickname) {
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.create_at = create_at;
		this.modified_at = modified_at;
		this.is_admin = is_admin;
		this.user_allergy = user_allergy;
		this.user_profile_url = user_profile_url;
		this.account_activation = account_activation;
		this.user_nickname = user_nickname;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
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

	public String getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(String is_admin) {
		this.is_admin = is_admin;
	}

	public String getUser_allergy() {
		return user_allergy;
	}

	public void setUser_allergy(String user_allergy) {
		this.user_allergy = user_allergy;
	}

	public String getUser_profile_url() {
		return user_profile_url;
	}

	public void setUser_profile_url(String user_profile_url) {
		this.user_profile_url = user_profile_url;
	}

	public String getAccount_activation() {
		return account_activation;
	}

	public void setAccount_activation(String account_activation) {
		this.account_activation = account_activation;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	@Override
	public String toString() {
		return "Users{" +
				"user_email='" + user_email + '\'' +
				", user_password='" + user_password + '\'' +
				", user_name='" + user_name + '\'' +
				", user_phone=" + user_phone +
				", create_at=" + create_at +
				", modified_at=" + modified_at +
				", is_admin='" + is_admin + '\'' +
				", user_allergy='" + user_allergy + '\'' +
				", user_profile_url='" + user_profile_url + '\'' +
				", account_activation='" + account_activation + '\'' +
				", user_nickname='" + user_nickname + '\'' +
				'}';
	}

}
