package com.web.bomulsum.writer.message.repository;

public class MessageVO {
	private String messageSeq;
	private String messageSenderCode;
	private String messageReceiverCode;
	private String messageContent;
	public String getMessageSeq() {
		return messageSeq;
	}
	public void setMessageSeq(String messageSeq) {
		this.messageSeq = messageSeq;
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
		return "MessageVO [messageSeq=" + messageSeq + ", messageSenderCode=" + messageSenderCode
				+ ", messageReceiverCode=" + messageReceiverCode + ", messageContent=" + messageContent + "]";
	}
	
	
}
