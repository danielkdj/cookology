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
    public String moveFAQPage(Model model) {
        ArrayList<FAQ> list = FAQService.selectFAQList();

        if (list != null && list.size() > 0) {
            model.addAttribute("list", list);
            return "userService/FAQPage";

        } else {
            model.addAttribute("message", "FAQ전달안됨");
            return "common/error";
        }


    }
//admin  FAQ 수정 페이지
    @RequestMapping("FAQUpdatePage.do")
    public String moveQuestionUpdatePage(
            @RequestParam("faq_seq_id") int faq_seq_id, Model model) {
        FAQ faq = FAQService.selectFAQ(faq_seq_id);


        model.addAttribute("faq", faq);
        return "userService/FAQUpdatePage";

    }

//   실험용 test버튼
    @RequestMapping("FAQUpdateset.do")
    public String FAQUpdateMethod(
            @RequestParam("FAQ") FAQ faq){

       int updateSet =  FAQService.updateFAQ(faq);

        if(updateSet > 0) {

            return "userService/FAQUpdatePage";
        }else {
            return "common/error";
        }
    }


    @RequestMapping("FAQUpdate.do")
    public String updatesample(){
        return "userService/FAQUpdatePage";
    }

    @RequestMapping("upDateFAQ.do")
    public String upDateFAQMethod(
            @RequestParam("FAQ") FAQ faq, Model model) {
        int updateSet =  FAQService.updateFAQ(faq);

        if (updateSet > 0) {
            return "userService/FAQPage.do";
        } else {
            model.addAttribute("message", faq.getFaq_seq_id() + "번 글의 수정이 실패");
            return "common/error";
        }
    }
}