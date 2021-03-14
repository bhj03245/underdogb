 package com.traveler.web.user.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.traveler.web.user.mapper.UserMapper;
import com.traveler.web.user.model.UserVO;
import com.traveler.web.user.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userserivce;
	
	@Autowired
	private JavaMailSender mailSender;
		
	// 회원가입
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUpPOST(UserVO vo)throws Exception{
		
		// 회원가입 서비스 실행
		userserivce.insertUser(vo);
		
		return "redirect:/";
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/userIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public String userIdCheckPOST(String id)throws Exception{
		
		int result = userserivce.idCheck(id);
		
		if(result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO vo, RedirectAttributes rttr)throws Exception {

		
		HttpSession session = request.getSession();		
		UserVO lvo = userserivce.userLogin(vo);
		if(lvo == null) {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			session.setAttribute("login", "false");
			return "redirect:/";
		}
		session.setAttribute("id", lvo.getId());
		session.setAttribute("lvo", lvo);
		session.setAttribute("login", "true");
		return "redirect:/main";
	}
	
	/* 로그아웃 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logoutGET(HttpServletRequest request)throws Exception {

		
		HttpSession session = request.getSession();
		
		session.invalidate();
		return "redirect:/";
	}
	
	
	// 이메일 인증
	@RequestMapping(value = "/emailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String emailCheckGET(String email)throws Exception{
	
		// 인증 번호 생성
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
//		
//		// 이메일 보내기
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
		String num = Integer.toString(checkNum);
		return num;
				
	}
	// 회원정보 보기
	@RequestMapping(value = "/userInfo.do", method = RequestMethod.GET)
	public String readUserGET(HttpSession session, Model model)throws Exception {
		String id = (String) session.getAttribute("id");
		
		UserVO vo = userserivce.readUser(id);
		model.addAttribute("VO", vo);
		return "user/info";
	}
	// 회원정보 수정
	@RequestMapping(value = "/user/update", method = RequestMethod.GET)
	public String updateGET(HttpSession session, Model model)throws Exception {
		model.addAttribute("VO", userserivce.readUser((String)session.getAttribute("id")));
		
		return "user/update";
	}
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String updatePOST(UserVO vo, HttpSession session, Model model)throws Exception {
		userserivce.updateUser(vo);
		model.addAttribute("VO", userserivce.readUser((String)session.getAttribute("id")));

		return "user/info";
	}
	// 회원정보 삭제
	@RequestMapping(value = "/user/delete", method = RequestMethod.GET)
	public String deleteGET(HttpSession session, Model model)throws Exception {
		model.addAttribute("VO", userserivce.readUser((String)session.getAttribute("id")));
		return "user/delete";
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String deletePOST(HttpServletResponse response, Model model, UserVO vo, HttpSession session, RedirectAttributes rttr)throws Exception {
		model.addAttribute("VO", userserivce.readUser((String)session.getAttribute("id")));
		

		UserVO pw = (UserVO)session.getAttribute("lvo");
		String sessionPass = pw.getPassword();
		String voPass = vo.getPassword();
		if(!(sessionPass.equals(voPass))) {
			model.addAttribute("msg", "메세지");
			rttr.addFlashAttribute("msg", false);
			return "user/delete";
		}
		userserivce.deleteUser(vo);
		session.invalidate();
		return "redirect:/";
	}
	// 마이페이지
	@RequestMapping(value = "/MyTravel.do", method = RequestMethod.GET)
	public String MyTravelGET(HttpServletRequest request)throws Exception {
		
		
		HttpSession session = request.getSession();
		
		return "user/MyTravel";
	}
	
	// 아이디 찾기 메일
	@RequestMapping(value = "/searchid_email", method = RequestMethod.POST)
	public UserVO searchidEmailPOST(String email, UserVO vo)throws Exception {
		UserVO lvo = userserivce.searchid(vo);
		String setForm = "kksskk1234@naver.com";
		String toMail = email;
		String title = "회원님의 아이디 입니다.";
		String content = "회원님의 아이디는 " + lvo.getId() + " 입니다";
		
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
		return lvo;
				
	}
	

	// 비밀번호 찾기 메일	
	@RequestMapping(value = "/searchpw_email", method = RequestMethod.POST)
	public UserVO searchpwEmailPOST(String email, UserVO vo)throws Exception {
		
		UserVO lvo = userserivce.searchpw(vo);
		String setForm = "kksskk1234@naver.com";
		String toMail = email;
		String title = "회원님의 비밀번호 입니다.";
		String content = "회원님의 비밀번호는 " + lvo.getPassword() + " 입니다";
		
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
		return lvo;
				
	}
}