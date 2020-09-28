package com.web.bomulsum.user.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.review.repository.UserReviewDAO;
import com.web.bomulsum.user.review.repository.UserReviewPagingVO;
import com.web.bomulsum.user.review.repository.UserReviewVO;

@Service
public class UserReviewServiceImpl implements UserReviewService {

	@Autowired
	private UserReviewDAO dao;
	
	//내가 쓸 수 있는 구매후기 목록
	@Override
	public List<UserReviewVO> myReview(UserReviewPagingVO vo) {
		return dao.myReview(vo);
	}
	//내가 쓴 구매후기 목록
	@Override
	public List<UserReviewVO> myReviewed(UserReviewPagingVO vo) {
		return dao.myReviewed(vo);
	}
	//작품별 실시간 구매후기 목록
	@Override
	public List<UserReviewVO> realtimeReview(UserReviewPagingVO vo) {
		return dao.realtimeReview(vo);
	}
	@Override
	public List<UserReviewVO> homeRealTimeReviewList() {
		return dao.homeRealTimeReviewList();
	}

	
	//구매 후기 글 등록
	@Override
	public void insertReview(UserReviewVO vo) {
		dao.insertReview(vo);
	}
	//구매 후기 글 수정
	@Override
	public void updateReview(UserReviewVO vo) {
		dao.updateReview(vo);
	}

	//알람 등록
	@Override
	public void insertAlarmTb(UserReviewVO vo) {
		dao.insertAlarmTb(vo);
	}
	
	//구매작품 테이블 구매후기 상태 수정
	@Override
	public void updateBuyArtTb(UserReviewVO vo) {
		dao.updateBuyArtTb(vo);
	}
	//구매작품 테이블 구매후기 수정 최종
	@Override
	public void updateBuyArtTb2(UserReviewVO vo) {
		dao.updateBuyArtTb2(vo);
	}
	
	
	@Override
	public int getReviewCount(UserReviewPagingVO vo) {
		return dao.getReviewCount(vo.getMemberSeq());
	}
	@Override
	public int getReviewedCount(UserReviewPagingVO vo) {
		return dao.getReviewedCount(vo.getMemberSeq());
	}
	@Override
	public int getRealTimeReviewCount(UserReviewPagingVO vo) {
		return dao.getRealTimeReviewCount();
	}

}
