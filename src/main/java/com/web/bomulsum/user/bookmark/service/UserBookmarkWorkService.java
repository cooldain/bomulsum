package com.web.bomulsum.user.bookmark.service;

import java.util.List;

import com.web.bomulsum.user.article.repository.UserArticleCategoryVO;
import com.web.bomulsum.user.article.repository.UserArticlePagingVO;
import com.web.bomulsum.user.bookmark.repository.UserBookmarkVO;
import com.web.bomulsum.user.midas.repository.UserMidasPagingVO;
import com.web.bomulsum.user.midas.repository.UserMidasVO;

public interface UserBookmarkWorkService {
	
	/* 북마크 작품 */
	List<UserArticleCategoryVO> bookmarkArticle(UserBookmarkVO vo);
	int bookmarkArticleCount(UserBookmarkVO vo);
	
	/* 북마크 오프라인클래스 */
	List<UserMidasVO> bookmarkOffline(UserBookmarkVO vo);
	int bookmarkOfflineCount(UserBookmarkVO vo);
	
}
