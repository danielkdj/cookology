package org.oaoc.cookology.event.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.oaoc.cookology.event.model.vo.Attendance;
import org.oaoc.cookology.event.model.vo.EventCalendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository("eventDao")
public class EventDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public EventDao() {
    }

    public ArrayList<Attendance> selectAttendance(String user_email) {
        List<Attendance> list = this.sqlSessionTemplate.selectList("eventmapper.selectAttendance", user_email);
        return (ArrayList)list;
    }

    public int insertAttendance(Attendance attendance) {
        return this.sqlSessionTemplate.insert("eventmapper.insertAttendance", attendance);
    }

    public int selectContinuousAttendance(String user_email) {
        return (Integer)this.sqlSessionTemplate.selectOne("eventmapper.selectContinuousAttendance", user_email);
    }

    public int insertEventCalendar(EventCalendar eventCalendar) {
        return this.sqlSessionTemplate.insert("eventmapper.insertEventCalendar", eventCalendar);
    }

    public ArrayList<EventCalendar> selectEventCalendar() {
        List<Attendance> list = sqlSessionTemplate.selectList("eventmapper.EventCalendarSummary");
        return (ArrayList)list;
    }

    public EventCalendar selectDetailEventCalendar(String eventcalendar_uuid) {
        return sqlSessionTemplate.selectOne("eventmapper.selectDetailEventCalendar", eventcalendar_uuid);
    }

    public int deleteEventCalendar(String eventcalendar_uuid) {
        return sqlSessionTemplate.delete("eventmapper.deleteEventCalendar", eventcalendar_uuid);
    }
}
