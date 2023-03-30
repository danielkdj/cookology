package org.oaoc.cookology.FAQ.model.vo;

public class FAQ {
    private int faq_seq_id;
    private String frequentlyAsked;
    private String questions;

    public FAQ() {
    }

    public FAQ(int faq_seq_id, String frequentlyAsked, String questions) {
        this.faq_seq_id = faq_seq_id;
        this.frequentlyAsked = frequentlyAsked;
        this.questions = questions;
    }

    public int getFaq_seq_id() {
        return faq_seq_id;
    }

    public void setFaq_seq_id(int faq_seq_id) {
        this.faq_seq_id = faq_seq_id;
    }

    public String getFrequentlyAsked() {
        return frequentlyAsked;
    }

    public void setFrequentlyAsked(String frequentlyAsked) {
        this.frequentlyAsked = frequentlyAsked;
    }

    public String getQuestions() {
        return questions;
    }

    public void setQuestions(String questions) {
        this.questions = questions;
    }

    @Override
    public String toString() {
        return "org.oaoc.cookology.FAQ{" +
                "faq_seq_id=" + faq_seq_id +
                ", frequentlyAsked='" + frequentlyAsked + '\'' +
                ", questions='" + questions + '\'' +
                '}';
    }
}
