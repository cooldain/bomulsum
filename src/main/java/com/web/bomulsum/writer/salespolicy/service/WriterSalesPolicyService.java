package com.web.bomulsum.writer.salespolicy.service;

import com.web.bomulsum.writer.salespolicy.repository.WriterSalesPolicyVO;

public interface WriterSalesPolicyService {
	void updateSalesPolicy(WriterSalesPolicyVO vo);
	WriterSalesPolicyVO getSalesPolicy(String writerCodeSeq);
}
