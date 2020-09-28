package com.web.bomulsum.user.login.repository;

public class MemberVO {
	private int memberCode;
	private String memberEmail;
	private String memberPassword;
	private String memberName;
	private String memberPhone;
	private String memberRecCode;
	private char memberSmsAgree;
	private char memberEmailAgree;
	
	
	
	
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberRecCode() {
		return memberRecCode;
	}
	public void setMemberRecCode(String memberRecCode) {
		this.memberRecCode = memberRecCode;
	}
	public char getMemberSmsAgree() {
		return memberSmsAgree;
	}
	public void setMemberSmsAgree(char memberSmsAgree) {
		this.memberSmsAgree = memberSmsAgree;
	}
	public char getMemberEmailAgree() {
		return memberEmailAgree;
	}
	public void setMemberEmailAgree(char memberEmailAgree) {
		this.memberEmailAgree = memberEmailAgree;
	}
	@Override
	public String toString() {
		return "MemberVO [memberCode=" + memberCode + ", memberEmail=" + memberEmail + ", memberPassword="
				+ memberPassword + ", memberName=" + memberName + ", memberPhone=" + memberPhone + ", memberRecCode="
				+ memberRecCode + ", memberSmsAgree=" + memberSmsAgree + ", memberEmailAgree=" + memberEmailAgree + "]";
	}
	

	
	
	
	
	
}
