package com.traveler.web.service;

import javax.servlet.http.HttpSession;

import com.traveler.web.model.UserVO;

public interface UserService {
	
	//회원가입
	public void insertUser(UserVO vo)throws Exception;
	//아이디 중복 검사
	public int idCheck(String id)throws Exception;
	//로그인
	public UserVO userLogin(UserVO vo)throws Exception;
	
}
