package com.traveler.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.traveler.web.mapper.UserMapper;
import com.traveler.web.model.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper usermapper;
	//ȸ������
	@Override
	public void insertUser(UserVO vo)throws Exception {
		
		usermapper.insertUser(vo);
	}
	//���̵� �ߺ� �˻�
	@Override
	public int idCheck(String id)throws Exception {
		return usermapper.idCheck(id);
	}
	//�α���
	@Override
	public UserVO userLogin(UserVO vo)throws Exception {
		
		return usermapper.userLogin(vo);
	}
}
