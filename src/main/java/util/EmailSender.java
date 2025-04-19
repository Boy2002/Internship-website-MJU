package util;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;


public class EmailSender {
    public static void sendEmail(String to, String subject, String content) {
        // กำหนดข้อมูลการตั้งค่า SMTP
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // สร้าง session ด้วยการตั้งค่าและการรับรองความถูกต้อง
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("meajoitscisendemail@gmail.com", "ourh sgjk rrhs tzsa"); // ใช้ App Password
            }
        });

        try {
            // สร้างข้อความอีเมล
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("meajoitscisendemail@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(content);

            // ส่งอีเมล
            Transport.send(message);
            System.out.println("Email sent successfully");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
