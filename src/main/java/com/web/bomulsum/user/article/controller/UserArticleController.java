package com.web.bomulsum.user.article.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.bomulsum.user.article.repository.UserArticleCategoryVO;
import com.web.bomulsum.user.article.repository.UserArticlePagingVO;
import com.web.bomulsum.user.article.repository.UserOrderByArticlePagingVO;
import com.web.bomulsum.user.article.service.UserArticleService;

@Controller
@RequestMapping(value="/category")
public class UserArticleController {
	
	@Autowired
	private UserArticleService service;
	
	// 추천 작품
	@RequestMapping(value="/recommended")
	public String recommended() {
		return "/ucategory/urecommendedWork";
	}
	
	// 작가님 추천
	@RequestMapping(value="/artistRecommend")
	public String artistRecommend() {
		return "/ucategory/uArtistRecommend";
	}
	
	// 인기 작품
	@RequestMapping(value="/bestwork")
	public String bestWork() {
		return "/ucategory/ubestWork";
	}
	
	@ResponseBody
	@RequestMapping(value="/InfoForHeadCategory", method=RequestMethod.POST)
	public HashMap<String, Object> bestworkInfo(
			@RequestParam(value="page") int page,
			@RequestParam(value="methodName") String method,
			@RequestParam(value="member") String member
			) {
		
		UserOrderByArticlePagingVO vo = new UserOrderByArticlePagingVO();
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		switch(method) {
			// 인기 작품.
			case "bestWork" :
				vo.setOrderBy(method); 
				int totalCnt = service.getOrderByArticleCount(vo);
				int pageCnt = page;
				if(pageCnt == 1) {
					vo.setStartNum(1);
					vo.setEndNum(20);
				}else {
					vo.setStartNum(pageCnt + (19*(pageCnt-1)));
					vo.setEndNum(pageCnt*20);
				}
				map.put("totalCnt", totalCnt);
				map.put("startNum", vo.getStartNum());
				
				List<UserArticleCategoryVO> data = service.getListForOrderBy(vo);
				map.put("data", data);
				
				if(!member.equals("null") || member != null) {
					map.put("wishList",service.getLikeArticles(member));
				}
				
				break;
			
			// 추천작품
			case "recommendWork" :
				vo.setOrderBy(method); 
				
				totalCnt = service.getOrderByArticleCount(vo);
				pageCnt = page;
				if(pageCnt == 1) {
					vo.setStartNum(1);
					vo.setEndNum(20);
				}else {
					vo.setStartNum(pageCnt + (19*(pageCnt-1)));
					vo.setEndNum(pageCnt*20);
				}
				map.put("totalCnt", totalCnt);
				map.put("startNum", vo.getStartNum());
				
				data = service.getListForOrderBy(vo);
				map.put("data", data);
				
				if(!member.equals("null") || member != null) {
					map.put("wishList",service.getLikeArticles(member));
				}
				
				break;
			
			// 작가님 추천
			case "artistRecommend" :
				vo.setOrderBy(method); 
				
				totalCnt = service.getOrderByArticleCount(vo);
				pageCnt = page;
				if(pageCnt == 1) {
					vo.setStartNum(1);
					vo.setEndNum(15);
				}else {
					vo.setStartNum(pageCnt + (14*(pageCnt-1)));
					vo.setEndNum(pageCnt*15);
				}
				map.put("totalCnt", totalCnt);
				map.put("startNum", vo.getStartNum());
				
				data = service.getListForOrderBy(vo);
				map.put("data", data);
				
				if(!member.equals("null") || member != null) {
					map.put("wishList",service.getLikeArticles(member));
				}
				
				break;
		}
		
		return map;
	}
	
	// 카테고리
	@RequestMapping(value="/detail")
	public String categoryHome(String category) {
		return "/ucategory/ucategory";
	}
	
	@ResponseBody
	@RequestMapping(value="/info", method=RequestMethod.POST)
	public HashMap<String, Object> categoryInfo(
				@RequestParam(value="category") String category, 
				@RequestParam(value="page") int page, 
				@RequestParam(value="filtArr[]", required = false) List<String> filtArr,
				@RequestParam(value="orderBy") String orderBy,
				@RequestParam(value="member") String member) {
		UserArticlePagingVO vo = new UserArticlePagingVO();
		List<String> priceArr = new ArrayList<String>();
		
		if(filtArr != null) {
			for(String s : filtArr) {
				if(s.equals("무료배송") && filtArr.size() == 1) {
					vo.setSendPrice(s);
					priceArr = null;
				}else if(s.equals("무료배송")) {
					vo.setSendPrice(s);
				}else {
					priceArr.add(s);
				}
			}
			if(priceArr != null) {
				vo.setFiltArr(priceArr);
			}
		}
		vo.setOrderBy(orderBy);
		vo.setCategory(category);
		int totalCnt = service.getCategoryArticleCount(vo);
		int pageCnt = page;
		if(pageCnt == 1) {
			vo.setStartNum(1);
			vo.setEndNum(15);
		}else {
			vo.setStartNum(pageCnt + (14*(pageCnt-1)));
			vo.setEndNum(pageCnt*15);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<UserArticleCategoryVO> data = service.getListForCategory(vo);
		map.put("totalCnt", totalCnt);
		map.put("startNum", vo.getStartNum());
		map.put("data", data);
		
		if(!member.equals("null") || member != null) {
			map.put("wishList",service.getLikeArticles(member));
		}
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/wish", method=RequestMethod.POST)
	public void filterInfo(
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
			service.likeArticle(map);
		}else {
			// 해당 정보들 테이블에서 삭제
			service.nonLikeArticle(map);
		}
		
		
	}
	
}