package com.web.bomulsum.user.whome.service;

import java.util.HashMap;
import java.util.List;

import com.web.bomulsum.user.whome.repository.UserWHomeVO;

public interface UserWHomeService {
	//작가 판매작품 등 작가정보
	List<UserWHomeVO> getListWriterSalesArt(String writerCode);
	
	//작가 브랜드네임
	String getBrandName(String writerCode);
	
	//작가 인트로
	String getArtistItro(String writerCode);
	
	//작가 프로필이미지
	String getArtistProfileImg(String writerCode);
	
	//작가 현재판매중인 작품 수
	int getSalesArtCount(String writerCode);
	
	//총 구매후기 수
	int getReviewTotal(String writerCode);
	
	//좋아하는 작가로 추가된 수
	int getAddLikes(String writerCode);
	
	//URl로 해당 작가코드 검색하기
	String getWriterFromUrl(String url_id); 
	
	//좋아하는작품 : 현재 로그인한 유저가 좋아하는 작품
	List<String> getLikeArt(HashMap<String, String> map); 
	
	//좋아하는작가 : 현재 로그인한 유저가 좋아하는 작품
	int likeArtistCheck(HashMap<String, String> map); 
	
	List<Integer> getReviewSelect(String artCode);
}
