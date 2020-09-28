package com.web.bomulsum.writer.gempoint.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class WriterGempointDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//이용내역/
	public List<Map<String, String>> getGemPoint(String writerCodeSeq) {
		List<Map<String, String>> list = sqlSessionTemplate.selectList("writerGempointDAO.gempointSelect", writerCodeSeq );
		System.out.println(list); //테스트
		return list;
	}
//	public List<WriterGempointVO> getGemPoint() {
//		List<WriterGempointVO> list = sqlSessionTemplate.selectList("writerGempointDAO.gempointSelect");
//		return list;
//	}
	//보유 포인트
	public Map<String, Object> getGemPointSum(String writerCodeSeq) {
		Map<String, Object> result =  sqlSessionTemplate.selectOne("writerGempointDAO.gempointSum", writerCodeSeq); //mapper namespace . id
		System.out.println(result); //테스트
		return result;
	}
	
	//젬포인트 충전
	public void insertGemPointCharge(Map<String, Object> gemMap) {
		sqlSessionTemplate.insert("writerGempointDAO.gempointChargeInsert", gemMap); 
	}
}
