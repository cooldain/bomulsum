package com.web.bomulsum.user.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.article.repository.UserArticleCategoryVO;
import com.web.bomulsum.user.article.repository.UserOrderByArticlePagingVO;
import com.web.bomulsum.user.article.service.UserArticleService;
import com.web.bomulsum.user.popular.repository.UserPopularWriterVO;
import com.web.bomulsum.user.popular.service.UserPopularWriterService;
import com.web.bomulsum.user.review.repository.UserReviewVO;
import com.web.bomulsum.user.review.service.UserReviewServiceImpl;

@Controller
public class userController {
	
	@Autowired
	private UserArticleService service;
	@Autowired
	private UserReviewServiceImpl serviceR;
	@Autowired
	private UserPopularWriterService serviceW;
	
	@RequestMapping(value="/home")
	public ModelAndView goHome(HttpSession session, ModelAndView mav) {
		
		String member = (String)session.getAttribute("member");
		
		UserOrderByArticlePagingVO vo = new UserOrderByArticlePagingVO();
		
		// 데이터 가공할 list
		List<UserHomeVO> dataList = new ArrayList<UserHomeVO>();
		// 데이터 가공할  객체
		UserHomeVO homeVo = new UserHomeVO();
		
		// 인기 작품.
		vo.setOrderBy("bestWork"); 
		vo.setStartNum(1);
		vo.setEndNum(20);
		
		List<UserArticleCategoryVO> data = service.getListForOrderBy(vo);
		for(UserArticleCategoryVO v : data) {
			homeVo = new UserHomeVO();
			// 작품코드
			homeVo.setArtCode(v.getArtCode());
			// 작가명(브랜드명)
			if(v.getWriterBrandName() == null) {
				homeVo.setWriterName(v.getWriterName());
			}else {
				homeVo.setWriterName(v.getWriterBrandName());
			}
			// 작품 사진
			String[] arrimg = v.getArtPhoto().split(",");
			homeVo.setArtImg(arrimg[0]);
			// 작품명
			homeVo.setArtName(v.getArtName());
			// 후기(별점)
			if(v.getArticleReview().size() > 0) {
				int review = 0;
				int reviewCnt = v.getArticleReview().size();
				for(Integer i : v.getArticleReview()) {
					review += i;
				}
				review = Math.round(review / reviewCnt);
				homeVo.setReviewCnt(reviewCnt);
				homeVo.setReviewValue(review);
			}else {
				homeVo.setReviewCnt(0);
				homeVo.setReviewValue(0);
			}
			dataList.add(homeVo);
		}
		
		mav.addObject("bestWork", dataList);
		
		// 추천작품
		dataList = new ArrayList<UserHomeVO>();
		vo.setOrderBy("recommendWork"); 
		vo.setStartNum(1);
		vo.setEndNum(10);
		
		data = service.getListForOrderBy(vo);
		for(UserArticleCategoryVO v : data) {
			homeVo = new UserHomeVO();
			// 작품코드
			homeVo.setArtCode(v.getArtCode());
			// 작가명(브랜드명)
			if(v.getWriterBrandName() == null) {
				homeVo.setWriterName(v.getWriterName());
			}else {
				homeVo.setWriterName(v.getWriterBrandName());
			}
			// 작품 사진
			String[] arrimg = v.getArtPhoto().split(",");
			homeVo.setArtImg(arrimg[0]);
			// 작품명
			homeVo.setArtName(v.getArtName());
			// 후기(별점)
			if(v.getArticleReview().size() > 0) {
				int review = 0;
				int reviewCnt = v.getArticleReview().size();
				for(Integer i : v.getArticleReview()) {
					review += i;
				}
				review = Math.round(review / reviewCnt);
				homeVo.setReviewCnt(reviewCnt);
				homeVo.setReviewValue(review);
			}else {
				homeVo.setReviewCnt(0);
				homeVo.setReviewValue(0);
			}
			dataList.add(homeVo);
		}
		
		mav.addObject("recommendWork", dataList);
		
	
		// 작가님 추천
		dataList = new ArrayList<UserHomeVO>();
		vo.setOrderBy("artistRecommend"); 
		vo.setStartNum(1);
		vo.setEndNum(10);
		
		data = service.getListForOrderBy(vo);
		for(UserArticleCategoryVO v : data) {
			homeVo = new UserHomeVO();
			// 작품코드
			homeVo.setArtCode(v.getArtCode());
			// 작가명(브랜드명)
			if(v.getWriterBrandName() == null) {
				homeVo.setWriterName(v.getWriterName());
			}else {
				homeVo.setWriterName(v.getWriterBrandName());
			}
			// 작품 사진
			String[] arrimg = v.getArtPhoto().split(",");
			homeVo.setArtImg(arrimg[0]);
			// 작품명
			homeVo.setArtName(v.getArtName());
			// 후기(별점)
			if(v.getArticleReview().size() > 0) {
				int review = 0;
				int reviewCnt = v.getArticleReview().size();
				for(Integer i : v.getArticleReview()) {
					review += i;
				}
				review = Math.round(review / reviewCnt);
				homeVo.setReviewCnt(reviewCnt);
				homeVo.setReviewValue(review);
			}else {
				homeVo.setReviewCnt(0);
				homeVo.setReviewValue(0);
			}
			dataList.add(homeVo);
		}
		
		mav.addObject("artistRecommend", dataList);
		
		if(member != null) {
			mav.addObject("wishList",service.getLikeArticles(member));
		}
	
		//mav.setViewName("uhome");
		
		
		// 실시간 후기
		List<UserReviewVO> dataListR = new ArrayList<UserReviewVO>();
		UserReviewVO homeRVo = new UserReviewVO();
		List<UserReviewVO> dataR = serviceR.homeRealTimeReviewList();
		for(UserReviewVO rv : dataR) {
			homeRVo = new UserReviewVO();
			// 작품코드
			homeRVo.setArtCodeSeq(rv.getArtCodeSeq());
			// 작품 사진
			String[] arrimg = rv.getArtPhoto().split(",");
			homeRVo.setArtPhoto(arrimg[0]);
			// 작품명
			homeRVo.setArtName(rv.getArtName());
			// 후기(별점)
			homeRVo.setReviewStar(rv.getReviewStar());
			// 후기(내용)
			homeRVo.setReviewComment(rv.getReviewComment());
			// 후기작성자
			homeRVo.setMemberName(rv.getMemberName());
			
			dataListR.add(homeRVo);
		}
		
		mav.addObject("realTimeReview", dataListR);

		String categories = "식음료|문구팬시|전자기기|패션잡화|반려동물 용품|인테리어 소품|신발|의류|육아,아동|인형,장난감|공예|기타";
		String img = "";
		String[] category = categories.split("\\|");
		for(int i=0; i<category.length; i++) {
			String photo = service.getCategoryImg(category[i]);
			String[] photos=null;
			if(photo == null || photo.equals("null")) {
				img += "null,";
			}else {
				photos = photo.split(",");
				img += photos[0]+",";
			}
		}
		
		System.out.println("카테고리" + category);
		System.out.println("사진" + img);
		
		mav.addObject("category", category);
		mav.addObject("categoryImg", img);
		
		mav.setViewName("uhome");
		
		
		//인기작가
		List<UserPopularWriterVO> writerList = serviceW.getWriterInfo();
		List<UserPopularWriterVO> popularWriter = new ArrayList<>(writerList.subList(0, 3));

		for(int i=0; i<popularWriter.size(); i++) {
			if(popularWriter.get(i).getWriter_brand_name() == null) {
				String name = popularWriter.get(i).getWriter_name();
				popularWriter.get(i).setWriter_brand_name(name);
			}
			if(popularWriter.get(i).getWriter_intro() == null) {
				popularWriter.get(i).setWriter_intro("소개글 없음");
			}
		}
		
		if(member != null) {
		  mav.addObject("likeWriter",serviceW.isLikeWriter(member)); 
		}
		  
		 
		System.out.println(popularWriter);
		mav.addObject("popularWriter", popularWriter);
		

		
		// 실시간 후기
		/*
		 * List<UserReviewVO> dataListR = new ArrayList<UserReviewVO>(); UserReviewVO
		 * homeRVo = new UserReviewVO(); List<UserReviewVO> dataR =
		 * serviceR.homeRealTimeReviewList(); for(UserReviewVO rv : dataR) { homeRVo =
		 * new UserReviewVO(); // 작품코드 homeRVo.setArtCodeSeq(rv.getArtCodeSeq()); // 작품
		 * 사진 String[] arrimg = rv.getArtPhoto().split(",");
		 * homeRVo.setArtPhoto(arrimg[0]); // 작품명 homeRVo.setArtName(rv.getArtName());
		 * // 후기(별점) homeRVo.setReviewStar(rv.getReviewStar()); // 후기(내용)
		 * homeRVo.setReviewComment(rv.getReviewComment()); // 후기작성자
		 * homeRVo.setMemberName(rv.getMemberName());
		 * 
		 * dataListR.add(homeRVo); }
		 * 
		 * mav.addObject("realTimeReview", dataListR);
		 

		mav.setViewName("uhome");*/
		
		return mav;
	} 

}
