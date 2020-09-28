package com.web.bomulsum.writer.myinfo.repository;

public class WriterMyinfoVO {
	private String writerBrandName;
	private String writerEmail;
	private String writerPhone;
	private String writerUrl;
	private String writerHonorName;
	private String writerHonorNum;
	private String writerAboutDispatch;
	private String writerHonorAccount;
	public String getWriterBrandName() {
		return writerBrandName;
	}
	public void setWriterBrandName(String writerBrandName) {
		this.writerBrandName = writerBrandName;
	}
	public String getWriterEmail() {
		return writerEmail;
	}
	public void setWriterEmail(String writerEmail) {
		this.writerEmail = writerEmail;
	}

	public String getWriterUrl() {
		return writerUrl;
	}
	public void setWriterUrl(String writerUrl) {
		this.writerUrl = writerUrl;
	}
	public String getWriterHonorName() {
		return writerHonorName;
	}
	public void setWriterHonorName(String writerHonorName) {
		this.writerHonorName = writerHonorName;
	}
	public String getWriterHonorNum() {
		return writerHonorNum;
	}
	public void setWriterHonorNum(String writerHonorNum) {
		this.writerHonorNum = writerHonorNum;
	}
	public String getWriterAboutDispatch() {
		return writerAboutDispatch;
	}
	public void setWriterAboutDispatch(String writerAboutDispatch) {
		this.writerAboutDispatch = writerAboutDispatch;
	}
	public String getWriterHonorAccount() {
		return writerHonorAccount;
	}
	public void setWriterHonorAccount(String writerHonorAccount) {
		this.writerHonorAccount = writerHonorAccount;
	}
	public String getWriterPhone() {
		return writerPhone;
	}
	public void setWriterPhone(String writerPhone) {
		this.writerPhone = writerPhone;
	}
	@Override
	public String toString() {
		return "WriterMyinfoVO [writerBrandName=" + writerBrandName + ", writerEmail=" + writerEmail + ", writerPhone="
				+ writerPhone + ", writerUrl=" + writerUrl + ", writerHonorName=" + writerHonorName
				+ ", writerHonorNum=" + writerHonorNum + ", writerAboutDispatch=" + writerAboutDispatch
				+ ", writerHonorAccount=" + writerHonorAccount + "]";
	}

	
}
