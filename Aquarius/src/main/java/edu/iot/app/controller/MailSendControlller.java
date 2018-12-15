package edu.iot.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mail")
public class MailSendControlller {
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("/test")
	public String sendTestMail()
			throws Exception {
		SimpleMailMessage message = new SimpleMailMessage();

		message.setFrom("asdf@gmail.com");
		message.setTo("asdf@gmail.com");
		message.setSubject("�뀒�뒪�듃 硫붿씪");
		message.setText("�뀒�뒪�듃 硫붿씪 �엯�땲�떎.");

		mailSender.send(message);
		
		return "redirect:/home";
	}
	
	@RequestMapping(value="/simple", method=RequestMethod.POST)
	public String sendSimpleMail(SimpleMailMessage message)
			throws Exception {

		mailSender.send(message);
		return "redirect:/home";
	}
	
	@RequestMapping(value="/mime", method=RequestMethod.POST)
	public String sendMimeMail()
			throws Exception {

/*		MimeMessage message = mailSender.createMimeMessage();

		message.setFrom(new InternetAddress(from));  
		message.addRecipient(RecipientType.TO, new InternetAddress(to));
		message.setSubject(subject);
		
		message.setText(text, "utf-8", "html");
		
		mailSender.send(message);*/
		return "redirect:/home";
	}	
	
}
