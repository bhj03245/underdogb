package com.traveler.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.traveler.web.model.UserVO;
import com.traveler.web.service.UserService;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userserivce;
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
			return "redirect:/";
		}
		session.setAttribute("vo", lvo);
		return "redirect:/main";
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
}
