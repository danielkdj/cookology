package FAQ.model.vo;

public class FAQ {
    private int faq_seq_id;
    private String frequentlyAsked;
    private String auestions;

    public FAQ() {
    }

    public FAQ(int faq_seq_id, String frequentlyAsked, String auestions) {
        this.faq_seq_id = faq_seq_id;
        this.frequentlyAsked = frequentlyAsked;
        this.auestions = auestions;
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

    public String getAuestions() {
        return auestions;
    }

    public void setAuestions(String auestions) {
        this.auestions = auestions;
    }

    @Override
    public String toString() {
        return "FAQ{" +
                "faq_seq_id=" + faq_seq_id +
                ", frequentlyAsked='" + frequentlyAsked + '\'' +
                ", auestions='" + auestions + '\'' +
                '}';
    }
}
