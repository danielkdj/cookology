package org.oaoc.cookology.event.model.service;

import org.oaoc.cookology.event.model.dao.EventDao;
import org.oaoc.cookology.event.model.vo.Attendance;
import org.oaoc.cookology.event.model.vo.EventCalendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

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

    public int selectContinuousAttendance(String user_email) {
        return eventDao.selectContinuousAttendance(user_email);
    }
}
