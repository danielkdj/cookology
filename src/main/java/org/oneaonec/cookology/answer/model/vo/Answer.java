package org.oneaonec.cookology.answer.model.vo;

import java.sql.Date;

public class Answer{

    private String user_email;
    private int answer_seq_id;
    private int question_seq_id;
    private String admin_id;
    private String content;
    private Date modified_at;
    

    public Answer(String user_email, int answer_seq_id, int question_seq_id, String admin_id, String content,
            Date modified_at, Date create_at) {
        this.user_email = user_email;
        this.answer_seq_id = answer_seq_id;
        this.question_seq_id = question_seq_id;
        this.admin_id = admin_id;
        this.content = content;
        this.modified_at = modified_at;
        this.create_at = create_at;
    }

    private Date create_at;
    
    public Answer() {
    }

    public String getUser_email() {
        return user_email;
    }

    public int getAnswer_seq_id() {
        return answer_seq_id;
    }

    public int getQuestion_seq_id() {
        return question_seq_id;
    }

    public String getAdmin_id() {
        return admin_id;
    }

    public String getContent() {
        return content;
    }

    public Date getModified_at() {
        return modified_at;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public void setAnswer_seq_id(int answer_seq_id) {
        this.answer_seq_id = answer_seq_id;
    }

    public void setQuestion_seq_id(int question_seq_id) {
        this.question_seq_id = question_seq_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setModified_at(Date modified_at) {
        this.modified_at = modified_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    
}
