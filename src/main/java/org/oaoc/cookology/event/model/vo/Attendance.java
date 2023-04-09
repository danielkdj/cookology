package org.oaoc.cookology.event.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Attendance implements Serializable {
    private static final long serialVersionUID = 7010139793149554411L;
    private String user_email;
    private Date today;

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public Date getToday() {
        return today;
    }

    public void setToday(Date today) {
        this.today = today;
    }

    @Override
    public String toString() {
        return "Attendance{" +
                "user_email='" + user_email + '\'' +
                ", today=" + today +
                '}';
    }
}
