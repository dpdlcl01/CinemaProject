package util.SMTP;

import util.ConfigReader;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuth extends Authenticator {

    private PasswordAuthentication auth;

    private static final String SECRET_EmailUsername = ConfigReader.getEmailUsername();
    private static final String SECRET_EmailUserpassword = ConfigReader.getEmailUserpassword();

    public SMTPAuth() {
        String username = "SECRET_EmailUsername";
        String password = "SECRET_EmailUserpassword";
        auth = new PasswordAuthentication(username, password);
    }

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return auth;
    }
}
