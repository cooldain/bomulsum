package com.web.bomulsum.user.productInfo.repository;

public class JoinVO{

	private String memberProfile; 
	private String memberName;
	private String memberCodeSeq;
	
	
	public String getMemberCodeSeq() {
		return memberCodeSeq;
	}
	public void setMemberCodeSeq(String memberCodeSeq) {
		this.memberCodeSeq = memberCodeSeq;
	}
	public String getMemberProfile() {
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	@Override
	public String toString() {
		return "JoinVO [memberProfile=" + memberProfile + ", memberName=" + memberName +", memberCodeSeq"+ memberCodeSeq + "]";
	}
	
	
}
