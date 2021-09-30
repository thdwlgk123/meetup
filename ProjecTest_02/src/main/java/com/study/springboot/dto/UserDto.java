package com.study.springboot.dto;

import lombok.Data;

@Data
public class UserDto {
	private String userid;
	private String userpassword;
	private String username;
	private String useremail;
	private String email_id;
	private String email_domain;
	private String userprofile;
	private String authority;
	private String marketcheck;
	private int enabled;
	private String txtMobile1;
	private String txtMobile2;
	private String txtMobile3;
	private String usergender;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getEmail_domain() {
		return email_domain;
	}
	public void setEmail_domain(String email_domain) {
		this.email_domain = email_domain;
	}
	public String getUserprofile() {
		return userprofile;
	}
	public void setUserprofile(String userprofile) {
		this.userprofile = userprofile;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getMarketcheck() {
		return marketcheck;
	}
	public void setMarketcheck(String marketcheck) {
		this.marketcheck = marketcheck;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getTxtMobile1() {
		return txtMobile1;
	}
	public void setTxtMobile1(String txtMobile1) {
		this.txtMobile1 = txtMobile1;
	}
	public String getTxtMobile2() {
		return txtMobile2;
	}
	public void setTxtMobile2(String txtMobile2) {
		this.txtMobile2 = txtMobile2;
	}
	public String getTxtMobile3() {
		return txtMobile3;
	}
	public void setTxtMobile3(String txtMobile3) {
		this.txtMobile3 = txtMobile3;
	}
	public String getUsergender() {
		return usergender;
	}
	public void setUsergender(String usergender) {
		this.usergender = usergender;
	}
	
	
}
