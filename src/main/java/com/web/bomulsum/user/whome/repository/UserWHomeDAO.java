package com.web.bomulsum.user.whome.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserWHomeDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserWHomeVO> getListWriterSalesArt(String writerCode){
		return sqlSessionTemplate.selectList("userWhomeDAO.getWriterSalesArt", writerCode);
	}
	
	public String getBrandName(String writerCode) {
		return sqlSessionTemplate.selectOne("userWhomeDAO.getBrandName", writerCode);
	}
	
	public String getArtistItro(String writerCode) {
		return sqlSessionTemplate.selectOne("userWhomeDAO.getArtistItro", writerCode);
	}	
	
	public String getArtistProfileImg(String writerCode) {
		return sqlSessionTemplate.selectOne("userWhomeDAO.getArtistProfileImg", writerCode);
	}
	
	
	public int getSalesArtCount(String writerCode) {
		return sqlSessionTemplate.selectOne("userWhomeDAO.getSalesArtCount", writerCode);
	}
	
	public int getReviewTotal(String writerCode) {
		return sqlSessionTemplate.selectOne("userWhomeDAO.getReviewTotal", writerCode);
	}
	
	public int getAddLikes(String writerCode) {
		return sqlSessionTemplate.selectOne("userWhomeDAO.getAddLikes", writerCode);
	}
	
	//URl로 해당 작가코드 검색하기
	public String getWriterFromUrl(String url_id) {
		return sqlSessionTemplate.selectOne("userWhomeDAO.getWriterFromUrl", url_id);
	}
	
	//좋아하는작품 : 현재 로그인한 유저가 좋아하는 작품
	public List<String> getLikeArt(HashMap<String, String> map){
		return sqlSessionTemplate.selectList("userWhomeDAO.getLikeArt", map);
	}
	
	//좋아하는작가 : 현재 로그인한 유저가 좋아하는 작가
	public int likeArtistCheck(HashMap<String, String> map){
		return sqlSessionTemplate.selectOne("userWhomeDAO.likeArtistCheck", map);
	}
	
	public List<Integer> getReviewSelect(String artCode){
		return sqlSessionTemplate.selectList("userWhomeDAO.getReviewSelect", artCode);
	}
}
