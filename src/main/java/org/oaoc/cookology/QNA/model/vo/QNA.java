package org.oaoc.cookology.QNA.model.vo;


import java.sql.Timestamp;

public class QNA {

    private int qna_seq_id;
    private String user_email;
    private String q_title;
    private String q_content;
    private String q_create_at;
    private String a_content;
    private Timestamp a_create_at;
    private String issolved;

    public QNA() {
    }

    public QNA(int qna_seq_id, String user_email, String q_title, String q_content, String q_create_at, String a_content, Timestamp a_create_at, String issolved) {
        this.qna_seq_id = qna_seq_id;
        this.user_email = user_email;
        this.q_title = q_title;
        this.q_content = q_content;
        this.q_create_at = q_create_at;
        this.a_content = a_content;
        this.a_create_at = a_create_at;
        this.issolved = issolved;
    }

    public QNA(int qna_seq_id, String user_email, String q_title, String q_content, String q_create_at, String issolved) {
        this.qna_seq_id = qna_seq_id;
        this.user_email = user_email;
        this.q_title = q_title;
        this.q_content = q_content;
        this.q_create_at = q_create_at;
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

    public String getQ_create_at() {
        return q_create_at;
    }

    public void setQ_create_at(String q_create_at) {
        this.q_create_at = q_create_at;
    }

    public String getA_content() {
        return a_content;
    }

    public void setA_content(String a_content) {
        this.a_content = a_content;
    }

    public Timestamp getA_create_at() {
        return a_create_at;
    }

    public void setA_create_at(Timestamp a_create_at) {
        this.a_create_at = a_create_at;
    }

    public String getIssolved() {
        return issolved;
    }

    public void setIssolved(String issolved) {
        this.issolved = issolved;
    }

    @Override
    public String toString() {
        return "org.oaoc.cookology.QNA{" +
                "qna_seq_id=" + qna_seq_id +
                ", user_email='" + user_email + '\'' +
                ", q_title='" + q_title + '\'' +
                ", q_content='" + q_content + '\'' +
                ", q_create_at='" + q_create_at + '\'' +
                ", a_content='" + a_content + '\'' +
                ", a_create_at=" + a_create_at +
                ", issolved='" + issolved + '\'' +
                '}';
    }
}
