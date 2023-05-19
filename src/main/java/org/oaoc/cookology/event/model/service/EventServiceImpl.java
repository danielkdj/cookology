package org.oaoc.cookology.event.model.service;

import org.oaoc.cookology.event.model.dao.EventDao;
import org.oaoc.cookology.event.model.vo.Attendance;
import org.oaoc.cookology.event.model.vo.EventCalendar;
import org.oaoc.cookology.event.model.vo.VisitorLogs;
import org.oaoc.cookology.event.model.vo.VisitorLogsCount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class EventServiceImpl implements  EventService{
    @Autowired
    EventDao eventDao;

    public EventServiceImpl() {
    }

    public ArrayList<Attendance> selectAttendance(String user_email) {
        return eventDao.selectAttendance(user_email);
    }

    public int insertAttendance(Attendance attendance) {
        return eventDao.insertAttendance(attendance);
    }

    @Override
    public int insertEventCalendar(EventCalendar eventCalendar) {
        return eventDao.insertEventCalendar(eventCalendar);
    }

    @Override
    public ArrayList<EventCalendar> selectEventCalendar() {
        return eventDao.selectEventCalendar();
    }

    @Override
    public EventCalendar selectDetailEventCalendar(String eventcalendar_uuid) {
        return eventDao.selectDetailEventCalendar(eventcalendar_uuid);
    }

    @Override
    public int deleteEventCalendar(String eventcalendar_uuid) {
        return eventDao.deleteEventCalendar(eventcalendar_uuid);
    }

    @Override
    public int insertVisitorLogs(VisitorLogs visitorLogs) {
        return eventDao.insertVisitorLogs(visitorLogs);
    }

    @Override
    public List<Date> selectTodayTimeList() {
        return eventDao.selectTodayTimeList();
    }

    @Override
    public List<VisitorLogsCount> selectVisitorLogs() {
        return eventDao.selectVisitorLogs();
    }

    @Override
    public EventCalendar selectPopUpEvent() {
        return eventDao.selectPopUpEvent();
    }

    public int selectContinuousAttendance(String user_email) {
        return eventDao.selectContinuousAttendance(user_email);
    }
}
