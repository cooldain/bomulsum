package com.web.bomulsum.user.article.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.article.repository.UserArticleCategoryVO;
import com.web.bomulsum.user.article.repository.UserArticleDAO;
import com.web.bomulsum.user.article.repository.UserArticlePagingVO;
import com.web.bomulsum.user.article.repository.UserMidasClassVO;
import com.web.bomulsum.user.article.repository.UserOrderByArticlePagingVO;
import com.web.bomulsum.user.article.repository.UserSearchPagingVO;

@Service
public class UserArticleServiceImpl implements UserArticleService{
	
	@Autowired
	private UserArticleDAO dao;

	@Override
	public List<UserArticleCategoryVO> getListForCategory(UserArticlePagingVO vo) {
		List<UserArticleCategoryVO> lvo = dao.getListForCategory(vo);
		for(UserArticleCategoryVO v : lvo) {
			v.setArticleReview(dao.getArticleReviewCount(v.getArtCode()));
		}
		return lvo;
	}

	@Override
	public int getCategoryArticleCount(UserArticlePagingVO vo) {
		return dao.getCategoryArticleCount(vo);
	}

	@Override
	public void likeArticle(HashMap<String, String> map) {
		dao.likeArticle(map);
	}

	@Override
	public void nonLikeArticle(HashMap<String, String> map) {
		dao.nonLikeArticle(map);
	}

	@Override
	public List<String> getLikeArticles(String member) {
		return dao.getLikeArticles(member);
	}

	@Override
	public int getSearchArticleCount(UserSearchPagingVO vo) {
		return dao.getSearchArticleCount(vo);
	}

	@Override
	public List<UserArticleCategoryVO> getArticleListForSearch(UserSearchPagingVO vo) {
		// 후기 가져오기
		List<UserArticleCategoryVO> lvo = dao.getArticleListForSearch(vo);
		for(UserArticleCategoryVO v : lvo) {
			v.setArticleReview(dao.getArticleReviewCount(v.getArtCode()));
		}
		
		return lvo;
	}

	@Override
	public void insertWord(String word) {
		dao.insertWord(word);		
	}

	@Override
	public int selectWord(String word) {
		return dao.selectWord(word);
	}

	@Override
	public void updateWord(HashMap<String, Object> map) {
		dao.updateWord(map);
	}

	@Override
	public List<String> realTimeKeyword() {
		return dao.realTimeKeyword();
	}

	@Override
	public int getOrderByArticleCount(UserOrderByArticlePagingVO vo) {
		return dao.getOrderByArticleCount(vo);
	}

	@Override
	public List<UserArticleCategoryVO> getListForOrderBy(UserOrderByArticlePagingVO vo) {
		List<UserArticleCategoryVO> lvo = dao.getListForOrderBy(vo);
		for(UserArticleCategoryVO v : lvo) {
			v.setArticleReview(dao.getArticleReviewCount(v.getArtCode()));
		}
		
		return lvo;
	}

	@Override
	public int getSearchClassCount(String word) {
		return dao.getSearchClassCount(word);
	}

	@Override
	public List<UserMidasClassVO> getSearchClass(UserSearchPagingVO vo) {
		List<UserMidasClassVO> lvo = dao.getSearchClass(vo);
		for(UserMidasClassVO v : lvo) {
			v.setMidasReview(dao.getClassReviewCount(v.getMidasCodeSeq()));
		}
		return lvo;
	}

	@Override
	public List<String> getLikeMidas(String member) {
		return dao.getLikeMidas(member);
	}

	@Override
	public String getCategoryImg(String categories) {
		return dao.getCategoryImg(categories);
	}

	
	
}