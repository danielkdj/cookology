package org.oneaonec.cookology.QNA.model.service;

import java.util.ArrayList;

import org.oneaonec.cookology.QNA.model.dao.QNADao;
import org.oneaonec.cookology.QNA.model.vo.QNA;
import org.oneaonec.cookology.answer.model.vo.Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QNAServiceImpl implements QNAService{
   
    @Autowired
	private QNADao QNADao;
    
    @Override
    public int selectQuestion(int qna_seq_id) {
        return QNADao.selectQuestion(qna_seq_id);
    }

    @Override
    public int insertQuestion(QNA qna) {
        return QNADao.insertQuestion(qna);
    }

    @Override
    public int deleteQuestion(int qna_seq_id) {
        return QNADao.deleteQuestion(qna_seq_id);
    }

    @Override
    public ArrayList<QNA> selectMyQuestionList(String user_eamil) {
        return QNADao.selectMyQuestionList(user_eamil);
    }

    @Override
    public ArrayList<QNA> selectNewQuestionList(String issolved) {
        return QNADao.selectNewQuestionList(issolved);
    }

    @Override
    public ArrayList<QNA> selectQuestionList() {
        return QNADao.selectQuestionList();
    }

    @Override
    public Answer selectAnswer(int qna_seq_id) {
        return QNADao.selectAnswer(qna_seq_id);
    }

    @Override
    public int insertAnswer(QNA qna) {
        return QNADao.insertAnswer(qna);
    }

    @Override
    public int deleteAnswer(int answer_seq) {
        return QNADao.deleteAnswer(answer_seq);
    }

    @Override
    public int updateAnswer(QNA qna) {
        return QNADao.updateAnswer(qna);
    }

    @Override
    public ArrayList<QNA> selectAnswerList(String user_eamil) {
        return QNADao.selectAnswerList(user_eamil);
    }

    @Override
    public ArrayList<QNA> selectAnswerList() {
        return QNADao.selectAnswerList();
    }
    
}
