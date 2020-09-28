package com.web.bomulsum.writer.profile.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.writer.profile.repository.WriterProfileDAO;
import com.web.bomulsum.writer.profile.repository.WriterProfileVO;

@Service
public class WriterProfileServiceImpl implements WriterProfileService{
	
	@Autowired
	WriterProfileDAO dao;
	
	@Override
	public void updateWriterProfile(WriterProfileVO vo) {	
			dao.updateWriterProfile(vo);
	}

	@Override 
	public WriterProfileVO getWriterProfile(String writerCodeSeq) {
		WriterProfileVO vo = dao.getWriterProfile(writerCodeSeq);
		if(vo == null) {
			vo = new WriterProfileVO();
			vo.setWriterBrandName("미설정");
			vo.setWriterProfileImg("1596900594159보석로고_대지 1.png");
		}
		return vo;
	}

	@Override
	public String getWriterProfileImg(String writerCodeSeq) {
		return dao.getWriterProfileImg(writerCodeSeq);
	}

	@Override
	public String getWriterCoverImg(String writerCodeSeq) {
		return dao.getWriterCoverImg(writerCodeSeq);
	}


}
