package org.oaoc.cookology.event.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class VisitorLogs implements Serializable {
    private static final long serialVersionUID = 2509643006882261157L;

    private String page;
    private String ipaddress;
    private Date time;


    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getIpaddress() {
        return ipaddress;
    }

    public void setIpaddress(String ipaddress) {
        this.ipaddress = ipaddress;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Override
    public String toString() {
        return "VisitorLogs{" +
                "page='" + page + '\'' +
                ", ipaddress='" + ipaddress + '\'' +
                ", time=" + time +
                '}';
    }
}
