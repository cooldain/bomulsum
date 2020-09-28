package com.web.bomulsum.user.message.repository;

public class UserInsertChatVo {
	private String memberCode;
	private String writerCode;
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getWriterCode() {
		return writerCode;
	}
	public void setWriterCode(String writerCode) {
		this.writerCode = writerCode;
	}
	@Override
	public String toString() {
		return "UserInsertChatVo [memberCode=" + memberCode + ", writerCode=" + writerCode + "]";
	}
	
}
