package org.oneaonec.cookology.FAQ.model.service;

import java.util.ArrayList;

import org.oneaonec.cookology.FAQ.model.vo.FAQ;


public interface FAQService {
FAQ selectFAQ();
int insertFAQ(FAQ faq);
int updateFAQ(FAQ faq);
int deleteFAQ(int faq_seq_id);
ArrayList<FAQ> selectFAQList();

}