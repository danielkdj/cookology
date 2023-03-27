package org.oaoc.cookology.users.model.vo;

import java.sql.Date;

public class Users implements java.io.Serializable {
		
	private static final long serialVersionUID = 5920902628854033976L;

// Fields 
	private String user_email;				// 유저이메일
	private String user_pwd;				// 유저 패스워드
	private String user_name;				// 유저이름
	private int user_phone;					// 유저 연락처
	private Date create_at;					// 생성일시 
	private Date modifyed_at;				// 수정일시
	private String login_ok;				// 계정 활성화여부	
	private String admin_ok;				// 관리자 여부	
	private String user_allergy;			// 사용자알러지정보

// Constructor 
	public Users() {
		super();
	}
	public Users(String user_email, String user_pwd, String user_name, int user_phone, Date create_at, Date modifyed_at,
			String login_ok, String admin_ok, String user_allergy) {
		super();
		this.user_email = user_email;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_phone = user_phone;
		this.create_at = create_at;
		this.modifyed_at = modifyed_at;
		this.login_ok = login_ok;
		this.admin_ok = admin_ok;
		this.user_allergy = user_allergy;
	}
// Method
	
	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getUser_phone() {
		return user_phone;
	}
	
	public void setUser_phone(int user_phone) {
		this.user_phone = user_phone;
	}
	public Date getCreate_at() {
		return create_at;
	}
	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}
	public Date getModifyed_at() {
		return modifyed_at;
	}
	public void setModifyed_at(Date modifyed_at) {
		this.modifyed_at = modifyed_at;
	}
	public String getLogin_ok() {
		return login_ok;
	}
	public void setLogin_ok(String login_ok) {
		this.login_ok = login_ok;
	}
	public String getadmin_ok() {
		return admin_ok;
	}
	public void setAdmin_ok(String admin_ok) {
		this.admin_ok = admin_ok;
	}
	public String getUser_allergy() {
		return user_allergy;
	}
	public void setUser_allergy(String user_allergy) {
		this.user_allergy = user_allergy;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "Member [user_email=" + user_email + "user_pwd=" + user_pwd + ", user_name=" + user_name
				+ ", user_phone=" + user_phone + ", create_at=" + create_at + ", modifyed_at=" + modifyed_at
				+ ", account_activation=" + login_ok + ", admin_ok=" + admin_ok + ", user_allergy=" + user_allergy + "]";
	}	
}
