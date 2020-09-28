package com.web.bomulsum.writer.midas.service;

import java.util.List;

import com.web.bomulsum.common.PageVO;
import com.web.bomulsum.writer.midas.repository.WriterMidasVO;

public interface WriterMidasService {

	void midasRegister(WriterMidasVO vo);
	
	String selectWriterCode(String writerEmail);
	
	List<WriterMidasVO> getClassAllSelect(String writerCodeSeq);
	
	int countArticles(PageVO paging);
	
	WriterMidasVO getClassArticle(String orderSeq);
	
	void midasModify(WriterMidasVO vo);
	
	void midasDelete(String orderSeq);
	
	void midasRunUpdate(WriterMidasVO vo);
	
	List<WriterMidasVO> getArticleListPaging(PageVO paging);
	
}
