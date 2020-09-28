package com.web.bomulsum.writer.art.repository;

import java.util.List;

public class WriterArtOptionVO {
	
	private String artOptionSeq;
	private String artCodeSeq;
	private String artOptionCategory;
	private String artOptionName;
	private String artOptionPrice;
	private List<String> artOptionDetailCode;
	private List<String> artOptionDetailName;
	private List<String> artOptionDetailPrice;
	
	
	public List<String> getArtOptionDetailCode() {
		return artOptionDetailCode;
	}
	public void setArtOptionDetailCode(List<String> artOptionDetailCode) {
		this.artOptionDetailCode = artOptionDetailCode;
	}
	public String getArtOptionSeq() {
		return artOptionSeq;
	}
	public void setArtOptionSeq(String artOptionSeq) {
		this.artOptionSeq = artOptionSeq;
	}
	public String getArtCodeSeq() {
		return artCodeSeq;
	}
	public void setArtCodeSeq(String artCodeSeq) {
		this.artCodeSeq = artCodeSeq;
	}
	public String getArtOptionCategory() {
		return artOptionCategory;
	}
	public void setArtOptionCategory(String artOptionCategory) {
		this.artOptionCategory = artOptionCategory;
	}
	public String getArtOptionName() {
		return artOptionName;
	}
	public void setArtOptionName(String artOptionName) {
		this.artOptionName = artOptionName;
	}
	public String getArtOptionPrice() {
		return artOptionPrice;
	}
	public void setArtOptionPrice(String artOptionPrice) {
		this.artOptionPrice = artOptionPrice;
	}
	public List<String> getArtOptionDetailName() {
		return artOptionDetailName;
	}
	public void setArtOptionDetailName(List<String> artOptionDetailName) {
		this.artOptionDetailName = artOptionDetailName;
	}
	public List<String> getArtOptionDetailPrice() {
		return artOptionDetailPrice;
	}
	public void setArtOptionDetailPrice(List<String> artOptionDetailPrice) {
		this.artOptionDetailPrice = artOptionDetailPrice;
	}
	@Override
	public String toString() {
		return "WriterArtOptionVO [artOptionSeq=" + artOptionSeq + ", artCodeSeq=" + artCodeSeq + ", artOptionCategory="
				+ artOptionCategory + ", artOptionName=" + artOptionName + ", artOptionPrice=" + artOptionPrice
				+ ", artOptionDetailCode=" + artOptionDetailCode + ", artOptionDetailName=" + artOptionDetailName
				+ ", artOptionDetailPrice=" + artOptionDetailPrice + "]";
	}
	
	
	
	

	
	
}
