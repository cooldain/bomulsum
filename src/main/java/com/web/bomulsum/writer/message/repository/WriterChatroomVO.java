package com.web.bomulsum.writer.message.repository;

public class WriterChatroomVO {
	private String memberCode;
	private String memberName;
	private String memberImg;
	private String chatroomCode;
	private int nonReadMsgCount;
	private String lastMessage;
	
	
	public String getLastMessage() {
		return lastMessage;
	}
	public void setLastMessage(String lastMessage) {
		this.lastMessage = lastMessage;
	}
	public int getNonReadMsgCount() {
		return nonReadMsgCount;
	}
	public void setNonReadMsgCount(int nonReadMsgCount) {
		this.nonReadMsgCount = nonReadMsgCount;
	}
	public String getChatroomCode() {
		return chatroomCode;
	}
	public void setChatroomCode(String chatroomCode) {
		this.chatroomCode = chatroomCode;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberImg() {
		return memberImg;
	}
	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}
	@Override
	public String toString() {
		return "WriterChatroomVO [memberCode=" + memberCode + ", memberName=" + memberName + ", memberImg=" + memberImg
				+ ", chatroomCode=" + chatroomCode + ", nonReadMsgCount=" + nonReadMsgCount + ", lastMessage="
				+ lastMessage + "]";
	}

	
	
	
	
	
}
