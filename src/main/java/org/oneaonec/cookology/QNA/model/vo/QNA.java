package org.oneaonec.cookology.QNA.model.vo;

import java.sql.Date;

public class QNA {
  private int qna_seq_id;
  private String  user_email;
  private String  q_title;
  private String  q_content;
  private Date  q_create_at;
  private Date  q_modified_at;
  private String   a_content;
  private Date  a_create_at;
  private Date  a_modified_at;
  private String  issolved;

  public QNA() {
}

public QNA(int qna_seq_id, String user_email, String q_title, String q_content, Date q_create_at, Date q_modified_at,
        String a_content, Date a_create_at, Date a_modified_at, String issolved) {
    this.qna_seq_id = qna_seq_id;
    this.user_email = user_email;
    this.q_title = q_title;
    this.q_content = q_content;
    this.q_create_at = q_create_at;
    this.q_modified_at = q_modified_at;
    this.a_content = a_content;
    this.a_create_at = a_create_at;
    this.a_modified_at = a_modified_at;
    this.issolved = issolved;
}

public int getQna_seq_id() {
    return qna_seq_id;
}

public void setQna_seq_id(int qna_seq_id) {
    this.qna_seq_id = qna_seq_id;
}

public String getUser_email() {
    return user_email;
}

public void setUser_email(String user_email) {
    this.user_email = user_email;
}

public String getQ_title() {
    return q_title;
}

public void setQ_title(String q_title) {
    this.q_title = q_title;
}

public String getQ_content() {
    return q_content;
}

public void setQ_content(String q_content) {
    this.q_content = q_content;
}

public Date getQ_create_at() {
    return q_create_at;
}

public void setQ_create_at(Date q_create_at) {
    this.q_create_at = q_create_at;
}

public Date getQ_modified_at() {
    return q_modified_at;
}

public void setQ_modified_at(Date q_modified_at) {
    this.q_modified_at = q_modified_at;
}

public String getA_content() {
    return a_content;
}

public void setA_content(String a_content) {
    this.a_content = a_content;
}

public Date getA_create_at() {
    return a_create_at;
}

public void setA_create_at(Date a_create_at) {
    this.a_create_at = a_create_at;
}

public Date getA_modified_at() {
    return a_modified_at;
}

public void setA_modified_at(Date a_modified_at) {
    this.a_modified_at = a_modified_at;
}

public String getIssolved() {
    return issolved;
}

public void setIssolved(String issolved) {
    this.issolved = issolved;
}

@Override
public String toString() {
    return "QNA [qna_seq_id=" + qna_seq_id + ", user_email=" + user_email + ", q_title=" + q_title + ", q_content="
            + q_content + ", q_create_at=" + q_create_at + ", q_modified_at=" + q_modified_at + ", a_content="
            + a_content + ", a_create_at=" + a_create_at + ", a_modified_at=" + a_modified_at + ", issolved=" + issolved
            + "]";
}


  
}
