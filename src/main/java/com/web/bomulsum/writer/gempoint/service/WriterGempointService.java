package com.web.bomulsum.writer.gempoint.service;

import java.util.List;
import java.util.Map;


public interface WriterGempointService {
	List<Map<String, String>> getGemPoint(String writerCodeSeq);//젬포인트 내역
	//List<WriterGempointVO> getGemPoint(); 
	Map<String, Object> getGemPointSum(String writerCodeSeq); //보유포인트
	void insertGemPointCharge(Map<String, Object> gemMap); //젬포인트 충전
}
