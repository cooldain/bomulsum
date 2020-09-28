package com.web.bomulsum.writer.login.repository;

import java.util.Map;

public class WriterRegisterVO {

	private String writerSeq;
	private String writerEmail;
	private String writerPassword;
	private String writerName;
	private String sessionId;
	private String limitTime;
	private boolean autoLogin;
	private int gemSum;
	

	public int getGemSum() {
		return gemSum;
	}
	public void setGemSum(int gemSum) {
		this.gemSum = gemSum;
	}
	
	public String getWriterSeq() {
		return writerSeq;
	}
	public void setWriterSeq(String writerSeq) {
		this.writerSeq = writerSeq;
	}
	public String getWriterEmail() {
		return writerEmail;
	}
	public void setWriterEmail(String writerEmail) {
		this.writerEmail = writerEmail;
	}
	public String getWriterPassword() {
		return writerPassword;
	}
	public void setWriterPassword(String writerPassword) {
		this.writerPassword = writerPassword;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getLimitTime() {
		return limitTime;
	}
	public void setLimitTime(String limitTime) {
		this.limitTime = limitTime;
	}
	public boolean isAutoLogin() {
		return autoLogin;
	}
	public void setAutoLogin(boolean autoLogin) {
		this.autoLogin = autoLogin;
	}
	@Override
	public String toString() {
		return "WriterRegisterVO [writerSeq=" + writerSeq + ", writerEmail=" + writerEmail + ", writerPassword="
				+ writerPassword + ", writerName=" + writerName + ", sessionId=" + sessionId + ", limitTime="
				+ limitTime + ", autoLogin=" + autoLogin + ", gemSum=" + gemSum + ", getGemSum()=" + getGemSum()
				+ ", getWriterSeq()=" + getWriterSeq() + ", getWriterEmail()=" + getWriterEmail()
				+ ", getWriterPassword()=" + getWriterPassword() + ", getWriterName()=" + getWriterName()
				+ ", getSessionId()=" + getSessionId() + ", getLimitTime()=" + getLimitTime() + ", isAutoLogin()="
				+ isAutoLogin() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
