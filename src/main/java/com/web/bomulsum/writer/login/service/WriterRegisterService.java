package com.web.bomulsum.writer.login.service;


import java.util.Date;
import java.util.List;

import com.web.bomulsum.writer.login.repository.WriterRegisterVO;

public interface WriterRegisterService {
	
	void insertMember(WriterRegisterVO vo);
	
	int checkId(String writerEmail);
	
	WriterRegisterVO selectOne(String writerEmail);
	
	void keepLogin(String sessionId, Date limitTime, String writerEmail);
	
	WriterRegisterVO getUserWithSessionId(String sessionId);
}
