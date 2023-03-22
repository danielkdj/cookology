package org.oneaonec.cookology.question.model.vo;

import java.util.Date;

public class Question {
    
    private int question_seq_id;
    private String user_email;
    private String content;
    private Date create_at;
    private Date modified_at;
    
    public Question(int question_seq_id, String user_email, String content, Date create_at, Date modified_at) {
        this.question_seq_id = question_seq_id;
        this.user_email = user_email;
        this.content = content;
        this.create_at = create_at;
        this.modified_at = modified_at;
    }

    public Question() {
    }

    @Override
    public String toString() {
        return "Question [question_seq_id=" + question_seq_id + ", user_email=" + user_email + ", content=" + content
                + ", create_at=" + create_at + ", modified_at=" + modified_at + "]";
    }
//  getters
    public int getQuestion_seq_id() {
        return question_seq_id;
    }

    public String getUser_email() {
        return user_email;
    }

    public String getContent() {
        return content;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public Date getModified_at() {
        return modified_at;
    }
//  setters
    public void setQuestion_seq_id(int question_seq_id) {
        this.question_seq_id = question_seq_id;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    public void setModified_at(Date modified_at) {
        this.modified_at = modified_at;
    }

    
    
}
