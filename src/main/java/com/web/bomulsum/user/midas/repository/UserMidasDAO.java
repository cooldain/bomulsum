package com.web.bomulsum.user.midas.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserMidasDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//카테고리별 클래스 목록 불러오기
	public List<UserMidasVO> midasCategoryList(UserMidasPagingVO vo){
		return sqlSessionTemplate.selectList("userMidasDAO.midasCategoryList", vo);
	}
	//카테고리별 페이징 처리를 위한 총 클래스 개수 가져오기
	public int getCategoryMidasCount(String category) {
		return sqlSessionTemplate.selectOne("userMidasDAO.getCategoryMidasCount", category);
	}
	
	//지역별 클래스 목록 불러오기
	public List<UserMidasVO> midasLocationList(UserMidasPagingVO vo){
		return sqlSessionTemplate.selectList("userMidasDAO.midasLocationList", vo);
	}
	
	//지역별 페이징 처리를 위한 총 클래스 개수 가져오기
	public int getLocationMidasCount(String location) {
		return sqlSessionTemplate.selectOne("userMidasDAO.getLocationMidasCount", location);
	}
	
	//신규 등록된 클래스 목록 불러오기
	public List<UserMidasVO> midasNewList(UserMidasPagingVO vo){
		return sqlSessionTemplate.selectList("userMidasDAO.midasNewList", vo);
	}
	
	//좋아요 순으로 클래스 목록 불러오기
	public List<UserMidasVO> midasPopularList(UserMidasPagingVO vo){
		return sqlSessionTemplate.selectList("userMidasDAO.midasBestLikeClassList", vo);
	}
	
	//전체 클래스 개수 불러오기
	public int getAllMidasCount() {
		return sqlSessionTemplate.selectOne("userMidasDAO.getAllMidasCount");
	}
	
	//좋아하는 클래스 추가
	public void likeClass(HashMap<String, String> map) {
		sqlSessionTemplate.insert("userMidasDAO.likeClass", map);
	}
	
	//좋아하는 클래스 취소
	public void nonLikeClass(HashMap<String, String> map) {
		sqlSessionTemplate.delete("userMidasDAO.nonLikeClass", map);
	}
	
	//좋아하는 클래스 가져와서 뿌려주기
	public List<String> getLikeClass(String member){
		return sqlSessionTemplate.selectList("userMidasDAO.getLikeClass", member);
	}
	
}
