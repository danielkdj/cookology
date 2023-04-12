package org.oaoc.cookology.event.model.service;


import org.oaoc.cookology.event.model.vo.Attendance;
import org.oaoc.cookology.event.model.vo.EventCalendar;
import org.oaoc.cookology.event.model.vo.VisitorLogs;
import org.oaoc.cookology.event.model.vo.VisitorLogsCount;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public interface EventService {


    ArrayList<Attendance> selectAttendance(String userEmail);

    int selectContinuousAttendance(String userEmail);

    int insertAttendance(Attendance today);

    int insertEventCalendar(EventCalendar eventCalendar);

    ArrayList<EventCalendar> selectEventCalendar();
    EventCalendar selectDetailEventCalendar(String eventcalendar_uuid);

    int deleteEventCalendar(String eventcalendar_uuid);

    int insertVisitorLogs(VisitorLogs visitorLogs);

    List<Date> selectTodayTimeList();

    List<VisitorLogsCount> selectVisitorLogs();
}
