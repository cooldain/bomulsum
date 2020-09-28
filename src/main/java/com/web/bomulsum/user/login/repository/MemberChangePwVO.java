package com.web.bomulsum.user.login.repository;

public class MemberChangePwVO {
	private String chPw;
	private String name;
	private String email;
	private String phone;
	public String getChPw() {
		return chPw;
	}
	public void setChPw(String chPw) {
		this.chPw = chPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "MemberChangePwVO [chPw=" + chPw + ", name=" + name + ", email=" + email + ", phone=" + phone + "]";
	}
	
	
	
	
}
