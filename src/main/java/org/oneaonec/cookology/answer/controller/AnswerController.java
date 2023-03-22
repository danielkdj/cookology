package org.oneaonec.cookology.answer.controller;

import org.mybatis.logging.LoggerFactory;
import org.oneaonec.cookology.answer.model.service.AnswerService;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class AnswerController {

    private static final Logger logger = (Logger) LoggerFactory.getLogger(AnswerController.class);

    @Autowired
     private AnswerService answerService;

    

    public String moveModifyAnswerPage(){
        return"";
    } // >>질문 수정 페이지.jsp로 이동
    public String moveAnswerPage(){
    return"";
    }  //>>질문하기 페이지.jsp로 이동
    public String insertMyAnswerMethod(){
        return"";
    } //>>>> 질문하기.jsp  >>>> 질문 입력
    public String selectMyAnswerlistMethod(String userid){
        return"";
    }        //  >>>  프론트 출력용
    public String updateMyAnswerMethod(int answer_seq_id){
        return"";
    } // >>>  질문 수정하기.jsp >>>> 질문 수정
//-------------Admin-------------
    public String  selectNewAnswerListMethod(){
        return"";
    }// >>  답변안한 새로운 질문List
}