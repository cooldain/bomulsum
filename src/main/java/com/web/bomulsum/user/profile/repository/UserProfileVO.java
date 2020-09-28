package com.web.bomulsum.user.profile.repository;

import java.sql.Date;


public class UserProfileVO {
	private String member_code_seq;
	private String member_email;
	private String member_name;
	private String member_phone;
	private String member_rec_code;
	private String member_term_agree;
	private String member_private_agree;
	private String member_sms_agree;
	private String member_email_agree;
	private Date member_birth;
	private String member_gender;
	private String member_grade;
	private String member_profile;
	
	public String getMember_code_seq() {
		return member_code_seq;
	}
	public void setMember_code_seq(String member_code_seq) {
		this.member_code_seq = member_code_seq;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_rec_code() {
		return member_rec_code;
	}
	public void setMember_rec_code(String member_rec_code) {
		this.member_rec_code = member_rec_code;
	}
	public String getMember_term_agree() {
		return member_term_agree;
	}
	public void setMember_term_agree(String member_term_agree) {
		this.member_term_agree = member_term_agree;
	}
	public String getMember_private_agree() {
		return member_private_agree;
	}
	public void setMember_private_agree(String member_private_agree) {
		this.member_private_agree = member_private_agree;
	}
	public String getMember_sms_agree() {
		return member_sms_agree;
	}
	public void setMember_sms_agree(String member_sms_agree) {
		this.member_sms_agree = member_sms_agree;
	}
	public String getMember_email_agree() {
		return member_email_agree;
	}
	public void setMember_email_agree(String member_email_agree) {
		this.member_email_agree = member_email_agree;
	}
	public Date getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(Date member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}
	public String getMember_profile() {
		return member_profile;
	}
	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}
	
	@Override
	public String toString() {
		return "UserProfileVO [member_code_seq=" + member_code_seq + ", member_email=" + member_email + ", member_name="
				+ member_name + ", member_phone=" + member_phone + ", member_rec_code=" + member_rec_code
				+ ", member_term_agree=" + member_term_agree + ", member_private_agree=" + member_private_agree
				+ ", member_sms_agree=" + member_sms_agree + ", member_email_agree=" + member_email_agree
				+ ", member_birth=" + member_birth + ", member_gender=" + member_gender + ", member_grade="
				+ member_grade + ", member_profile=" + member_profile + "]";
	}
	
}
