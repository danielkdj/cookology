package org.oaoc.cookology.event.model.service;


import org.oaoc.cookology.event.model.vo.Attendance;
import org.oaoc.cookology.event.model.vo.EventCalendar;

import java.util.ArrayList;

public interface EventService {


    ArrayList<Attendance> selectAttendance(String userEmail);

    int selectContinuousAttendance(String userEmail);

    int insertAttendance(Attendance today);

    int insertEventCalendar(EventCalendar eventCalendar);


}
