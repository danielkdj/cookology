package org.oneaonec.cookology.question.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.oneaonec.cookology.question.model.vo.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("QuestionDao")
public class QuestionDao{

    @Autowired
	private SqlSessionTemplate session;

    public Question selectQuestion(String user_email) {
        return session.selectOne("mappers.selectQuestion");
    }

    public int insertQuestion(Question question) {
        return session.insert("mappers.insertQuestion");
    }                                          

    public int deleteQuestion(int question_seq_id) {
        return session.delete("mappers.insertQuestion", question_seq_id);
    }
                   
    public ArrayList<Question> selectQuestionList(String user_email) {
        List<Question> list = 
                session.selectList("questionMapper.selectQuestionList",
                                    user_email);
        return (ArrayList<Question>)list;
    }

    public int updateQuestion(Question question) {
        return session.insert("mappers.updateQuestion", question);
    }

 


}