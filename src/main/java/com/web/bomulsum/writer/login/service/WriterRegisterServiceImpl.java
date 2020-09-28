package com.web.bomulsum.writer.login.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.web.bomulsum.writer.login.repository.WriterRegisterDAO;
import com.web.bomulsum.writer.login.repository.WriterRegisterVO;

@Service
public class WriterRegisterServiceImpl implements WriterRegisterService {

	@Autowired
	WriterRegisterDAO dao;
	
	@Override
	public void insertMember(WriterRegisterVO vo) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		vo.setWriterPassword(encoder.encode(vo.getWriterPassword()));
		dao.insertMember(vo);
	}

	@Override
	public int checkId(String writerEmail) {
		return dao.checkId(writerEmail);
	}

	@Override
	public WriterRegisterVO selectOne(String writerEmail) {
		return dao.selectOne(writerEmail);
	}

	@Override
	public void keepLogin(String sessionId, Date limitTime, String writerEmail) {
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("sessionId", sessionId);
		datas.put("limitTime", limitTime);
		datas.put("writerEmail", writerEmail);
		dao.keepLogin(datas);
	}

	@Override
	public WriterRegisterVO getUserWithSessionId(String sessionId) {
		return dao.getUserWithSessionId(sessionId);
	}

}
