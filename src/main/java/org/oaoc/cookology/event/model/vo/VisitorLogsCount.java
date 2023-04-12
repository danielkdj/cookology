package org.oaoc.cookology.event.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class VisitorLogsCount implements Serializable {
    private static final long serialVersionUID = 2481543112464618862L;

    private String page;
    private int count;
    private Date hour;

    public Date getHour() {
        return hour;
    }

    public void setHour(Date hour) {
        this.hour = hour;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "VisitorLogsCount{" +
                "page='" + page + '\'' +
                ", count=" + count +
                '}';
    }
}
