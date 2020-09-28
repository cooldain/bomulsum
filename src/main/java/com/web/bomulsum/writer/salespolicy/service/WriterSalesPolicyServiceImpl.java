package com.web.bomulsum.writer.salespolicy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.writer.salespolicy.repository.WriterSalesPolicyDAO;
import com.web.bomulsum.writer.salespolicy.repository.WriterSalesPolicyVO;

@Service
public class WriterSalesPolicyServiceImpl implements WriterSalesPolicyService{

	@Autowired
	WriterSalesPolicyDAO dao;
	
	@Override
	public void updateSalesPolicy(WriterSalesPolicyVO vo) {
		dao.updateSalesPolicy(vo);		
	}

	@Override
	public WriterSalesPolicyVO getSalesPolicy(String writerCodeSeq) {
		return dao.getSalesPolicy(writerCodeSeq);
	}

}
