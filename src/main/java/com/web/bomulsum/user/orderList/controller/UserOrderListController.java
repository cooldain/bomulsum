package com.web.bomulsum.user.orderList.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.orderList.repository.OrderListDataVO;
import com.web.bomulsum.user.orderList.service.UserOrderListService;

@Controller
@RequestMapping(value="/user")
public class UserOrderListController {

	@Autowired
	private UserOrderListService service;
	
	@RequestMapping(value="/myInfo/orderList")
	public ModelAndView orderList(HttpSession session,ModelAndView mav) {
		String member = (String)session.getAttribute("member");
		if(member == null) {
			mav.setViewName("redirect:/home.do");
			return mav;
		}
		
		mav.addObject("data", service.getOrderTb(member));
		mav.setViewName("/umyInfo/uorderSend/uOrderList");
		
		return mav;
	}
	
	@RequestMapping(value="/myInfo/orderList/detail")
	public ModelAndView orderListDetail(@RequestParam(value="orderCode") String code, HttpSession session, ModelAndView mav) {
		String member = (String)session.getAttribute("member");
		if(member == null) {
			mav.setViewName("redirect:/home.do");
			return mav;
		}
		
		mav.setViewName("/umyInfo/uorderSend/uOrderListDetail");
		OrderListDataVO vo = service.getOrderDetail(code);
		mav.addObject("data", vo);
		if(vo.getOrderTable().getCouponCodeSeq() != null) {
			String coupon = vo.getOrderTable().getCouponCodeSeq();
			mav.addObject("coupon", service.getCouponPrice(coupon));
		}
		int sum = 0;
		for(int i=0; i<vo.getBuyArt().size(); i++) {
			sum += service.getPointPrice(vo.getBuyArt().get(i).getArtCodeSeq());
		}
		mav.addObject("point", sum);
		
		
		return mav;
	}
	
	@RequestMapping(value="/myInfo/refund/request")
	public ModelAndView refundList(@RequestParam(value="buyWriterCode") String code, HttpSession session, ModelAndView mav ) {
		String member = (String) session.getAttribute("member");
		if(member == null) {
			mav.setViewName("redirect:/home.do");
			return mav;
		}
		String orderCode = service.getOrderCode(code);
		OrderListDataVO vo = service.getOrderDetail(orderCode);
		
		mav.addObject("writerCode", code);
		mav.addObject("data",vo);
		mav.setViewName("/umyInfo/uorderSend/uApplyRefund");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/myInfo/refund/request/check", method = RequestMethod.POST)
	public String requestRefund(@RequestParam String code, @RequestParam String reason, HttpSession session) {
		String member = (String)session.getAttribute("member");
		if(member == null) {
			return "redirect:/home.do";
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("code", code);
		map.put("reason", reason);
		service.requestRefund(map);
		return "success";
	}
	
	@RequestMapping(value="/myInfo/refundList")
	public ModelAndView cancleList(HttpSession session, ModelAndView mav) {
		String member = (String) session.getAttribute("member"); 
		if(member == null) {
			mav.setViewName("redirect:/home.do");
			return mav;
		}
		
		List<HashMap<String, String>> codes = service.refundListCodes(member);
		mav.addObject("data", service.getRefundList(codes));
		mav.setViewName("/umyInfo/uorderSend/uCancleList");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/myInfo/refundList/detail")
	public HashMap<String, Object> refundDetail(@RequestParam(value="code") String code){
		
		HashMap<String , Object> map = new HashMap<String, Object>();
		
		map.put("data", service.ajaxRefundDetail(code));
		System.out.println("체크용 콘솔 : "+map.toString());
		return map;
	}
	
}
