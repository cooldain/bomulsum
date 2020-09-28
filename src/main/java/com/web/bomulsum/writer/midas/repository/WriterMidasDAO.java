package com.web.bomulsum.writer.midas.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.bomulsum.common.PageVO;


@Repository
public class WriterMidasDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public void midasRegister(WriterMidasVO vo) {
		template.insert(
				"com.web.bomulsum.writer.midas.repository.WriterMidasDAO.midasRegister",vo);
		
	}
	public String writerEmail(String writerEmail) {
		return template.selectOne(
				"com.web.bomulsum.writer.midas.repository.WriterMidasDAO.selectWriterCode", writerEmail);
	}
	public List<WriterMidasVO> getClassAllSelect(String orderSeq){
		return template.selectList(
				"com.web.bomulsum.writer.midas.repository.WriterMidasDAO.getClassAllSelect", orderSeq
				);
	}
	public WriterMidasVO getClassArticle(String writerCodeSeq) {
		return template.selectOne("com.web.bomulsum.writer.midas.repository.WriterMidasDAO.getClassArticle", writerCodeSeq);
	}
	 public int midasModify(String orderSeq) {
		 return  template.update("com.web.bomulsum.writer.midas.repository.WriterMidasDAO.midasModify", orderSeq);
		
	 }
	 public void midasModify(WriterMidasVO vo) {
			template.update("com.web.bomulsum.writer.midas.repository.WriterMidasDAO.midasModify", vo);		
	 }
	 public void midasDelete(String orderSeq) {
		 template.delete("com.web.bomulsum.writer.midas.repository.WriterMidasDAO.midasDelete", orderSeq);	
	 }
	 public void midasRunUpdate(WriterMidasVO vo) {
		 template.update("com.web.bomulsum.writer.midas.repository.WriterMidasDAO.midasRunUpdate", vo);
	 }
	 public int countArticles(PageVO paging) {
		return template.selectOne("com.web.bomulsum.writer.midas.repository.WriterMidasDAO.countArticles",paging);
	 }
	 public List<WriterMidasVO> getArticleListPaging(PageVO paging){
		 return template.selectList("com.web.bomulsum.writer.midas.repository.WriterMidasDAO.getArticleListPaging",paging);
	 }
}
