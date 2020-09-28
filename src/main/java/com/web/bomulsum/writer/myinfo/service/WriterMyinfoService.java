package com.web.bomulsum.writer.myinfo.service;

import java.util.Map;

import com.web.bomulsum.writer.myinfo.repository.WriterMyinfoVO;

public interface WriterMyinfoService {
	WriterMyinfoVO getWriterMyinfo(String writerCodeSeq);
	Map<String, Object> getGemPointSum2(String writerCodeSeq);
	void insertPhone(Map<String, Object> map);
	void insertUrl(Map<String, Object> map);
}
