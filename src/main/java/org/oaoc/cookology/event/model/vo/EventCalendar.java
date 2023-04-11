package org.oaoc.cookology.event.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class EventCalendar implements Serializable {
    private static final long serialVersionUID = -9134691912235121408L;
    private String eventcalendar_uuid;
    private Date start;
    private Date end;
    private String title;
    private String url;
    private String backgroundcolor;
    private String description;
    private String content;

    public String getEventcalendar_uuid() {
        return eventcalendar_uuid;
    }

    public void setEventcalendar_uuid(String eventcalendar_uuid) {
        this.eventcalendar_uuid = eventcalendar_uuid;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getBackgroundcolor() {
        return backgroundcolor;
    }

    public void setBackgroundcolor(String backgroundcolor) {
        this.backgroundcolor = backgroundcolor;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}


/*
* create table EVENTCALEDAR
(
    EVENTCALENDAR_UUID VARCHAR2(255) not null
        constraint EVENTCALEDAR_PK
        primary key,
    "start"            DATE,
    END                DATE,
    TITLE              VARCHAR2(255),
    URL                NUMBER,
    BACKGROUNDCOLOR    VARCHAR2(30),
    DESCRIPTION        VARCHAR2(300),
    CONTENT            NCLOB
)
    /

*
* */