package com.web.bomulsum.user.article.controller;

import java.sql.Date;
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
import com.web.bomulsum.user.article.repository.UserMidasClassVO;
import com.web.bomulsum.user.article.repository.UserSearchPagingVO;
import com.web.bomulsum.user.article.service.UserArticleService;

@Controller
@RequestMapping(value="/search")
public class UserSearchController {
	
	@Autowired
	private UserArticleService service;

	@RequestMapping(value="/result", method=RequestMethod.GET)
	public String getSearch(@RequestParam String headerSearch) {
		if(!headerSearch.equals("null") || headerSearch != null) {
			int count = service.selectWord(headerSearch);
			if(count == 0) {
				service.insertWord(headerSearch);
			}else {
				HashMap<String, Object> map = new HashMap<String, Object>();
				Date time = new Date(System.currentTimeMillis());
				map.put("word", headerSearch);
				map.put("time", time);
				map.put("count", ++count);
				service.updateWord(map);
			}
		}
		return "/usearch/uSearch";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/info", method = RequestMethod.POST)
	public HashMap<String, Object> searchFilter(
			@RequestParam(value="artORclass") String artORclass,
			@RequestParam(value="word") String word,
			@RequestParam(value="page") int page, 
			@RequestParam(value="filtArr[]", required = false) List<String> filtArr,
			@RequestParam(value="category[]", required = false) List<String> category,
			@RequestParam(value="orderBy", required = false) String orderBy,
			@RequestParam(value="member") String member){
		
		
		if(artORclass.equals("art")) {
			// 작품 검색 결과
			HashMap<String, Object> map = new HashMap<String, Object>();
			UserSearchPagingVO vo = new UserSearchPagingVO();
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
			if(category != null) {
				vo.setCategory(category);
			}
			vo.setOrderBy(orderBy);
			vo.setWord(word);
			int totalCnt = service.getSearchArticleCount(vo);
			int pageCnt = page;
			if(pageCnt == 1) {
				vo.setStartNum(1);
				vo.setEndNum(20);
			}else {
				vo.setStartNum(pageCnt + (19*(pageCnt-1)));
				vo.setEndNum(pageCnt*20);
			}
			
			List<UserArticleCategoryVO> data = service.getArticleListForSearch(vo);
			map.put("totalCnt", totalCnt);
			map.put("startNum", vo.getStartNum());
			map.put("data", data);
			
			// 좋아하는 작품 끌어오기.
			if(!member.equals("null") || member != null) {
				map.put("wishList",service.getLikeArticles(member));
			}
			
			return map;
		}else {
			// 금손 검색 결과
			HashMap<String, Object> map = new HashMap<String, Object>();
			UserSearchPagingVO vo = new UserSearchPagingVO();
			vo.setWord(word);
			int totalCnt = service.getSearchClassCount(vo.getWord());
			int pageCnt = page;
			if(pageCnt == 1) {
				vo.setStartNum(1);
				vo.setEndNum(16);
			}else {
				vo.setStartNum(pageCnt + (15*(pageCnt-1)));
				vo.setEndNum(pageCnt*16);
			}
			
			map.put("totalCnt", totalCnt);
			map.put("startNum", vo.getStartNum());
			
			List<UserMidasClassVO> data = service.getSearchClass(vo);
			map.put("data", data);
			
			if(!member.equals("null") || member != null) {
				map.put("wishList", service.getLikeMidas(member));
			}
			
			return map;
		}
		
	}
	
	@RequestMapping(value="/result/class", method=RequestMethod.GET)
	public String getSearchClass(@RequestParam String headerSearch) {
		
		return "/usearch/uSearchClass";
	}
	
	
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/realTime", method = RequestMethod.POST)
	public List<String> realTimeKeyword(){
		return service.realTimeKeyword();
	}
	
	
}