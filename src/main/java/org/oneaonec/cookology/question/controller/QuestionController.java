package org.oneaonec.cookology.question.controller;

import org.mybatis.logging.Logger;
import org.oneaonec.cookology.answer.controller.AnswerController;
import org.oneaonec.cookology.question.model.service.QuestionService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class QuestionController {

    private static final Logger logger = 
            (Logger) LoggerFactory.getLogger(AnswerController.class);

    @Autowired
    private QuestionService questionService;

    

    public String moveModifyQuestionPage() {
       return "";
    } // >>질문 수정 페이지.jsp로 이동

    public String moveQuestionPage() {
        return "";
    } // >>질문하기 페이지.jsp로 이동

    public String insertMyQuestionMethod() {
        return "";
    } // >>>> 질문하기.jsp >>>> 질문 입력

public String selectMyQuestionlistMethod(String userid){
    return "";
} // >>> 프론트 출력용

public String updateMyQuestionMethod(int question_seq){
    return "";
} // >>> 질문 수정하기.jsp >>>> 질문 수정
      // -------------Admin-------------
    
 public String selectNewQuestionListMethod() {
    return "";
    }// >> 답변안한 새로운 질문List
}