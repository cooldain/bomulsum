package com.web.bomulsum.user.login.repository;

public class LoginVO {
	private String email;
	private String password;
	private String rememberEmail;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRememberEmail() {
		return rememberEmail;
	}
	public void setRememberEmail(String rememberEmail) {
		this.rememberEmail = rememberEmail;
	}
	@Override
	public String toString() {
		return "LoginVO [email=" + email + ", password=" + password + ", rememberEmail=" + rememberEmail + "]";
	}
	
	
	
}
