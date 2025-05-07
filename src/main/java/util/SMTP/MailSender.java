package util.SMTP;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import util.ConfigReader;

import java.util.Properties;

public class MailSender {

    private static final String SECRET_EmailUsername = ConfigReader.getEmailUsername();

    public static void sendEmail(String recipient, String subject, String content) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Session session = Session.getInstance(props, new SMTPAuth());

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(SECRET_EmailUsername));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        message.setSubject(subject);
        message.setContent(content, "text/html;charset=utf-8");

        Transport.send(message);
    }
}
