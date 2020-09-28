package com.web.bomulsum.user.coupon.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.coupon.repository.UserCouponListVO;
import com.web.bomulsum.user.coupon.service.UserCouponServiceImpl;

@Controller
@RequestMapping(value="/user/coupon")
public class UserCouponController {
	
	@Autowired
	private UserCouponServiceImpl service;

	@RequestMapping(value="/list")
	public ModelAndView couponList(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String userCode = (String)session.getAttribute("member");
		List<UserCouponListVO> vo = service.getCouponList(userCode);
		
		mav.addObject("couponList", vo);
		mav.setViewName("/umyInfo/udiscount/uCouponList");
		
		return mav;
	}
	
}
