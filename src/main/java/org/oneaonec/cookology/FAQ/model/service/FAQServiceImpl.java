package org.oneaonec.cookology.FAQ.model.service;

import java.util.ArrayList;

import org.oneaonec.cookology.FAQ.model.Dao.FAQDao;
import org.oneaonec.cookology.FAQ.model.vo.FAQ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FAQServiceImpl implements FAQService{

    @Autowired
	private FAQDao faqDao;

    @Override
    public int insertFAQ(FAQ faq) {
      return faqDao.insertFAQ(faq);
    }

    @Override
    public int updateFAQ(FAQ faq) {
        return faqDao.updateFAQ(faq);
    }

    @Override
    public int deleteFAQ(int faq_seq_id) {
        return faqDao.deleteFAQ(faq_seq_id);
    }

    @Override
    public ArrayList<FAQ> selectFAQList() {
        return faqDao.selectFAQList();
    }

    @Override
    public FAQ selectFAQ() {
        return faqDao.selectFAQ();
    }
    
}
