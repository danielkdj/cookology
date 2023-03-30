package org.oaoc.cookology.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {

    @RequestMapping("eventPage.do")
    public String moveEventPage() {

        return "event/eventMain";
    }
}





