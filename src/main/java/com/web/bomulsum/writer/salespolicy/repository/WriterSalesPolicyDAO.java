package com.web.bomulsum.writer.salespolicy.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class WriterSalesPolicyDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	//작가 판매정책 등록(업데이트)
	public void updateSalesPolicy(WriterSalesPolicyVO vo) {
		sqlSessionTemplate.update("writerSalesPolicyDAO.updateSalesPolicy", vo);
	}
	
	//작가 판매정책 불러오기
	public WriterSalesPolicyVO getSalesPolicy(String writerCodeSeq){
		WriterSalesPolicyVO policy = sqlSessionTemplate.selectOne("writerSalesPolicyDAO.loadSalesPolicy",writerCodeSeq);
		return policy;
	}
}
