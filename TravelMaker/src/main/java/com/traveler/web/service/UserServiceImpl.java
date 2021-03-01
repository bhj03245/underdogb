package com.traveler.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveler.web.mapper.UserMapper;
import com.traveler.web.model.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper usermapper;
	//회원가입
	@Override
	public void insertUser(UserVO vo)throws Exception {
		
		usermapper.insertUser(vo);
	}
	//아이디 중복 검사
	@Override
	public int idCheck(String id)throws Exception {
		return usermapper.idCheck(id);
	}
	//로그인
	@Override
	public UserVO userLogin(UserVO vo)throws Exception {
		
		return usermapper.userLogin(vo);
	}
}
