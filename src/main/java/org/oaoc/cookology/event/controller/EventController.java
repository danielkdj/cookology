package org.oaoc.cookology.event.controller;

import org.apache.ibatis.jdbc.Null;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.oaoc.cookology.event.model.service.EventService;
import org.oaoc.cookology.event.model.vo.Attendance;
import org.oaoc.cookology.event.model.vo.EventCalendar;
import org.oaoc.cookology.event.model.vo.VisitorLogs;
import org.oaoc.cookology.event.model.vo.VisitorLogsCount;
import org.oaoc.cookology.users.model.service.UsersService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class EventController {
    private static final Logger logger = LoggerFactory.getLogger(EventController.class);
    @Autowired
    private EventService eventService;
    private UsersService usersService;

    public EventController() {
    }

    @RequestMapping({"eventPage.do"})
    public String moveEventPage(/*@RequestParam("user_email")String user_email*/) {
        logger.info("move");
        return "event/eventMain";
    }

    @RequestMapping({"attendance.do"})
    public String moveAttendancePage() {
        logger.info("move to attendance");
        return "event/attendance";
//
//            try {
//                return "event/attendance";
//            } catch (NullPointerException e) {
//                return "users/loginPage";
//            }
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
        today.setToday(Date.valueOf((String) data.get("today")));
        today.setUser_email((String) data.get("user_email"));
        logger.info(String.valueOf(today));
        return this.eventService.insertAttendance(today) > 1 ? "200" : "500";
    }


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

    @RequestMapping(value = "getEventCalendar.do", method = RequestMethod.POST)
    @ResponseBody
    public String getEventCalendar() {
        ArrayList<EventCalendar> eventList = eventService.selectEventCalendar();
        logger.info("eventCalendar_summary");
        JSONObject sendJson = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        for (EventCalendar event : eventList) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("eventcalendar_uuid", event.getEventcalendar_uuid().toString());
            jsonObject.put("title", event.getTitle().toString());
            jsonObject.put("start", event.getStart().toString());
            jsonObject.put("end", event.getEnd().toString());
            jsonObject.put("backgroundcolor", event.getBackgroundcolor().toString());
            jsonObject.put("description", event.getDescription().toString());
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
        logger.info("addCalenderEvent.do : ");
//        logger.info(eventCalendar.getContent());
        JSONObject jsonObject = new JSONObject();
        String uuid = UUID.randomUUID().toString();
        eventCalendar.setEventcalendar_uuid(uuid);


        if (eventService.insertEventCalendar(eventCalendar) > 0) {
            // 데이터 삽입 성공
            logger.info("insert success");

            jsonObject.put("status", "200");
//            return ;
        } else {
            // 데이터 삽입 실패
            jsonObject.put("status", "500");
        }
        return jsonObject.toJSONString();
    }

    @RequestMapping(value = "eventDetail.do", method ={RequestMethod.POST,RequestMethod.GET})
    public String moveEventDetailPage() {
        return "event/eventCalendarDetail";
    }

    @RequestMapping(value = "getEventCalendarDetail.do", method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    public String getEventCalendarDetail(@RequestParam Map<String, Object> data) throws UnsupportedEncodingException {
        logger.info("event-detail");
        logger.info((String) data.get("uuid"));

        EventCalendar eventList = eventService.selectDetailEventCalendar((String) data.get("uuid"));

        JSONObject sendJson = new JSONObject();
        JSONArray jsonArray = new JSONArray();

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("eventcalendar_uuid", eventList.getEventcalendar_uuid().toString());
        jsonObject.put("start", eventList.getStart().toString());
        jsonObject.put("end", eventList.getEnd().toString());
        jsonObject.put("title", URLEncoder.encode(eventList.getTitle().toString(), "utf-8"));
        jsonObject.put("url", eventList.getUrl().toString());
        jsonObject.put("backgroundcolor", eventList.getBackgroundcolor().toString());
        jsonObject.put("description", URLEncoder.encode(eventList.getDescription().toString(), "utf-8"));
        jsonObject.put("content", URLEncoder.encode(eventList.getContent().toString(), "utf-8"));
        jsonObject.put("longitude", eventList.getLongitude().toString());
        jsonObject.put("latitude", eventList.getLatitude().toString());

        return jsonObject.toJSONString();
    }

    @RequestMapping("deleteEventCalendar.do")
    @ResponseBody
    public String deleteEventCalenar(@RequestParam String uuid) {


        try {
            int result = eventService.deleteEventCalendar(uuid);
            if(result > 0) {
                logger.info("success");
                return "ok";
            } else {
                logger.info("error-1");
                return "fail";
            }
        } catch (NullPointerException e) {
            logger.info("error-2");
            return "fail";
        }
    }

    @RequestMapping(value = {"visitorLogs.do"}, method = {RequestMethod.GET,RequestMethod.POST})
    @ResponseBody
    public void visitorLogs(@RequestParam Map<String, Object> data, HttpServletRequest request) {
        String ipAddress = request.getHeader("X-FORWARDED-FOR");
        if (ipAddress == null) {
            ipAddress = request.getRemoteAddr();
        }
        VisitorLogs visitorLogs = new VisitorLogs();
        visitorLogs.setIpaddress(ipAddress);
        visitorLogs.setPage((String) data.get("page"));
//        visitorLogs.setTime(Date.valueOf(LocalDate.now()));
        logger.info(visitorLogs.toString());
        eventService.insertVisitorLogs(visitorLogs);
    }

    @RequestMapping(value = "getTodayTimeList.do", method = {RequestMethod.POST})
    @ResponseBody
    public String getTodayTime() {
        List<java.util.Date> list = eventService.selectTodayTimeList();
        logger.info("time_list");
        JSONObject sendJson = new JSONObject();

        // Create a SimpleDateFormat instance for formatting dates
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");

        // Iterate through the date list and format each date to the desired format
        List<String> formattedDates = new ArrayList<>();
        for (java.util.Date date : list) {
            formattedDates.add(outputFormat.format(date));
        }

        sendJson.put("list", formattedDates);
        logger.info(sendJson.toJSONString());
        return sendJson.toJSONString();
    }

    @ResponseBody
    @RequestMapping(value = {"getVisitorLogsCount.do"}, method = RequestMethod.POST)
    public String getVisitorLogsCount() {
        List<VisitorLogsCount> list = eventService.selectVisitorLogs();
        JSONObject sendJson = new JSONObject();
        JSONArray jsonArray = new JSONArray();
        for (VisitorLogsCount visitorLogsCount : list) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("page", visitorLogsCount.getPage().toString());
            jsonObject.put("count", String.valueOf(visitorLogsCount.getCount()));
            jsonArray.add(jsonObject);
        }
        sendJson.put("list",jsonArray);
        return sendJson.toJSONString();
    }

    @RequestMapping({"eventPopUp.do"})
    public String eventMainPopUp() {
        return "event/eventMainPopUp";
    }


    @RequestMapping(value = "eventPopUpDetail.do", method = RequestMethod.POST)
    @ResponseBody
    public String eventPopUp() throws UnsupportedEncodingException {
        logger.info("eventPopUp.do : ");
        JSONObject jsonObject = new JSONObject();
        EventCalendar eventCalendar = eventService.selectPopUpEvent();

        jsonObject.put("eventcalendar_uuid", eventCalendar.getEventcalendar_uuid().toString());
        jsonObject.put("start", eventCalendar.getStart().toString());
        jsonObject.put("end", eventCalendar.getEnd().toString());
        jsonObject.put("title", URLEncoder.encode(eventCalendar.getTitle().toString(), "utf-8"));
        jsonObject.put("url", eventCalendar.getUrl().toString());
        jsonObject.put("backgroundcolor", eventCalendar.getBackgroundcolor().toString());
        jsonObject.put("description", URLEncoder.encode(eventCalendar.getDescription().toString(), "utf-8"));
        jsonObject.put("content", URLEncoder.encode(eventCalendar.getContent().toString(), "utf-8"));
        jsonObject.put("longitude", eventCalendar.getLongitude().toString());
        jsonObject.put("latitude", eventCalendar.getLatitude().toString());

        return jsonObject.toJSONString();
    }

}
