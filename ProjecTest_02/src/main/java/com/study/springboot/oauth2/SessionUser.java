package com.study.springboot.oauth2;

import java.io.Serializable;

import lombok.Getter;

@Getter
public class SessionUser implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String name;
	private String email;
	private String picture;

	public SessionUser(String name, String email, String picture) {
		this.name = name;
		this.email = email;
		this.picture = picture;
	}
}