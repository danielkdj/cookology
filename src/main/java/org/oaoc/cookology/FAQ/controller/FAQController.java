package org.oaoc.cookology.FAQ.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class FAQController {

    @RequestMapping("FAQPage.do")
    public String moveFAQPage() {

        return "userService/FAQPage";
    }
}
