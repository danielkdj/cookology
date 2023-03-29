package org.oaoc.cookology.QNA.model.dao;

import org.oaoc.cookology.QNA.model.vo.QNA;
import org.mybatis.spring.SqlSessionTemplate;
import org.oaoc.cookology.common.Paging;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class QNADao {

    private SqlSessionTemplate session;

    public ArrayList<QNA> selectList(Paging page) {
       List<QNA> list = session.selectList("QNAMapper.selectList", page);
       return new ArrayList<>(list);
    }

    public int selectQNA(int qna_Seq_Id) {
        return session.selectOne("QNAMapper.selectQNA",qna_Seq_Id);
    }

    public int insertQNA(QNA qna) {
        return session.insert("QNAMapper.insertQNA",qna);
    }

    public int deleteQNA(int qna_Seq_Id) {
        return session.delete("QNAMapper.deleteQNA",qna_Seq_Id);
    }

    public ArrayList<QNA> selectMyQNAList(String user_email) {
        List<QNA> list = session.selectList("QNAMapper.selectMyQNAList", user_email);
        return new ArrayList<>(list);
    }

    public ArrayList<QNA> selectQNAList() {
        List<QNA> list = session.selectList("QNAMapper.selectQNAList");
        return new ArrayList<>(list);
    }

    public ArrayList<QNA> selectNewQuestionList(String issolved) {
        List<QNA> list = session.selectList("QNAMapper.selectNewQuestionList", issolved);
        return new ArrayList<>(list);
    }
}
