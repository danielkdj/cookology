package org.oaoc.cookology.QNA.model.service;

import org.oaoc.cookology.QNA.model.dao.QNADao;
import org.oaoc.cookology.QNA.model.vo.QNA;
import org.oaoc.cookology.common.Paging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class QNAServiceImpl implements QNAService{
    @Autowired
    QNADao qnaDao;

    @Override
    public ArrayList<QNA> selectList(Paging page) {
        return qnaDao.selectList(page);
    }

    @Override
    public QNA selectQNA(int qna_seq_id) {
        return qnaDao.selectQNA(qna_seq_id);
    }

    @Override
    public int updateQNA(QNA qna) {
        return qnaDao.updateQNA(qna);
    }

    @Override
    public int insertQNA(QNA qna) {
        return qnaDao.insertQNA(qna);
    }

    @Override
    public int deleteQNA(int qna_seq_id) {
        return qnaDao.deleteQNA(qna_seq_id);
    }

    @Override
    public ArrayList<QNA> selectMyQNAList(String user_email) {
        return qnaDao.selectMyQNAList(user_email);
    }

    @Override
    public ArrayList<QNA> selectQNAList() {
        return qnaDao.selectQNAList();
    }

    @Override
    public ArrayList<QNA> selectNewQuestionList() {
        return qnaDao.selectNewQuestionList();
    }
}
