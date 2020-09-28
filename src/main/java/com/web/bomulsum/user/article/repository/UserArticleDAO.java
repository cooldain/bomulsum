package com.web.bomulsum.user.article.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserArticleDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserArticleCategoryVO> getListForCategory(UserArticlePagingVO vo){
		return sqlSessionTemplate.selectList("articleDao.articleForCategory", vo);
	}
	
	public int getCategoryArticleCount(UserArticlePagingVO vo) {
		return sqlSessionTemplate.selectOne("articleDao.getCategoryArticleCount", vo);
	}
	
	public void likeArticle(HashMap<String, String> map) {
		sqlSessionTemplate.insert("articleDao.likeArticle", map);
	}
	
	public void nonLikeArticle(HashMap<String, String> map) {
		sqlSessionTemplate.delete("articleDao.nonLikeArticle", map);
	}
	
	public List<String> getLikeArticles(String member){
		return sqlSessionTemplate.selectList("articleDao.getLikeArticles", member);
	}
	
	public int getSearchArticleCount(UserSearchPagingVO vo) {
		return sqlSessionTemplate.selectOne("articleDao.getSearchArticleCount", vo);
	}
	
	public List<UserArticleCategoryVO> getArticleListForSearch(UserSearchPagingVO vo) {
		return sqlSessionTemplate.selectList("articleDao.articleForSearch", vo);
	}
	
	public List<Integer> getArticleReviewCount(String artCode){
		return sqlSessionTemplate.selectList("articleDao.getArticleReview", artCode);
	}
	
	public int getSearchClassCount(String word) {
		return sqlSessionTemplate.selectOne("articleDao.getSearchClassCount", word);
	}
	
	public List<UserMidasClassVO> getSearchClass(UserSearchPagingVO vo){
		return sqlSessionTemplate.selectList("articleDao.getSearchClass", vo);
	}
	
	public List<String> getLikeMidas(String member){
		return sqlSessionTemplate.selectList("articleDao.getLikeMidas", member);
	}
	
	public List<Integer> getClassReviewCount(String midasCode) {
		return sqlSessionTemplate.selectList("articleDao.getClassReviewCount", midasCode);
	}
	
	public int selectWord(String word) {
		if(sqlSessionTemplate.selectOne("articleDao.wordSelect", word) == null) {
			return 0;
		}else {			
			return sqlSessionTemplate.selectOne("articleDao.wordSelect", word);
		}
	}
	
	public void insertWord(String word) {
		sqlSessionTemplate.insert("articleDao.wordInsert", word);
	}
	
	public void updateWord(HashMap<String, Object> map) {
		sqlSessionTemplate.update("articleDao.wordUpdate", map);
	}
	
	public List<String> realTimeKeyword(){
		return sqlSessionTemplate.selectList("articleDao.realTimeKeyword");
	}
	
	// 인기작품, 추천작품, 작가님추천
	public int getOrderByArticleCount(UserOrderByArticlePagingVO vo) {
		return sqlSessionTemplate.selectOne("articleDao.getOrderByArticleCount", vo);
	}
	
	public List<UserArticleCategoryVO> getListForOrderBy(UserOrderByArticlePagingVO vo) {
		return sqlSessionTemplate.selectList("articleDao.getListForOrderBy", vo);
	}
	
	public String getCategoryImg(String categories) {
		return sqlSessionTemplate.selectOne("articleDao.getCategoryImg", categories);
	}
	
}