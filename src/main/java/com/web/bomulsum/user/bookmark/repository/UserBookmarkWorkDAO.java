package com.web.bomulsum.user.bookmark.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.bomulsum.user.article.repository.UserArticleCategoryVO;
import com.web.bomulsum.user.article.repository.UserArticlePagingVO;
import com.web.bomulsum.user.midas.repository.UserMidasVO;

@Repository
public class UserBookmarkWorkDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* 북마크 작품 */
	public List<UserArticleCategoryVO> bookmarkArticle(UserBookmarkVO vo){
		return sqlSessionTemplate.selectList("userBookmarkDAO.bookmarkArticle", vo);
	}
	
	public int bookmarkArticleCount(UserBookmarkVO vo) {
		return sqlSessionTemplate.selectOne("userBookmarkDAO.bookmarkArticleCount", vo);
	}

	/* 북마크 오프라인클래스 */
	//신규 등록된 클래스 목록 불러오기
	public List<UserMidasVO> bookmarkOffline(UserBookmarkVO vo){
		return sqlSessionTemplate.selectList("userBookmarkDAO.bookmarkOffline", vo);
	}

	//전체 클래스 개수 불러오기
	public int bookmarkOfflineCount(UserBookmarkVO vo) {
		return sqlSessionTemplate.selectOne("userBookmarkDAO.bookmarkOfflineCount",vo);
	}
}
