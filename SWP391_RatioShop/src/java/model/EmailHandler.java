/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author admin
 */
public class EmailHandler {

    public static void sendEMail(String toEmail, String subject, String text) {
        try {
            String fromEmail = (String) new InitialContext().lookup("java:comp/env/email");
            String password = (String) new InitialContext().lookup("java:comp/env/password");
            Properties prop = System.getProperties();
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "587");
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.starttls.enable", "true");
            Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            try {
//            transport = session.getTransport("smtp");
//            transport.connect();
                Message mess = new MimeMessage(session);
                mess.setFrom(new InternetAddress(fromEmail));
                mess.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
                mess.setSubject(subject);
                mess.setText(text);
                mess.setContent(text, "text/html;charset=UTF-8");
                Transport.send(mess);
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        } catch (NamingException ex) {
            ex.printStackTrace();
        }
    }

    public static String generateCodeVerify() {
        Random rd = new Random();
        int codeVerify = rd.nextInt(899999) + 100000;
    
        return  String.valueOf(codeVerify);
    }
}
