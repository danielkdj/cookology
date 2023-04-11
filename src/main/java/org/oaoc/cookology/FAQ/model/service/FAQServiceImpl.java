package org.oaoc.cookology.FAQ.model.service;

import org.oaoc.cookology.FAQ.model.dao.FAQDao;
import org.oaoc.cookology.FAQ.model.vo.FAQ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class FAQServiceImpl implements FAQService{

    @Autowired
    FAQDao faqDao;

    @Override
    public int insertFAQ(FAQ faq) {
        return faqDao.insertFAQ(faq);
    }

    @Override
    public int deleteFAQ(int faq_seq_id) {
        return faqDao.deleteFAQ(faq_seq_id);
    }

    @Override
    public int updateFAQ(FAQ faq) {
        return faqDao.updateFAQ(faq);
    }

    @Override
    public FAQ selectFAQ(int faq_seq_id) {
        return faqDao.selectFAQ(faq_seq_id);
    }

    @Override
    public ArrayList<FAQ> selectFAQList() {
        return faqDao.selectFAQList();
    }
}
