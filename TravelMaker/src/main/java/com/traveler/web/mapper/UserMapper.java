package com.traveler.web.mapper;

import com.traveler.web.model.UserVO;

public interface UserMapper {
	
	// 회원가입
	public void insertUser(UserVO vo);
	// 아이디 중복 검사
	public int idCheck(String id);
	// 로그인
	public UserVO userLogin(UserVO vo);

}
