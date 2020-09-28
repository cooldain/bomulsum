package com.web.bomulsum.user.whome.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.whome.repository.UserWHomeDAO;
import com.web.bomulsum.user.whome.repository.UserWHomeVO;

@Service
public class UserWHomeServiceImpl implements UserWHomeService{

	@Autowired
	private UserWHomeDAO dao;

	//작가 판매작품정보 
	@Override
	public List<UserWHomeVO> getListWriterSalesArt(String writerCode) {
		return dao.getListWriterSalesArt(writerCode);
	}

	
	//전체 판매작품 수 구함
	@Override
	public int getSalesArtCount(String writerCode) {
		return dao.getSalesArtCount(writerCode);
	}
	
	
	//전체 구매후기 수 구함
	@Override
	public int getReviewTotal(String writerCode) {
		return dao.getReviewTotal(writerCode);
	}
	
	
	//좋아하는 작가로 추가된 수 구함
	@Override
	public int getAddLikes(String writerCode) {
		return dao.getAddLikes(writerCode);
	}
	
	
	//URl로 해당 작가코드 검색하기
	@Override
	public String getWriterFromUrl(String url_id) {
		return dao.getWriterFromUrl(url_id);
	}

	
	//좋아하는 작품
	@Override
	public List<String> getLikeArt(HashMap<String, String> map) {
		return dao.getLikeArt(map);
	}


	@Override
	public String getBrandName(String writerCode) {
		return dao.getBrandName(writerCode);
	}


	@Override
	public String getArtistItro(String writerCode) {
		return dao.getArtistItro(writerCode);
	}


	@Override
	public String getArtistProfileImg(String writerCode) {
		return dao.getArtistProfileImg(writerCode);
	}


	@Override
	public int likeArtistCheck(HashMap<String, String> map) {
		return dao.likeArtistCheck(map);
	}


	@Override
	public List<Integer> getReviewSelect(String artCode) {
		return dao.getReviewSelect(artCode);
	}

	
}
