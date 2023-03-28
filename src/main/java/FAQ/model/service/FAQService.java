package FAQ.model.service;

import FAQ.model.vo.FAQ;

import java.util.ArrayList;


public interface FAQService {

    int insertFAQ(FAQ faq);
    int deleteFAQ(int faq_seq_id);
    int updateFAQ(FAQ faq);
    FAQ selectFAQ(int faq_seq_id);

    ArrayList<FAQ> selectList();

}
