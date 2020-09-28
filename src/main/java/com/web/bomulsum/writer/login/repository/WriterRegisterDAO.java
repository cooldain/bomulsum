package com.web.bomulsum.writer.login.repository;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class WriterRegisterDAO{

	@Autowired
	SqlSessionTemplate template;
	
	public void insertMember(WriterRegisterVO vo) {
		template.insert("WriterRegisterDAO.insertMember",vo);
	}
	public int checkId(String writerEmail) {
		return template.selectOne("WriterRegisterDAO.checkId", writerEmail);
	}
	public WriterRegisterVO selectOne(String writerEmail) {
		return template.selectOne("WriterRegisterDAO.selectOne",writerEmail);
	}
	public void keepLogin(Map<String, Object> datas) {
		template.update("WriterRegisterDAO.keepLogin",datas);
	}
	public WriterRegisterVO getUserWithSessionId(String sessionId) {
		System.out.println("sessionId " + sessionId);
		return template.selectOne("WriterRegisterDAO.getUserWithSessionId",sessionId);
	}
}
