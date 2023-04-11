package org.oaoc.cookology.event.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.oaoc.cookology.event.model.service.EventService;
import org.oaoc.cookology.event.model.vo.Attendance;
import org.oaoc.cookology.event.model.vo.EventCalendar;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;
import java.util.UUID;

@Controller
public class EventController {
    private static final Logger logger = LoggerFactory.getLogger(EventController.class);
    @Autowired
    private EventService eventService;

    public EventController() {
    }

    @RequestMapping({"eventPage.do"})
    public String moveEventPage() {
        logger.info("move");
        return "event/eventMain";
    }

    @RequestMapping({"attendance.do"})
    public String moveAttendancePage() {
        logger.info("move to attendance");
        return "event/attendance";
    }

    @RequestMapping({"eventCalendar.do"})
    public String moveEventCalendarPage() {
        logger.info("move to eventCalendar.jsp");
        return "event/eventCalendar";
    }

    @RequestMapping({"adminAddEvent.do"})
    public String moveAddEventCalendarPage() {
        logger.info("move to eventCalendar.jsp");
        return "event/adminAddEvent";
    }
    @RequestMapping(value = {"attendance_today.do"}, method = {RequestMethod.POST})
    @ResponseBody
    public String attendanceToday(@RequestParam Map<String, Object> data) {
        Attendance today = new Attendance();
        today.setToday(Date.valueOf((String)data.get("today")));
        today.setUser_email((String)data.get("user_email"));
        logger.info(String.valueOf(today));
        return this.eventService.insertAttendance(today) > 1 ? "200" : "500";
    }

//    @RequestMapping(
//            value = {"getAttendance.do"},
//            method = {RequestMethod.POST}
//    )
//    @ResponseBody
//    public String attendanceAll(@RequestParam String user_email) {
//        ArrayList<Attendance> attendances = this.eventService.selectAttendance(user_email);
//        logger.info("att");
//        JSONObject sendJson = new JSONObject();
//        JSONArray jsonArray = new JSONArray();
//        Iterator var5 = attendances.iterator();
//
//        while(var5.hasNext()) {
//            Attendance att = (Attendance)var5.next();
//            JSONObject jsonObject = new JSONObject();
//            jsonObject.put("user_email", att.getUser_email());
//            jsonObject.put("today", att.getToday().toString());
//            jsonArray.add(jsonObject);
//        }
//
//        sendJson.put("list", jsonArray);
//        logger.info(sendJson.toJSONString());
//        return sendJson.toJSONString();
//    }

    @RequestMapping(value = "getAttendance.do", method = RequestMethod.POST)
    @ResponseBody
    public String attendanceAll(@RequestParam("user_email") String user_email) {
        ArrayList<Attendance> attendances = eventService.selectAttendance(user_email);
        logger.info("att");
        JSONObject sendJson = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        for (Attendance att : attendances) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("user_email", att.getUser_email());
            jsonObject.put("today", att.getToday().toString());
            jsonArray.add(jsonObject);

        }

        sendJson.put("list", jsonArray);
        logger.info(sendJson.toJSONString());
        return sendJson.toJSONString();
    }
    @RequestMapping(value = {"continuousAttendance.do"}, method = {RequestMethod.POST})
    @ResponseBody
    public String continuousAttendance(@RequestParam String user_email) {
        JSONObject sendJson = new JSONObject();
        Integer day = null;
        try {
            day = this.eventService.selectContinuousAttendance(user_email);
//            logger.info("con day: " + day);
        } catch (NullPointerException e) {
            logger.info("day is null");
            day = 0;
        } finally {
            logger.info(String.valueOf(day));
            sendJson.put("con", day.toString());
        }
        return sendJson.toJSONString();
    }


//    form 태그에 캘린더 이벤트 추가를 위함
    @RequestMapping(value = "addCalenderEvent.do", method = RequestMethod.POST)
    @ResponseBody
    public String addCalenderEvent(EventCalendar eventCalendar) {
        logger.info("addCalenderEvent.do : " );
//        logger.info(eventCalendar.getContent());
        JSONObject jsonObject = new JSONObject();
        String uuid = UUID.randomUUID().toString();
        eventCalendar.setEventcalendar_uuid(uuid);


        if (eventService.insertEventCalendar(eventCalendar) > 0) {
            // 데이터 삽입 성공
            logger.info("insert success");
//            model.addAttribute("status","200");
//            return "redirect:eventCalendar.do";
//            return "event/eventCalendar";
            jsonObject.put("status","200");
//            return ;
        } else {
            // 데이터 삽입 실패
//            model.addAttribute("message", "이벤트 추가 에러");
            jsonObject.put("status","500");
        }
        return jsonObject.toJSONString();
    }
}


/*
*  @RequestMapping(value = "addCalenderEvent.do", method = RequestMethod.POST)
    @ResponseBody
    public String addCalenderEvent(
//            @RequestParam("start") String start,
//            @RequestParam("end")String end,
            @RequestParam("title")String title,
            @RequestParam("url")String url,
            @RequestParam("backgroundcolor")String backgroundcolor,
            @RequestParam("content")String content,
            @RequestParam("description")String description
    ) {
        logger.info("addCalenderEvent.do : " );
        JSONObject jsonObject = new JSONObject();
        EventCalendar eventCalendar = new EventCalendar();
        String uuid = UUID.randomUUID().toString();
        eventCalendar.setEventcalendar_uuid(uuid);
//        eventCalendar.setStart(Date.valueOf(String.valueOf(start)));
//        eventCalendar.setEnd(Date.valueOf(String.valueOf(end)));
//        logger.info("date val : " + start);
        eventCalendar.setTitle(title);
        eventCalendar.setUrl(url);
        eventCalendar.setBackgroundcolor(backgroundcolor);
        eventCalendar.setContent(content);
        eventCalendar.setDescription(description);

        if (eventService.insertEventCalendar(eventCalendar) > 0) {
            // 데이터 삽입 성공
            logger.info("insert success");
//            model.addAttribute("status","200");
//            return "redirect:eventCalendar.do";
//            return "event/eventCalendar";
            jsonObject.put("status","200");
//            return ;
        } else {
            // 데이터 삽입 실패
//            model.addAttribute("message", "이벤트 추가 에러");
            jsonObject.put("status","500");
        }
        return jsonObject.toJSONString();
    }*/


