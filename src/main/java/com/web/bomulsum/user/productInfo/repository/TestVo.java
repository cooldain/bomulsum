package com.web.bomulsum.user.productInfo.repository;

import java.util.List;

public class TestVo {
//	'artCode' : artCodeSeq,
//	'memberCode' : memberCode,
//	'optionCode' : optionCode,
//	'artCount' : count
	private String artCode;
	private String memberCode;
	private String optionCode;
	private String artCount;
	private List<TestVo> testList;
	
	public List<TestVo> getTestList() {
		return testList;
	}
	public void setTestList(List<TestVo> testList) {
		this.testList = testList;
	}
	public String getArtCode() {
		return artCode;
	}
	public void setArtCode(String artCode) {
		this.artCode = artCode;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getOptionCode() {
		return optionCode;
	}
	public void setOptionCode(String optionCode) {
		this.optionCode = optionCode;
	}
	public String getArtCount() {
		return artCount;
	}
	public void setArtCount(String artCount) {
		this.artCount = artCount;
	}
	@Override
	public String toString() {
		return "TestVo [artCode=" + artCode + ", memberCode=" + memberCode + ", optionCode=" + optionCode
				+ ", artCount=" + artCount + "]";
	}
	
	
}
