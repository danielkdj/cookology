package org.oneaonec.cookology.question.model.service;

import java.util.ArrayList;

import org.oneaonec.cookology.question.model.dao.QuestionDao;
import org.oneaonec.cookology.question.model.vo.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("QuestionService")
public class QuestionServiceImpl implements QuestionService{

    @Autowired
	private QuestionDao questionDao;
    
    @Override
    public Question selectQuestion(String user_email) {
        return questionDao.selectQuestion(user_email);
    }           
    
    @Override
    public ArrayList<Question> selectQuestionList(String user_email) {
        return questionDao.selectQuestionList(user_email);
    }

    @Override
    public int insertQuestion(Question question) {
        return questionDao.insertQuestion(question);
    }

    @Override
    public int deleteQuestion(int question_seq_id) {
        return questionDao.deleteQuestion(question_seq_id);
    }

    @Override
    public int updateQuestion(Question question) {
        return questionDao.updateQuestion(question);
    }


}