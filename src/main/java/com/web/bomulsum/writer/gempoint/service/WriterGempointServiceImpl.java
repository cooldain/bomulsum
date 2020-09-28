package com.web.bomulsum.writer.gempoint.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.writer.gempoint.repository.WriterGempointDAO;
import com.web.bomulsum.writer.gempoint.repository.WriterGempointVO;

@Service
public class WriterGempointServiceImpl implements WriterGempointService{

	@Autowired
	WriterGempointDAO dao;
	   
	@Override
	public List<Map<String, String>> getGemPoint(String writerCodeSeq) {
	      List<Map<String, String>> list = dao.getGemPoint(writerCodeSeq);
	      return list;
	}

	@Override
	public Map<String, Object> getGemPointSum(String writerCodeSeq) {
		return dao.getGemPointSum(writerCodeSeq);
	}

	@Override
	public void insertGemPointCharge(Map<String, Object> gemMap) {
		dao.insertGemPointCharge(gemMap);
	}

}
