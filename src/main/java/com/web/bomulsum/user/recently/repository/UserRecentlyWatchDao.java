package com.web.bomulsum.user.recently.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserRecentlyWatchDao {
	
	@Autowired
	SqlSessionTemplate sqlTemplate;
	
	// 멤버코드 기준 작품 코드 끌어오기
	public List<String> getArticleCode(String member){
		return sqlTemplate.selectList("recentlyDao.getArticleCode", member);
	}
	
	// 작품코드 기준 작품 정보 불러오기
	public UserRecentylWatchVo getArtileInfo(String artCode){
		return sqlTemplate.selectOne("recentlyDao.getArticleInfo", artCode);
	}
	
	// 작품코드 기준 후기 정보 불러오기
	public List<UserRecentylWatchReviewVo> getArticleReview(String artCode){
		return sqlTemplate.selectList("recentlyDao.getArticleReview", artCode);
	}
	
}
