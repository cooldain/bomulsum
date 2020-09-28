package com.web.bomulsum.writer.profile.repository;

public class WriterProfileVO {
	private String writerProfileImg;
	private String writerCoverImg;
	private String writerBrandName;
	private String writerIntro;
	private String writerCodeSeq;
	
	
	public String getWriterCodeSeq() {
		return writerCodeSeq;
	}
	public void setWriterCodeSeq(String writerCodeSeq) {
		this.writerCodeSeq = writerCodeSeq;
	}
	public String getWriterProfileImg() {
		return writerProfileImg;
	}
	public void setWriterProfileImg(String writerProfileImg) {
		this.writerProfileImg = writerProfileImg;
	}
	public String getWriterCoverImg() {
		return writerCoverImg;
	}
	public void setWriterCoverImg(String writerCoverImg) {
		this.writerCoverImg = writerCoverImg;
	}
	public String getWriterBrandName() {
		return writerBrandName;
	}
	public void setWriterBrandName(String writerBrandName) {
		this.writerBrandName = writerBrandName;
	}
	public String getWriterIntro() {
		return writerIntro;
	}
	public void setWriterIntro(String writerIntro) {
		this.writerIntro = writerIntro;
	}
	@Override
	public String toString() {
		return "WriterProfileVO [writerProfileImg=" + writerProfileImg + ", writerCoverImg=" + writerCoverImg
				+ ", writerBrandName=" + writerBrandName + ", writerIntro=" + writerIntro + ", writerCodeSeq="
				+ writerCodeSeq + "]";
	}
	
	
}
