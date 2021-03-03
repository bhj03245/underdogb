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
import org.springframework.ui.Model;
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
	
	// 회원가입페이지 이동
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public void signUpGET() {
		logger.info("회원가입 페이지 이동");
	}
	
	// 로그인페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {
		logger.info("로그인 페이지 이동");
	}
	
	// 회원가입
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUpPOST(UserVO vo)throws Exception{
//		logger.info("signUp");
		
		// 회원가입 서비스 실행
		userserivce.insertUser(vo);
		
		logger.info("signUp service 성공");
		return "redirect:/main";
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/userIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public String userIdCheckPOST(String id)throws Exception{
		logger.info("userIdCheck() 진입");
		
		int result = userserivce.idCheck(id);
		
		logger.info("결과값 = " + result);
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO vo, RedirectAttributes rttr)throws Exception {
		System.out.println("login 메서드 진입");
		System.out.println("전달된 데이터: " + vo);
		
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
	
	/* 로그아웃 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logoutGET(HttpServletRequest request)throws Exception {
		
		logger.info("logoutGET 로그아웃");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		return "redirect:/";
	}
	
//	//로그인 2
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String login(HttpServletRequest request, HttpSession session, UserVO vo)throws Exception {
//		vo.setId(request.getParameter("id"));
//		vo.setPassword(request.getParameter("password"));
//		
//		if(userserivce.userLogin(session, vo) == 1) {
//			session.setAttribute("id", request.getParameter("id"));
//		}
//	}
	
	// 이메일 인증
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public void mailCheckGET(String email)throws Exception{
		logger.info("이메일 데이터 전송 확인");
		logger.info("인증 번호 : " + email);
		
		// 인증 번호 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호" + checkNum);
		
		// 이메일 보내기
		String setForm = "kksskk1234@naver.com";
		String toMail = email;
		String title = "회원가입 인증 메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." +
						"<br><br>" +
						"인증 번호는 " + checkNum + "입니다." +
						"<br>" +
						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
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
	// 회원정보 보기
	@RequestMapping(value = "/info", method = RequestMethod.GET)
	public void infoGET(HttpSession session, Model model)throws Exception {
		String id = (String) session.getAttribute("id");
		logger.info("C: 회원정보보기 GET의 아이디 " + id);
		
		UserVO vo = userserivce.readUser(id);
		
		model.addAttribute("UserVO", vo);
		logger.info("C:회원정보보기 GET으 VO" + vo);
	}
	// 회원정보 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateGET(HttpSession session, Model model)throws Exception {
		model.addAttribute("UserVO", userserivce.readUser((String)session.getAttribute("id")));
		return "/user/userUpdateForm";
	}
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(UserVO vo)throws Exception {
		logger.info("C: 회원정보 입력페이지 POST");
		
		userserivce.updateUser(vo);
		return "redirect:/";
	}
	// 회원정보 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteGET(HttpSession session)throws Exception {
		logger.info("C: 회원정보 삭제 GET");
		String id = (String) session.getAttribute("id");
		if(id == null) {
			return "redirect:/";
		}
		return "/user/userDeleteForm";
	}
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deletePOST(UserVO vo, HttpSession session)throws Exception {
		logger.info("C: 회원정보 삭제 POST");
		logger.info("C: deleteForm전달정보" + vo);
		userserivce.deleteUser(vo);
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value = "/MyTravel.do", method = RequestMethod.GET)
	public String MyTravelGET(HttpServletRequest request)throws Exception {
		
		logger.info("MyTravelGET 마이트래벌");
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		return "redirect:/MyTravel";
	}
}
