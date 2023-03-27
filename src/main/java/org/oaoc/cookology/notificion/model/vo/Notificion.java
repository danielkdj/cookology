package org.oaoc.cookology.notificion.model.vo;

import java.sql.Date;
import java.sql.NClob;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


public class Notificion implements java.io.Serializable {
	private static final long serialVersionUID = -236616028496183775L;
 
	private int notifition_seq_id;							// 게시글 고유번호
	private String admin_id;								// 관리자 아이디
	private String notifition_title;						// 게시글 제목
	private NClob notifition_content;				// 게시글 내용
	private Timestamp created_at;					// 게시글 작성시간
	private Timestamp modified_at;					// 게시글 수정시간
	private String user_email;								// 유저 이메일
	private String original_filepath;						// 첨부파일 원래 이름
	private String rename_filepath;							// 첨부파일 바뀐 이름
	
	public Notificion() {
		super();
	}

	public Notificion(int notifition_seq_id, String admin_id, String notifition_title, NClob notifition_content,
			Timestamp created_at, Timestamp modified_at, String user_email, String original_filepath,
			String rename_filepath) {
		super();
		this.notifition_seq_id = notifition_seq_id;
		this.admin_id = admin_id;
		this.notifition_title = notifition_title;
		this.notifition_content = notifition_content;
		this.created_at = created_at;
		this.modified_at = modified_at;
		this.user_email = user_email;
		this.original_filepath = original_filepath;
		this.rename_filepath = rename_filepath;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getNotifition_seq_id() {
		return notifition_seq_id;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public String getNotifition_title() {
		return notifition_title;
	}

	public NClob getNotifition_content() {
		return notifition_content;
	}

	public Timestamp getCreated_at() {
		return created_at;
	}

	public Timestamp getModified_at() {
		return modified_at;
	}

	public String getUser_email() {
		return user_email;
	}

	public String getOriginal_filepath() {
		return original_filepath;
	}

	public String getRename_filepath() {
		return rename_filepath;
	}

	public void setNotifition_seq_id(int notifition_seq_id) {
		this.notifition_seq_id = notifition_seq_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public void setNotifition_title(String notifition_title) {
		this.notifition_title = notifition_title;
	}

	public void setNotifition_content(NClob notifition_content) {
		this.notifition_content = notifition_content;
	}

	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}

	public void setModified_at(Timestamp modified_at) {
		this.modified_at = modified_at;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public void setOriginal_filepath(String original_filepath) {
		this.original_filepath = original_filepath;
	}

	public void setRename_filepath(String rename_filepath) {
		this.rename_filepath = rename_filepath;
	}

	@Override
	public String toString() {
		return "Notificion [notifition_seq_id=" + notifition_seq_id + ", admin_id=" + admin_id + ", notifition_title="
				+ notifition_title + ", notifition_content=" + notifition_content + ", created_at=" + created_at
				+ ", modified_at=" + modified_at + ", user_email=" + user_email + ", original_filepath="
				+ original_filepath + ", rename_filepath=" + rename_filepath + "]";
	}

}