package org.oaoc.cookology.event.controller;

import org.apache.ibatis.jdbc.Null;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.oaoc.cookology.event.model.service.EventService;
import org.oaoc.cookology.event.model.vo.Attendance;
import org.oaoc.cookology.event.model.vo.EventCalendar;
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
import java.util.ArrayList;
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
//            model.addAttribute("status","200");
//            return "redirect:eventCalendar.do";
//            return "event/eventCalendar";
            jsonObject.put("status", "200");
//            return ;
        } else {
            // 데이터 삽입 실패
//            model.addAttribute("message", "이벤트 추가 에러");
            jsonObject.put("status", "500");
        }
        return jsonObject.toJSONString();
    }

//    @RequestMapping("eventDetail.do")
//    public String moveEventDetailPage(@RequestParam Map<String, Object> data, Model model) {
//        logger.info("move to eventCalendarDetail.jsp");
//        logger.info((String) data.get("uuid"));
//        model.addAttribute("uuid",(String)data.get("uuid"));
//        return "event/eventCalendarDetail";
//    }

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
//        jsonArray.add(jsonObject);


//        sendJson.put("list", jsonArray);
//        logger.info(sendJson.toJSONString());
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


}
