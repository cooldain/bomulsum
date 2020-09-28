package com.web.bomulsum.user.review.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserReviewDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//후기 등록할 수 있는 목록 불러오기
	public List<UserReviewVO> myReview(UserReviewPagingVO vo){
		return sqlSessionTemplate.selectList("userReviewDAO.reviewList", vo);
	}
	//작성한 후기 목록 불러오기
	public List<UserReviewVO> myReviewed(UserReviewPagingVO vo){
		return sqlSessionTemplate.selectList("userReviewDAO.reviewedList", vo);
	}
	//작품별 최신 후기 목록 불러오기
	public List<UserReviewVO> realtimeReview(UserReviewPagingVO vo){
		return sqlSessionTemplate.selectList("userReviewDAO.realtimeReview", vo);
	}
	
	//홈 화면 구매후기 목록 불러오기
	public List<UserReviewVO> homeRealTimeReviewList(){
		return sqlSessionTemplate.selectList("userReviewDAO.homeRealTimeReviewList");
	}
	
	
	//페이징 처리를 위한 카운팅
	public int getReviewCount(String memberSeq) {
		return sqlSessionTemplate.selectOne("userReviewDAO.getReviewCount", memberSeq);
	}
	public int getReviewedCount(String memberSeq) {
		return sqlSessionTemplate.selectOne("userReviewDAO.getReviewedCount", memberSeq);
	}
	public int getRealTimeReviewCount() {
		return sqlSessionTemplate.selectOne("userReviewDAO.getRealTimeReviewCount");
	}
	
	
	//구매 후기 등록
	public void insertReview(UserReviewVO vo) {
		sqlSessionTemplate.insert("userReviewDAO.reviewReg", vo);
	}
	//구매 후기 수정
	public void updateReview(UserReviewVO vo) {
		sqlSessionTemplate.update("userReviewDAO.updateReview", vo);
	}
	
	
	
	//알람 등록
	public void insertAlarmTb(UserReviewVO vo) {
		sqlSessionTemplate.insert("userReviewDAO.insertAlarmTb", vo);
	}
	//구매내역테이블 업데이트
	public void updateBuyArtTb(UserReviewVO vo) {
		sqlSessionTemplate.update("userReviewDAO.updateBuyArtTb", vo);
	}
	public void updateBuyArtTb2(UserReviewVO vo) {
		sqlSessionTemplate.update("userReviewDAO.updateBuyArtTb2", vo);
	}

}
