package org.oaoc.cookology.QNA.controller;



import org.oaoc.cookology.QNA.model.service.QNAService;
import org.oaoc.cookology.QNA.model.vo.QNA;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Controller
public class QNAController {

    @Autowired
    QNAService QNAService;

    @RequestMapping("QNAPage.do")
    public String moveQNAPage(
            @RequestParam("user_email") String user_email,
            Model model) {

        ArrayList<QNA> list = QNAService.selectMyQNAList(user_email);

            if(list != null && list.size() > 0){
                model.addAttribute("list", list);
                return "userService/QNAPage";

            }else {
                model.addAttribute("message", "QNA전달안됨");
                return "common/error";
            }

    }

    @RequestMapping("QNAPageAdmin.do")
    public String moveAdminQNAPage(Model model) {



        ArrayList<QNA> list = QNAService.selectNewQuestionList();


        model.addAttribute("list", list);
        return "userService/QNAAdminPage";

    }
    @RequestMapping("QuestionPage.do")
    public String moveQuestionPage(Model model) {



        ArrayList<QNA> list = QNAService.selectNewQuestionList();


        model.addAttribute("list", list);
        return "userService/QuestionPage";

    }
}

