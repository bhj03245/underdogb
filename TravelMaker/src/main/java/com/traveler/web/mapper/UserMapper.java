package com.traveler.web.mapper;

import com.traveler.web.model.UserVO;

public interface UserMapper {
	
	// ȸ������
	public void insertUser(UserVO vo);
	// ���̵� �ߺ� �˻�
	public int idCheck(String id);
	// �α���
	public UserVO userLogin(UserVO vo);

}
