package com.web.bomulsum.writer.midas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.common.PageVO;
import com.web.bomulsum.writer.midas.repository.WriterMidasDAO;
import com.web.bomulsum.writer.midas.repository.WriterMidasVO;

@Service
public class WriterMidasServiceImpl implements WriterMidasService{

	@Autowired
	WriterMidasDAO dao;
	
	@Override
	public void midasRegister(WriterMidasVO vo) {
		dao.midasRegister(vo);
	}

	@Override
	public String selectWriterCode(String writerEmail) {
		return  dao.writerEmail(writerEmail);
	}

	@Override
	public List<WriterMidasVO> getClassAllSelect(String orderSeq) {
		return dao.getClassAllSelect(orderSeq);
	}

	@Override
	public WriterMidasVO getClassArticle(String writerCodeSeq) {
		return dao.getClassArticle(writerCodeSeq);
	}


	@Override
	public void midasModify(WriterMidasVO vo) {
		dao.midasModify(vo);	
	}

	@Override
	public void midasDelete(String orderSeq) {
		dao.midasDelete(orderSeq);
	}

	@Override
	public void midasRunUpdate(WriterMidasVO vo) {
		dao.midasRunUpdate(vo);
		
	}

	@Override
	public int countArticles(PageVO paging) {
		return dao.countArticles(paging);
	}

	@Override
	public List<WriterMidasVO> getArticleListPaging(PageVO paging) {
		return dao.getArticleListPaging(paging);
	}



}
