package org.oaoc.cookology.users.model.vo;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

@Configuration
public class MailConfig {
    @Bean
    public JavaMailSender javaMailService() {
        JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();

        javaMailSender.setHost("smtp.naver.com");
        javaMailSender.setUsername("hjm8686@naver.com");
        javaMailSender.setPassword("jm5411!56");

        javaMailSender.setPort(587);

        javaMailSender.setJavaMailProperties(getMailProperties());

        return javaMailSender;
    }

    private Properties getMailProperties() {
        Properties properties = new Properties();
        properties.setProperty("mail.transport.protocol", "smtp");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable","true");
        properties.setProperty("mail.debug", "true");
        properties.setProperty("mail.smtp.ssl.trust","smtp.naver.com");
       // properties.setProperty("mail.smtp.ssl.enable","true");
        properties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        return properties;
    }
}