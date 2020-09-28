package com.web.bomulsum.user.whome.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.article.service.UserArticleService;
import com.web.bomulsum.user.whome.repository.UserWHomeVO;
import com.web.bomulsum.user.whome.service.UserWHomeService;


@Controller
@RequestMapping(value="/writerhome")
public class UserWHomeController {
	
	@Autowired
	private UserWHomeService service;
	@Autowired
	private UserArticleService wish_service; //즐겨찾는 작품
	
	
	//작가홈
	@RequestMapping(value="/{urlid}")
	public ModelAndView uMemberGrade(@PathVariable("urlid") String urlid, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/uWriterHome");
		
		//url로 작가seq 알아냄
		System.out.println("들어갈 작가홈 URL:"+urlid);
		//String url_id = urlid;
		String writerCode = service.getWriterFromUrl(urlid);
		System.out.println("작가홈URL:"+urlid+", 작가seq:"+writerCode);
		
		HttpSession session = request.getSession();
		String memberCode= (String) session.getAttribute("member");  //멤버코드
		System.out.println("멤버코드:"+memberCode);
		
		List<UserWHomeVO> artlist = service.getListWriterSalesArt(writerCode);
		System.out.println("-->artlist:"+ artlist);
		
		
		/*
		 * //작가 기본정보 String writerBrandName = artlist.get(0).getWriter_brand_name();
		 * String writerIntro = artlist.get(0).getWriter_intro(); String
		 * writerProfileImg = artlist.get(0).getWriter_profile_img();
		 */

		//작가 기본정보
		String writerBrandName = service.getBrandName(writerCode);
		String writerIntro = service.getArtistItro(writerCode);
		String writerProfileImg = service.getArtistProfileImg(writerCode);
		
		//작가 판매중인 작품 첫번째 이미지만 받아오기
		List<String> artImg = new ArrayList<>(); 
		for (int i=0; i<artlist.size(); i++) {
			String str = artlist.get(i).getArt_photo();
			int end = str.indexOf(",");
			//System.out.println(end);
			artImg.add(i, str.substring(0, end));
			
			List<Integer> review = service.getReviewSelect(artlist.get(i).getArt_code_seq());
			artlist.get(i).setReviewTotal(review.size());
			int imsi = 0;
			for(int j : review) {
				imsi += j;
			}
			artlist.get(i).setReviewStar(imsi);
		}
		System.out.println(artImg);
		
		
		//작가 판매중인 작품 수
		int salesArtCount = service.getSalesArtCount(writerCode);
		
		//작가 구매후기 수
		int reviewTotal = service.getReviewTotal(writerCode);
		
		//좋아하는 사람 수
		int addLikes = service.getAddLikes(writerCode);
		
		mav.addObject("writerBrandName", writerBrandName);
		mav.addObject("writerIntro", writerIntro);
		mav.addObject("writerProfileImg", writerProfileImg);
		
		mav.addObject("artlist", artlist);
		mav.addObject("artImg", artImg);
		
		mav.addObject("salesArtCount", salesArtCount);
		mav.addObject("reviewTotal", reviewTotal);
		mav.addObject("addLikes", addLikes);
		mav.addObject("writerCode", writerCode);
		
		
		//좋아하는 작품 
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member", memberCode);
		map.put("writerCode", writerCode);
		/*
		if(!memberCode.equals("null") || memberCode != null) {
		  mav.addObject("wishArt",wish_service.getLikeArticles(memberCode));
		   }
    	*/
		if(memberCode != null) {
			//mav.addObject("wishArt",wish_service.getLikeArticles(memberCode));
			mav.addObject("wishArt",service.getLikeArt(map));
		}else {
			mav.addObject("wishArt","null");
		}
		
		
		//좋아하는 작가 여부
		if(memberCode != null) {
			//mav.addObject("wishArt",wish_service.getLikeArticles(memberCode));
			mav.addObject("likeArtist",service.likeArtistCheck(map));
		}else {
			mav.addObject("likeArtist","null");
		}
		
		System.out.println(mav);
		return mav;
		

		
	
	} 
	
	
	
//	좋아하는 작품 추가기능
	@ResponseBody
	@RequestMapping(value="/wishart", method=RequestMethod.POST)
	public void wishart(
			@RequestParam(value="member") String member,
			@RequestParam(value="option") String option,
			@RequestParam(value="optionCode") String optionCode,
			@RequestParam(value="bool") Boolean bool ) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member", member);
		map.put("option", option);
		map.put("optionCode", optionCode);
		if(bool) {
			// wishlist테이블에 인서트
			wish_service.likeArticle(map);
		}else {
			// 해당 정보들 테이블에서 삭제
			wish_service.nonLikeArticle(map);
		}
	}

//	좋아하는 작가 추가기능
	@ResponseBody
	@RequestMapping(value="/wishartist", method=RequestMethod.POST)
	public void wishartist(
			@RequestParam(value="member") String member,
			@RequestParam(value="option") String option,
			@RequestParam(value="optionCode") String optionCode,
			@RequestParam(value="bool") Boolean bool ) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member", member);
		map.put("option", option);
		map.put("optionCode", optionCode);
		if(bool) {
			// wishlist테이블에 인서트
			wish_service.likeArticle(map);
		}else {
			// 해당 정보들 테이블에서 삭제
			wish_service.nonLikeArticle(map);
		}
	}
}
