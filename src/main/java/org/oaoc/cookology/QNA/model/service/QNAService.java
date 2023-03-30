package org.oaoc.cookology.QNA.model.service;

import org.oaoc.cookology.QNA.model.vo.QNA;
import org.oaoc.cookology.common.Paging;

import java.util.ArrayList;

public interface QNAService {
    ArrayList<QNA> selectList(Paging page);
    int selectQNA(int qna_seq_id);
    int insertQNA(QNA qna);
    int deleteQNA(int qna_seq_id);
    ArrayList<QNA> selectMyQNAList(String user_email);
    ArrayList<QNA> selectQNAList();
    ArrayList<QNA> selectNewQuestionList();



}
