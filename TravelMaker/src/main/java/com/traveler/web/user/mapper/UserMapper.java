package com.traveler.web.user.mapper;

import com.traveler.web.user.model.UserVO;

public interface UserMapper {
	
	// ȸ������
	public void insertUser(UserVO vo);
	// ���̵� �ߺ� �˻�
	public int idCheck(String id);
	// �α���
	public UserVO userLogin(UserVO vo);

}
