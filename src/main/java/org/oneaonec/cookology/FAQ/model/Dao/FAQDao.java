package org.oneaonec.cookology.FAQ.model.Dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.oneaonec.cookology.FAQ.model.vo.FAQ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("FAQDao")
public class FAQDao {

    @Autowired
	private SqlSessionTemplate session;

    public int insertFAQ(FAQ faq) {
        return session.insert("FAQMapper.insertFAQ", faq);
    }

    public int updateFAQ(FAQ faq) {
        return session.update("FAQMapper.updateFAQ", faq);
    }

    public int deleteFAQ(int faq_seq_id) {
        return session.delete("FAQMapper.deleteFAQ", faq_seq_id);
    }

    public ArrayList<FAQ> selectFAQList() {
        List<FAQ> list = session.selectList("FAQMapper.selectFAQList");
		
		return (ArrayList<FAQ>)list;
    }

    public FAQ selectFAQ() {
        return session.selectOne("FAQMapper.selectFAQ");
    }
    
}
