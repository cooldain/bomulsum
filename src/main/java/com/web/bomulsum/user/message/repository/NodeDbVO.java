package com.web.bomulsum.user.message.repository;

import java.sql.Date;

public class NodeDbVO {
	private String messageSeq;
	private String memberCodeSeq;
	private String writerCodeSeq;
	private String messageContent;
	private Date messageTime;
	private String messageRead;
	public String getMessageSeq() {
		return messageSeq;
	}
	public void setMessageSeq(String messageSeq) {
		this.messageSeq = messageSeq;
	}
	public String getMemberCodeSeq() {
		return memberCodeSeq;
	}
	public void setMemberCodeSeq(String memberCodeSeq) {
		this.memberCodeSeq = memberCodeSeq;
	}
	public String getWriterCodeSeq() {
		return writerCodeSeq;
	}
	public void setWriterCodeSeq(String writerCodeSeq) {
		this.writerCodeSeq = writerCodeSeq;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public Date getMessageTime() {
		return messageTime;
	}
	public void setMessageTime(Date messageTime) {
		this.messageTime = messageTime;
	}
	public String getMessageRead() {
		return messageRead;
	}
	public void setMessageRead(String messageRead) {
		this.messageRead = messageRead;
	}
	@Override
	public String toString() {
		return "NodeDbVO [messageSeq=" + messageSeq + ", memberCodeSeq=" + memberCodeSeq + ", writerCodeSeq="
				+ writerCodeSeq + ", messageContent=" + messageContent + ", messageTime=" + messageTime
				+ ", messageRead=" + messageRead + "]";
	}
	
	
}
