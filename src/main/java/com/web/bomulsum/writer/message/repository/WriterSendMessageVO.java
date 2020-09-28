package com.web.bomulsum.writer.message.repository;

public class WriterSendMessageVO {
	private String messageOwner;
	private String chatroomCode;
	private String messageSenderCode;
	private String messageReceiverCode;
	private String messageContent;
	
	
	public String getChatroomCode() {
		return chatroomCode;
	}
	public void setChatroomCode(String chatroomCode) {
		this.chatroomCode = chatroomCode;
	}
	public String getMessageOwner() {
		return messageOwner;
	}
	public void setMessageOwner(String messageOwner) {
		this.messageOwner = messageOwner;
	}
	public String getMessageSenderCode() {
		return messageSenderCode;
	}
	public void setMessageSenderCode(String messageSenderCode) {
		this.messageSenderCode = messageSenderCode;
	}
	public String getMessageReceiverCode() {
		return messageReceiverCode;
	}
	public void setMessageReceiverCode(String messageReceiverCode) {
		this.messageReceiverCode = messageReceiverCode;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	@Override
	public String toString() {
		return "WriterSendMessageVO [messageOwner=" + messageOwner + ", chatroomCode=" + chatroomCode
				+ ", messageSenderCode=" + messageSenderCode + ", messageReceiverCode=" + messageReceiverCode
				+ ", messageContent=" + messageContent + "]";
	}
	
	
	
	
}
