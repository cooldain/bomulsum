package com.web.bomulsum.manager.list.repository;

public class ManagerListUserVO {
	
	private String member_code_seq;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_grade;

	@Override
	public String toString() {
		return "ManagerListUserVO [member_code_seq=" + member_code_seq + ", member_name=" + member_name
				+ ", member_email=" + member_email + ", member_phone=" + member_phone + ", member_grade=" + member_grade
				+ "]";
	}

	public String getMember_code_seq() {
		return member_code_seq;
	}

	public void setMember_code_seq(String member_code_seq) {
		this.member_code_seq = member_code_seq;
	}

	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}


	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_grade() {
		return member_grade;
	}
	public void setMember_grade(String member_grade) {
		this.member_grade = member_grade;
	}

	
}
