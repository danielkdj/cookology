package org.oaoc.cookology.QNA.model.service;

import org.oaoc.cookology.QNA.model.vo.QNA;
import org.oaoc.cookology.common.Page;

import java.util.ArrayList;

public interface QNAService {
    ArrayList<QNA> selectList(Page page);
    QNA selectQNA(int qna_seq_id);
    int updateQNA(QNA qna);
    int insertQNA(QNA qna);
    int deleteQNA(int qna_seq_id);
    ArrayList<QNA> selectMyQNAList(String user_email);
    ArrayList<QNA> selectQNAList();
    ArrayList<QNA> selectNewQuestionList();



}
