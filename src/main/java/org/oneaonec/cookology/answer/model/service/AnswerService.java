package org.oneaonec.cookology.answer.model.service;

import java.util.ArrayList;

import org.oneaonec.cookology.answer.model.vo.Answer;

public interface AnswerService {

Answer selectAnswer(int question_seq_id);
int insertAnswer(Answer answer);
int deleteAnswer(int answer_seq_id);
ArrayList<Answer> selectAnswerList(String user_email);

}