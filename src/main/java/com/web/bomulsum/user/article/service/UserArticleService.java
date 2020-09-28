package com.web.bomulsum.user.article.service;

import java.util.HashMap;
import java.util.List;

import com.web.bomulsum.user.article.repository.UserArticleCategoryVO;
import com.web.bomulsum.user.article.repository.UserArticlePagingVO;
import com.web.bomulsum.user.article.repository.UserMidasClassVO;
import com.web.bomulsum.user.article.repository.UserOrderByArticlePagingVO;
import com.web.bomulsum.user.article.repository.UserSearchPagingVO;

public interface UserArticleService {
	List<UserArticleCategoryVO> getListForCategory(UserArticlePagingVO vo);
	int getCategoryArticleCount(UserArticlePagingVO vo);
	void likeArticle(HashMap<String, String> map);
	void nonLikeArticle(HashMap<String, String> map);
	List<String> getLikeArticles(String member);
	int getSearchArticleCount(UserSearchPagingVO vo);
	List<UserArticleCategoryVO> getArticleListForSearch(UserSearchPagingVO vo);
	
	// 금손 클래스 검색 
	int getSearchClassCount(String word);
	List<UserMidasClassVO> getSearchClass(UserSearchPagingVO vo);
	List<String> getLikeMidas(String member);
	
	
	int selectWord(String word);
	void insertWord(String word);
	void updateWord(HashMap<String, Object> map);
	List<String> realTimeKeyword();
	
	// 인기작품, 추천작품, 작가님 추천
	int getOrderByArticleCount(UserOrderByArticlePagingVO vo);
	List<UserArticleCategoryVO> getListForOrderBy(UserOrderByArticlePagingVO vo);
	
	
	String getCategoryImg(String categories);
}