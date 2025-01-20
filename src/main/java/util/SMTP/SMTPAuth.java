package util.SMTP;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuth extends Authenticator {
    private PasswordAuthentication auth;

    public SMTPAuth() {
        String username = "byul4167@gmail.com";
        String password = "upfxpcyfpmdyosxq";
        auth = new PasswordAuthentication(username, password);
    }

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return auth;
    }
}
