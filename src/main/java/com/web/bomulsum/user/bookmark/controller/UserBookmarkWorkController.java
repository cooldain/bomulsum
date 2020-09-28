package com.web.bomulsum.user.bookmark.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.article.repository.UserArticleCategoryVO;
import com.web.bomulsum.user.article.repository.UserArticlePagingVO;
import com.web.bomulsum.user.article.service.UserArticleService;
import com.web.bomulsum.user.bookmark.repository.UserBookmarkVO;
import com.web.bomulsum.user.bookmark.service.UserBookmarkWorkService;
import com.web.bomulsum.user.midas.repository.UserMidasPagingVO;
import com.web.bomulsum.user.midas.repository.UserMidasVO;
import com.web.bomulsum.user.midas.service.UserMidasServiceImpl;

@Controller
@RequestMapping(value = "/user/wishlist")
public class UserBookmarkWorkController {
	
	@Autowired
	private UserBookmarkWorkService service;
	
	@Autowired
	private UserArticleService article_service;
	
	@Autowired
	private UserMidasServiceImpl midas_service;
	
	
	//북마크 작품 ----------------------------------------------------
	@RequestMapping(value = "/bookmarkWork")
	public ModelAndView bookmarkWork(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/umyInfo/uwishList/uBookMarkWork");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/bookmarkinfo", method=RequestMethod.POST)
	public HashMap<String, Object> categoryInfo(
				@RequestParam(value="page") int page, 
				@RequestParam(value="member") String member) {
		//UserArticlePagingVO vo = new UserArticlePagingVO();
		UserBookmarkVO vo = new UserBookmarkVO();
		vo.setMemberCode(member);
		
		int totalCnt = service.bookmarkArticleCount(vo);
		int pageCnt = page;
		
		System.out.println("토탈게시물수:"+totalCnt+", 페이지수:"+page);
		if(pageCnt == 1) {
			vo.setStartNum(1);
			vo.setEndNum(12);
		}else {
			vo.setStartNum(pageCnt + (11*(pageCnt-1)));
			vo.setEndNum(pageCnt*12);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		System.out.println("vo확인:"+vo);
		
		List<UserArticleCategoryVO> data = service.bookmarkArticle(vo);
		map.put("totalCnt", totalCnt);
		map.put("startNum", vo.getStartNum());
		map.put("data", data);
		
		if(!member.equals("null") || member != null) {
			map.put("wishList",article_service.getLikeArticles(member));
		}
		
		return map;
	}
	
	
	
	//북마크 : 오프라인----------------------------------------------------
	@RequestMapping(value = "/bookmarkOffline")
	public ModelAndView bookmarkOffline(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/umyInfo/uwishList/uBookMarkOffline");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/bookmarkOffinfo", method=RequestMethod.POST)
	public HashMap<String, Object> bookmarkOfflineInfo(
			@RequestParam(value="page") int page,
			@RequestParam(value="member") String member) {
		//UserMidasPagingVO vo = new UserMidasPagingVO();
		UserBookmarkVO vo = new UserBookmarkVO();
		vo.setMemberCode(member);
		System.out.println("vo확인:"+vo);
		int totalCnt = service.bookmarkOfflineCount(vo);
		
		int pageCnt = page;
		if(pageCnt == 1) {
			vo.setStartNum(1);
			vo.setEndNum(12);
		} else {
			vo.setStartNum(pageCnt+ (11*(pageCnt-1)));
			vo.setEndNum(pageCnt*12);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<UserMidasVO> data = service.bookmarkOffline(vo);
		map.put("totalCnt", totalCnt);
		map.put("startNum", vo.getStartNum());
		map.put("data", data);
		
		if(!member.equals("null") || member != null) {
			map.put("wishList",midas_service.getLikeClass(member));
		}
		
		return map;
	}
	
	
	//북마크 : 온라인----------------------------------------------------
	@RequestMapping(value = "/bookmarkOnline")
	public ModelAndView bookmarkOnline(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/umyInfo/uwishList/uBookMarkOnline");
		return mav;
	}
	
	
}
