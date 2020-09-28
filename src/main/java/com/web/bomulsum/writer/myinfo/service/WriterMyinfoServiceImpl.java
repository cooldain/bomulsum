package com.web.bomulsum.writer.myinfo.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.writer.myinfo.repository.WriterMyinfoDAO;
import com.web.bomulsum.writer.myinfo.repository.WriterMyinfoVO;

@Service
public class WriterMyinfoServiceImpl implements WriterMyinfoService{
	@Autowired
	WriterMyinfoDAO dao;
	
	@Override
	public WriterMyinfoVO getWriterMyinfo(String writerCodeSeq) {
		return dao.getWriterMyinfo(writerCodeSeq);
	}

	@Override
	public Map<String, Object> getGemPointSum2(String writerCodeSeq) {
		return dao.getGemPointSum2(writerCodeSeq);
	}

	@Override
	public void insertPhone(Map<String, Object> map) {
		dao.insertPhone(map);
	}

	@Override
	public void insertUrl(Map<String, Object> map) {
		dao.insertUrl(map);
	}

}
