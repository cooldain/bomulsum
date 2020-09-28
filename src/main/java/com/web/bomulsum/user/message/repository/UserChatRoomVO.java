package com.web.bomulsum.user.message.repository;

public class UserChatRoomVO {
	private String writerCode;
	private String writerName;
	private String writerImg;
	private String writerBrandName;
	private String chatroomCode;
	private int nonReadMsgCount;
	private String lastMessage;
	
	
	public String getChatroomCode() {
		return chatroomCode;
	}
	public void setChatroomCode(String chatroomCode) {
		this.chatroomCode = chatroomCode;
	}
	public int getNonReadMsgCount() {
		return nonReadMsgCount;
	}
	public void setNonReadMsgCount(int nonReadMsgCount) {
		this.nonReadMsgCount = nonReadMsgCount;
	}
	public String getLastMessage() {
		return lastMessage;
	}
	public void setLastMessage(String lastMessage) {
		this.lastMessage = lastMessage;
	}
	public String getWriterBrandName() {
		return writerBrandName;
	}
	public void setWriterBrandName(String writerBrandName) {
		this.writerBrandName = writerBrandName;
	}
	public String getWriterCode() {
		return writerCode;
	}
	public void setWriterCode(String writerCode) {
		this.writerCode = writerCode;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getWriterImg() {
		return writerImg;
	}
	public void setWriterImg(String writerImg) {
		this.writerImg = writerImg;
	}
	@Override
	public String toString() {
		return "UserChatRoomVO [writerCode=" + writerCode + ", writerName=" + writerName + ", writerImg=" + writerImg
				+ ", writerBrandName=" + writerBrandName + ", chatroomCode=" + chatroomCode + ", nonReadMsgCount="
				+ nonReadMsgCount + ", lastMessage=" + lastMessage + "]";
	}
	

	
	
	
}
