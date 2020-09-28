package com.web.bomulsum.user.productInfo.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.bomulsum.writer.art.repository.WriterArtInfoDetailVO;
import com.web.bomulsum.writer.art.repository.WriterArtOptionVO;
import com.web.bomulsum.writer.art.repository.WriterArtVO;


@Repository
public class ProductInfoDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public WriterArtVO getListProductInfo(String artCodeSeq){
		return template.selectOne("ProductInfoDAO.getListProductInfo",artCodeSeq);
	}
	public List<WriterArtInfoDetailVO> getListProductartInfoList(String artCodeSeq){
		return template.selectList("ProductInfoDAO.getListProductartInfoList",artCodeSeq);
	}
	public List<WriterArtOptionVO> getListProductInfoOption(String artCodeSeq){
		return template.selectList("ProductInfoDAO.getListProductInfoOption",artCodeSeq);
	}
	public WriterVO getWriterInfo(String writerCodeSeq) {
		return template.selectOne("ProductInfoDAO.getWriterInfo",writerCodeSeq);
	}
	
	
	public int selectRecentyleView(HashMap<String, String> map) {
		return template.selectOne("ProductInfoDAO.selectRecentlyView", map);
	}
	
	public void updateRecentlyView(HashMap<String, String> map) {
		template.update("ProductInfoDAO.updateRecentlyView", map);
	}
	
	public void insertRecentlyView(HashMap<String, String> map) {
		template.insert("ProductInfoDAO.insertRecentlyView", map);
	}
	
	public void updateViewCount(String artCodeSeq) {
		template.update("ProductInfoDAO.updateViewCount", artCodeSeq);
	}
	public List<WriterArtVO> selectOherProduct(String artCodeSeq) {
		return template.selectList("ProductInfoDAO.selectOherProduct",artCodeSeq);
	}
	public int commentInsert(HashMap<String, String> map) {
		return template.insert("ProductInfoDAO.commentInsert",map);
	}
	public List<CommentVO> commentSelect(String artCodeSeq){
		return template.selectList("ProductInfoDAO.commentSelect",artCodeSeq);
	}
	
	public String getMemberImg(String memberCode) {
		return template.selectOne("ProductInfoDAO.getMemberImg", memberCode);
	}
	
	public List<ReviewVO> getReviews(String artCodeSeq){
		return template.selectList("ProductInfoDAO.getReviews", artCodeSeq);
	}
	
	
	public List<Integer> getWriterAllArticleStar(String writerCode){
		return template.selectList("ProductInfoDAO.getWriterAllArticleStar", writerCode);
	}
	
	public int getWishForWriter(String artCode) {
		return template.selectOne("ProductInfoDAO.getWishForWriter", artCode);
	}
	
	public int checkWishForWriter(HashMap<String, String> map) {
		return template.selectOne("ProductInfoDAO.checkWishForWriter", map);
	}
	
	public int checkWishForArticle(HashMap<String, String> map ) {
		return template.selectOne("ProductInfoDAO.checkWishForArticle", map);
	}
	
	public void insertShopBag(TestVo vo) {
		template.insert("ProductInfoDAO.insertShopBag", vo);
	}
	
	public int checkShopBag(HashMap<String, String> map) {
		return template.selectOne("ProductInfoDAO.checkShopBag", map);
	}
}
