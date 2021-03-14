package com.traveler.web.user.model;

import lombok.Data;

@Data
public class UserVO {
	private String id;
	private String password;
	private String name;
	private String email;
}
