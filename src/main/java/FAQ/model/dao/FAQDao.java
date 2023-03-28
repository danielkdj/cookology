package FAQ.model.dao;

import FAQ.model.vo.FAQ;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class FAQDao {

    @Autowired
    private SqlSessionTemplate session;
    public int insertFAQ(FAQ faq) {
       return session.insert("FAQMapper.insertFAQ", faq);
    }

    public int deleteFAQ(int faq_Seq_Id) {
        return session.delete("FAQMapper.deleteFAQ", faq_Seq_Id);
    }

    public int updateFAQ(FAQ faq) {
        return session.update("FAQMapper.updateFAQ", faq);
    }

    public FAQ selectFAQ(int faq_Seq_Id) {
        return session.selectOne("FAQMapper.selectFAQ", faq_Seq_Id);
    }

    public ArrayList<FAQ> selectList() {
        List<FAQ> list = session.selectList("FAQMapper.insertFAQ");
        return (ArrayList<FAQ>)list;
    }
}
