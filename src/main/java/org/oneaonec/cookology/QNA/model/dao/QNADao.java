package org.oneaonec.cookology.QNA.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.oneaonec.cookology.QNA.model.vo.QNA;
import org.oneaonec.cookology.answer.model.vo.Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("QNADao")
public class QNADao {
    
    @Autowired
	private SqlSessionTemplate session;
   
    public int selectQuestion(int qna_seq_id) {
        return session.selectOne("QNAMapper.selectQuestion", qna_seq_id);
    }

    public int insertQuestion(QNA qna) {
        return session.selectOne("QNAMapper.insertQuestion", qna);
    }

    public int deleteQuestion(int qna_seq_id) {
        return session.selectOne("QNAMapper.deleteQuestion", qna_seq_id);
    }

    public ArrayList<QNA> selectMyQuestionList(String user_eamil) {
        return session.selectOne("QNAMapper.selectMyQuestionList", user_eamil);
    }

    public ArrayList<QNA> selectNewQuestionList(String issolved) {
        return session.selectOne("QNAMapper.selectNewQuestionList", issolved);
    }

    public ArrayList<QNA> selectQuestionList() {
        return session.selectOne("QNAMapper.selectQuestionList");
    }

    //---------------------------------Answer------------------------------
    
    public Answer selectAnswer(int qna_seq_id) {
        return session.selectOne("QNAMapper.selectAnswer", qna_seq_id);
    }

    public int insertAnswer(QNA qna) {
        return session.selectOne("QNAMapper.insertAnswer", qna);
    }

    public int deleteAnswer(int answer_seq) {
        return session.delete("QNAMapper.deleteAnswer", answer_seq);
    }

    public int updateAnswer(QNA qna) {
        return session.update("QNAMapper.updateAnswer", qna);
    }

    public ArrayList<QNA> selectAnswerList(String user_eamil) {
        List<QNA> list = session.selectList("QNAMapper.selectAnswerList", user_eamil);
        return (ArrayList<QNA>)list;
    }

    public ArrayList<QNA> selectAnswerList() {
        List<QNA> list =  session.selectList("QNAMapper.selectQuestion");
        return (ArrayList<QNA>)list;
    }
    
}
