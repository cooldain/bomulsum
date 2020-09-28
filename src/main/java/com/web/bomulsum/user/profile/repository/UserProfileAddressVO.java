package com.web.bomulsum.user.profile.repository;

public class UserProfileAddressVO {
	private String member_address_seq;
	private String member_code_seq;
	private String member_address_zipcode;
	private String member_address_first;
	private String member_address_second;
	private String member_address_name;
	private String member_address_phone;
	public String getMember_address_seq() {
		return member_address_seq;
	}
	public void setMember_address_seq(String member_address_seq) {
		this.member_address_seq = member_address_seq;
	}
	public String getMember_code_seq() {
		return member_code_seq;
	}
	public void setMember_code_seq(String member_code_seq) {
		this.member_code_seq = member_code_seq;
	}
	public String getMember_address_zipcode() {
		return member_address_zipcode;
	}
	public void setMember_address_zipcode(String member_address_zipcode) {
		this.member_address_zipcode = member_address_zipcode;
	}
	public String getMember_address_first() {
		return member_address_first;
	}
	public void setMember_address_first(String member_address_first) {
		this.member_address_first = member_address_first;
	}

	public String getMember_address_second() {
		return member_address_second;
	}
	public void setMember_address_second(String member_address_second) {
		this.member_address_second = member_address_second;
	}
	public String getMember_address_name() {
		return member_address_name;
	}
	public void setMember_address_name(String member_address_name) {
		this.member_address_name = member_address_name;
	}
	public String getMember_address_phone() {
		return member_address_phone;
	}
	public void setMember_address_phone(String member_address_phone) {
		this.member_address_phone = member_address_phone;
	}
	@Override
	public String toString() {
		return "UserProfileAddressVO [member_address_seq=" + member_address_seq + ", member_code_seq=" + member_code_seq
				+ ", member_address_zipcode=" + member_address_zipcode + ", member_address_first="
				+ member_address_first + ", member_address_second=" + member_address_second + ", member_address_name="
				+ member_address_name + ", member_address_phone=" + member_address_phone + "]";
	}
	
	
}
