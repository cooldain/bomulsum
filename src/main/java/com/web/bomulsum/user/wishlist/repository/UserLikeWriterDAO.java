package com.web.bomulsum.user.wishlist.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UserLikeWriterDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//좋아하는 작가 리스트
	public List<String> getwriterList(String memberCode){
		List<String> writerList = sqlSessionTemplate.selectList("userLikeWriterDAO.selectArtList", memberCode);
		return writerList;
	}

	//좋아하는 작가 정보
	public List<UserLikeWriterVO> getWriterInfo(List<String> writerList){
		Map<String, Object> artList = new HashMap<String,Object>();
		artList.put("artList", writerList);
		
		//작가 정보
		List<UserLikeWriterVO> writerInfoList = sqlSessionTemplate.selectList("userLikeWriterDAO.selectArtDetail", artList);
		return writerInfoList;
	}
	//좋아하는 작가별 작품 개수
	public List<Map<String, Object>> getArtCount(List<String> writerList){
		Map<String, Object> artList = new HashMap<String,Object>();
		artList.put("artList", writerList);
		
		//작가별 작품 개수 확인
		List<Map<String,Object>> artCount = sqlSessionTemplate.selectList("userLikeWriterDAO.countArtPhoto",artList);
		System.out.println(artCount);
		
		return artCount;
	}

	//작가별 사진
	public List<Map<String,Object>> getArtPhoto(String writerCode){
		List<Map<String,Object>> artListTest = sqlSessionTemplate.selectList("userLikeWriterDAO.selectArtPhoto", writerCode); 
		return artListTest;
	}
		
		
	//좋아하는 작가 삭제
	public void deleteLikeWriter(Map<String, Object> map) {
		sqlSessionTemplate.delete("userLikeWriterDAO.deleteWishlist",map);
	}
	


	
}
