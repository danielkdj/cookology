package org.oaoc.cookology.FAQ.controller;

import org.oaoc.cookology.FAQ.model.service.FAQService;
import org.oaoc.cookology.FAQ.model.vo.FAQ;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Controller
public class FAQController {
    Logger logger = org.slf4j.LoggerFactory.getLogger(FAQController.class);
    @Autowired
    FAQService FAQService;

    @RequestMapping(value = "FAQPage.do", method = {RequestMethod.POST, RequestMethod.GET})
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




    @RequestMapping(value="moveFAQUpdate.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String FAQUpdateMethod(
            @RequestParam("faq_seq_id") int faq_seq_id, Model model){
        FAQ faq = FAQService.selectFAQ(faq_seq_id);
        if(faq != null){
            model.addAttribute("faq", faq);
            return "userService/FAQUpdatePage";
        }else {
            return "common/error";
        }
    }

    @RequestMapping(value = "FAQadminUpdate.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String upDateFAQMethod(
            @ModelAttribute FAQ faq, Model model) {
        int updateSet =  FAQService.updateFAQ(faq);

        if (updateSet > 0) {
            logger.info("FAQ 수정 성공");
            return "redirect:FAQPage.do";

        } else {
            model.addAttribute("message", faq.getFaq_seq_id() + "번 글의 수정이 실패");
            return "common/error";
        }
    }


}