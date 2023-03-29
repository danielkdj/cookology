package org.oaoc.cookology.QNA.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class QNAController {
    @RequestMapping("QNAPage.do")
    public String moveQNAPage() {

        return "userService/QNAPage";

    }
    @RequestMapping("noticePage.do")
    public String movenoticePage() {

        return "userService/noticePage";

    }
    @RequestMapping("QuestionPage.do")
    public String moveQuestionPage() {

        return "userService/QuestionPage";

    }
}