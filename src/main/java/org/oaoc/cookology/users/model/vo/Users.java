package org.oaoc.cookology.users.model.vo;

import java.util.Date;

public class Users implements java.io.Serializable {

	private static final long serialVersionUID = 5920902628854033976L;

	private String user_profile_url;        //user 프로필사진
	private String user_email;                //user 이메일(ID)
	private String user_password;            //user 비밀번호
	private String user_name;                //user 이름
	private String user_nickname;            //user 닉네임
	private String user_phone;                //user 전화번호
	private String user_address1;            //user 기본주소
	private String user_address2;            //user 상세주소
	private String user_post_code;            //user 우편번호
	private String user_allergy;            //user 알러지정보
	private Date create_at;                    //가입일시
	private Date modified_at;                //수정일시
	private String login_ok;        //계정활성화여부
	private String is_admin;                //관리자 여부

	public Users() {
	}

	public Users(String user_profile_url, String user_email, String user_password, String user_name, String user_nickname, String user_phone, String user_address1, String user_address2, String user_post_code, String user_allergy, Date create_at, Date modified_at, String login_ok, String is_admin) {
		this.user_profile_url = user_profile_url;
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
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

	public String getUser_profile_url() {
		return user_profile_url;
	}

	public void setUser_profile_url(String user_profile_url) {
		this.user_profile_url = user_profile_url;
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

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_address1() {
		return user_address1;
	}

	public void setUser_address1(String user_address1) {
		this.user_address1 = user_address1;
	}

	public String getUser_address2() {
		return user_address2;
	}

	public void setUser_address2(String user_address2) {
		this.user_address2 = user_address2;
	}

	public String getUser_post_code() {
		return user_post_code;
	}

	public void setUser_post_code(String user_post_code) {
		this.user_post_code = user_post_code;
	}

	public String getUser_allergy() {
		return user_allergy;
	}

	public void setUser_allergy(String user_allergy) {
		this.user_allergy = user_allergy;
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

	public String getLogin_ok() {
		return login_ok;
	}

	public void setLogin_ok(String login_ok) {
		this.login_ok = login_ok;
	}

	public String getIs_admin() {
		return is_admin;
	}

	public void setIs_admin(String is_admin) {
		this.is_admin = is_admin;
	}

	@Override
	public String toString() {
		return "Users{" +
				"user_profile_url='" + user_profile_url + '\'' +
				", user_email='" + user_email + '\'' +
				", user_password='" + user_password + '\'' +
				", user_name='" + user_name + '\'' +
				", user_nickname='" + user_nickname + '\'' +
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




