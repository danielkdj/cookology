package org.oneaonec.cookology.answer.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.oneaonec.cookology.answer.model.vo.Answer;
import org.springframework.beans.factory.annotation.Autowired;


public class AnswerDao{ 

    @Autowired
	private SqlSessionTemplate session;

    public Answer selectAnswer(int question_seq_id) {
        return session.selectOne("AnswerMapper.selectAnswer", question_seq_id);
    }

    public int insertAnswer(Answer answer) {
        return session.insert("AnswerMapper.insertAnswer", answer);

    }

    public int deleteAnswer(int answer_seq_id) {
        return session.delete("AnswerMapper.deleteAnswer", answer_seq_id);
    }

    public ArrayList<Answer> selectAnswerList(String user_email) {
        List<Answer> list = session.selectList("AnswerMapper.selectAnswerList", user_email);
        return (ArrayList<Answer>)list;
    }



} 