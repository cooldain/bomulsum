package com.web.bomulsum.writer.profile.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class WriterProfileDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//작가 기본프로필 불러오기
	public WriterProfileVO getWriterProfile(String writerCodeSeq){
		WriterProfileVO profile = sqlSessionTemplate.selectOne("writerProfileDAO.loadProfile", writerCodeSeq);
		return profile;
	}
	
	//작가 기본프로필 등록(업데이트)
	public void updateWriterProfile(WriterProfileVO vo){
		sqlSessionTemplate.update("writerProfileDAO.updateProfile",vo);
	}
	
	//작가 기존 프로필이미지 가져오기
	public String getWriterProfileImg(String writerCodeSeq) {
		return sqlSessionTemplate.selectOne("writerProfileDAO.loadProfileImg", writerCodeSeq);
	}
	
	//작가 기존 커버이미지 가져오기
	public String getWriterCoverImg(String writerCodeSeq) {
		return sqlSessionTemplate.selectOne("writerProfileDAO.loadCoverImg",writerCodeSeq);
	}

}
