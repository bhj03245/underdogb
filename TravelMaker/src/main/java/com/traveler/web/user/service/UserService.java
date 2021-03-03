package com.traveler.web.user.service;

import javax.servlet.http.HttpSession;

import com.traveler.web.user.model.UserVO;

public interface UserService {
	
	//ȸ������
	public void insertUser(UserVO vo)throws Exception;
	//���̵� �ߺ� �˻�
	public int idCheck(String id)throws Exception;
	//�α���
	public UserVO userLogin(UserVO vo)throws Exception;
	// �̸��� ����
	
}
