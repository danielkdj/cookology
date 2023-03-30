package org.oaoc.cookology.FAQ.controller;

import org.oaoc.cookology.FAQ.model.service.FAQService;
import org.oaoc.cookology.FAQ.model.vo.FAQ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Controller
public class FAQController {

    @Autowired
    FAQService FAQService;

    @RequestMapping("FAQPage.do")
    public String moveFAQPage(Model model){
        ArrayList<FAQ> list = FAQService.selectList();

        if(list != null && list.size() > 0){
            model.addAttribute("list", list);
            return "userService/FAQPage";

        }else {
            model.addAttribute("message", "공시사항전달안됨");
            return "common/error";
        }


    }
    @RequestMapping("FAQUpdatePage.do")
    public String moveQuestionUpdatePage(
            @RequestParam("faq_seq_id") int faq_seq_id, Model model) {
            FAQ faq = FAQService.selectFAQ(faq_seq_id);


            model.addAttribute("faq", faq);
        return "userService/FAQUpdatePage";

    }

}
