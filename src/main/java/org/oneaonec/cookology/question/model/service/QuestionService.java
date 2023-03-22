package org.oneaonec.cookology.question.model.service;

import java.util.ArrayList;

import org.oneaonec.cookology.question.model.vo.Question;

public interface QuestionService {

    

Question selectQuestion(String user_email);
int insertQuestion(Question question);
int deleteQuestion(int question_seq_id);
int updateQuestion(Question question);
ArrayList<Question> selectQuestionList(String user_email);

    
}
