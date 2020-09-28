package com.web.bomulsum.user.recently.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.recently.service.UserRecentlyWatchService;

@Controller
@RequestMapping(value="/user/wishlist")
public class UserRecentlyWatchController {
	
	@Autowired
	UserRecentlyWatchService service;
	
	@RequestMapping(value="/recently")
	public ModelAndView recentlyWatch(HttpSession session, ModelAndView mav) {
		
		String member = (String)session.getAttribute("member");
		mav.addObject("data", service.getArticleCode(member));
		mav.setViewName("/umyInfo/uwishList/uRecentWork");
		
		return mav;
	}

}
