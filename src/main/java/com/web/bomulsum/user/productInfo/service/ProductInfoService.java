package com.web.bomulsum.user.productInfo.service;

import java.util.HashMap;
import java.util.List;

import com.web.bomulsum.user.productInfo.repository.CommentVO;
import com.web.bomulsum.user.productInfo.repository.ReviewVO;
import com.web.bomulsum.user.productInfo.repository.TestVo;
import com.web.bomulsum.user.productInfo.repository.WriterVO;
import com.web.bomulsum.writer.art.repository.WriterArtInfoDetailVO;
import com.web.bomulsum.writer.art.repository.WriterArtOptionVO;
import com.web.bomulsum.writer.art.repository.WriterArtVO;

public interface ProductInfoService {
	public WriterArtVO getListProductInfo(String artCodeSeq);
	public List<WriterArtInfoDetailVO> getListProductartInfoList(String artCodeSeq);
	public List<WriterArtOptionVO> getListProductInfoOption(String artCodeSeq);
	public WriterVO getWriterInfo(String writerCodeSeq);
	
	public void selectRecentyleView(HashMap<String, String> map);
	public void updateViewCount(String artCodeSeq);
	public List<WriterArtVO> selectOherProduct(String writerCodeSeq); 
	public int commentInsert(HashMap<String, String> map);
	public List<CommentVO> commentSelect(String artCodeSeq);
	
	public String getMemberImg(String memberCode);
	public List<ReviewVO> getReviews(String artCodeSeq);
	public List<Integer> getWriterAllArticleStar(String writerCode);
	public int getWishForWriter(String artCode);
	public int checkWishForWriter(HashMap<String, String> map);
	public int checkWishForArticle(HashMap<String, String> map );
	public void insertShopBag(TestVo vo);
	public int checkShopBag(HashMap<String, String> map);
}
