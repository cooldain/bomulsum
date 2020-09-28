package com.web.bomulsum.user.login.repository;

public class MemberSessionVO {
	private String memberCode;
	private String memberEmail;
	private String memberName;
	private String memberLoginStat;
	private String memberImg;
	private String memberBirth;
	private String memberGender;
	private String memberGrade;
	
	
	
	public String getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}
	public String getMemberImg() {
		return memberImg;
	}
	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberLoginStat() {
		return memberLoginStat;
	}
	public void setMemberLoginStat(String memberLoginStat) {
		this.memberLoginStat = memberLoginStat;
	}
	@Override
	public String toString() {
		return "MemberSessionVO [memberCode=" + memberCode + ", memberEmail=" + memberEmail + ", memberName="
				+ memberName + ", memberLoginStat=" + memberLoginStat + ", memberBirth=" + memberBirth
				+ ", memberGender=" + memberGender + ", memberGrade=" + memberGrade + ", memberImg=" + memberImg + "]";
	}
	

	
	
	
}
