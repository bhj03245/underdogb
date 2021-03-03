 package com.traveler.web.user.controller;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.traveler.web.user.model.UserVO;
import com.traveler.web.user.service.UserService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userserivce;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	//ȸ������������ �̵�
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public void signUpGET() {
		logger.info("ȸ������������ ����");
	}
	
	//�α��� ������ �̵�
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {
		logger.info("�α��������� ����");
	}
	
	//ȸ������
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUpPOST(UserVO vo)throws Exception{
//		logger.info("signUp����");
		
		// ȸ������ ���� ����
		userserivce.insertUser(vo);
		
		logger.info("signUp service ����");
		return "redirect:/main";
	}
	
	// ���̵� �ߺ� �˻�
	@RequestMapping(value = "/userIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public String userIdCheckPOST(String id)throws Exception{
		logger.info("userIdCheck() ����");
		
		int result = userserivce.idCheck(id);
		
		logger.info("����� = " + result);
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	// �α���
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO vo, RedirectAttributes rttr)throws Exception {
//		System.out.println("login �޼��� ����");
//		System.out.println("���޵� ������ : " + vo);
		
		HttpSession session = request.getSession();
		UserVO lvo = userserivce.userLogin(vo);
		
		if(lvo == null) {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			session.setAttribute("login", "false");
			return "redirect:/";
		}
		session.setAttribute("vo", lvo);
		session.setAttribute("login", "true");
		return "redirect:/main";
	}
	
	/* �α׾ƿ� */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logoutGET(HttpServletRequest request)throws Exception {
		
		logger.info("logoutGET �޼��� ����");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		return "redirect:/";
	}
	
//	//�α���2
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String login(HttpServletRequest request, HttpSession session, UserVO vo)throws Exception {
//		vo.setId(request.getParameter("id"));
//		vo.setPassword(request.getParameter("password"));
//		
//		if(userserivce.userLogin(session, vo) == 1) {
//			session.setAttribute("id", request.getParameter("id"));
//		}
//	}
	
	// �̸��� ����
	@RequestMapping(value = "/CheckMail", method = RequestMethod.GET)
	@ResponseBody
	public void mailCheckGET(String email)throws Exception{
		logger.info("�̸��� ������ ���� Ȯ��");
		logger.info("������ȣ : " + email);
		
		//���� ����
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("������ȣ" + checkNum);
		
		//�̸��� ������
		String setForm = "kksskk1234@naver.com";
		String toMail = email;
		String title = "ȸ������ ���� �̸��� �Դϴ�.";
		String content = "Ȩ�������� �湮���ּż� �����մϴ�." +
						"<br><br>" +
						"���� ��ȣ�� " + checkNum + "�Դϴ�." +
						"<br>" +
						"�ش� ������ȣ�� ������ȣ Ȯ�ζ��� �����Ͽ� �ּ���.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setForm);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MailException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
				
	}
}
