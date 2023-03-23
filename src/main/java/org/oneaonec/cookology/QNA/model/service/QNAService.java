package org.oneaonec.cookology.QNA.model.service;

import java.util.ArrayList;

import org.oneaonec.cookology.QNA.model.vo.QNA;
import org.oneaonec.cookology.answer.model.vo.Answer;

public interface QNAService {

//@QuestionService
// ArrayList<QNA> selectList(Paging page);
int selectQuestion(int qna_seq_id);
int insertQuestion(QNA qna);
int deleteQuestion(int qna_seq_id );
ArrayList<QNA> selectMyQuestionList(String user_eamil);
ArrayList<QNA> selectNewQuestionList(String issolved);
ArrayList<QNA> selectQuestionList();


// +++++++++++++++++++++++++++++++++++++++++++++++++


// @AnswerService
Answer selectAnswer(int qna_seq_id);
int insertAnswer(QNA qna);
int deleteAnswer(int answer_seq);
int updateAnswer(QNA qna);
ArrayList<QNA> selectAnswerList(String user_eamil);
ArrayList<QNA> selectAnswerList();
}
