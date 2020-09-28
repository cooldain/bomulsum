package com.web.bomulsum.user.productInfo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.productInfo.repository.CommentVO;
import com.web.bomulsum.user.productInfo.repository.ProductInfoDAO;
import com.web.bomulsum.user.productInfo.repository.ReviewVO;
import com.web.bomulsum.user.productInfo.repository.TestVo;
import com.web.bomulsum.user.productInfo.repository.WriterVO;
import com.web.bomulsum.writer.art.repository.WriterArtInfoDetailVO;
import com.web.bomulsum.writer.art.repository.WriterArtOptionVO;
import com.web.bomulsum.writer.art.repository.WriterArtVO;

@Service
public class ProductInfoServiceImpl implements ProductInfoService{

	@Autowired
	ProductInfoDAO dao;
	
	@Override
	public WriterArtVO getListProductInfo(String artCodeSeq) {
		return dao.getListProductInfo(artCodeSeq);
	}

	@Override
	public List<WriterArtInfoDetailVO> getListProductartInfoList(String artCodeSeq) {
		return dao.getListProductartInfoList(artCodeSeq);
	}

	@Override
	public List<WriterArtOptionVO> getListProductInfoOption(String artCodeSeq) {
		return dao.getListProductInfoOption(artCodeSeq);
	}

	@Override
	public WriterVO getWriterInfo(String writerCodeSeq) {
		return dao.getWriterInfo(writerCodeSeq);
	}


	@Override
	public void selectRecentyleView(HashMap<String, String> map) {
		
		if(dao.selectRecentyleView(map) == 0) {
			dao.insertRecentlyView(map);
		}else {
			dao.updateRecentlyView(map);
		}
	}

	
	@Override
	public void updateViewCount(String artCodeSeq) {
		dao.updateViewCount(artCodeSeq);
	}

	@Override
	public List<WriterArtVO> selectOherProduct(String writerCodeSeq) {
		return dao.selectOherProduct(writerCodeSeq);
	}

	@Override
	public int commentInsert(HashMap<String, String> map) {
		return dao.commentInsert(map);
	}

	@Override
	public List<CommentVO> commentSelect(String artCodeSeq) {
		return dao.commentSelect(artCodeSeq);
	}

	@Override
	public String getMemberImg(String memberCode) {
		return dao.getMemberImg(memberCode);
	}

	@Override
	public List<ReviewVO> getReviews(String artCodeSeq) {
		return dao.getReviews(artCodeSeq);
	}

	@Override
	public List<Integer> getWriterAllArticleStar(String writerCode) {
		return dao.getWriterAllArticleStar(writerCode);
	}

	@Override
	public int getWishForWriter(String artCode) {
		return dao.getWishForWriter(artCode);
	}

	@Override
	public int checkWishForWriter(HashMap<String, String> map) {
		return dao.checkWishForWriter(map);
	}

	@Override
	public int checkWishForArticle(HashMap<String, String> map) {
		return dao.checkWishForArticle(map);
	}

	@Override
	public void insertShopBag(TestVo vo) {
		dao.insertShopBag(vo);
	}

	@Override
	public int checkShopBag(HashMap<String, String> map) {
		return dao.checkShopBag(map);
	}
}
