package org.oneaonec.cookology.answer.model.service;

import java.util.ArrayList;

import org.oneaonec.cookology.answer.model.dao.AnswerDao;
import org.oneaonec.cookology.answer.model.vo.Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("answerService")
public class serviceImpl implements AnswerService{
    
    @Autowired
	private AnswerDao answerDao;


    @Override
    public int insertAnswer(Answer answer) {
        return answerDao.insertAnswer(answer);
    }

    @Override
    public int deleteAnswer(int answer_seq_id) {
        return answerDao.deleteAnswer(answer_seq_id);
    }

    @Override
    public ArrayList<Answer> selectAnswerList(String user_email) {
        return answerDao.selectAnswerList(user_email);
    }

    @Override
    public Answer selectAnswer(int question_seq_id) {
        return answerDao.selectAnswer(question_seq_id);
    }

}
