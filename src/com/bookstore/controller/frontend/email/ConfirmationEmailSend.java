package com.bookstore.controller.frontend.email;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class ConfirmationEmailSend {
	
	String host = "smtp.gmail.com";
	String port = "587";
	String portSocket="465";
	String userName = "dkbookstore123@gmail.com";
	String password = "16179086Dp!";

	public void sendEmail(String toAddress,
			String subject, String message) throws AddressException, MessagingException {

		// sets SMTP server properties
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", port);
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.socketFactory.port", portSocket);  
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

		// creates a new session with an authenticator
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, password);
			}
		};
		Session session = Session.getInstance(properties, auth);

		// creates a new e-mail message
		Message msg = new MimeMessage(session);

		msg.setFrom(new InternetAddress(userName));
		InternetAddress[] toAddresses = { new InternetAddress(toAddress) };
		msg.setRecipients(Message.RecipientType.TO, toAddresses);
		msg.setSubject(subject);
		msg.setSentDate(new Date());
		// set plain text message
		msg.setText(message);

		// sends the e-mail
		Transport.send(msg);
	}

	/**
	 * Test the send e-mail method
	 *
	 */
	public ConfirmationEmailSend(String mailTo, String subject, String message) {
		try {
			sendEmail(mailTo, subject, message);
			System.out.println("Email sent.");
		} catch (Exception ex) {
			System.out.println("Failed to sent email.");
			ex.printStackTrace();
		}
	}
}