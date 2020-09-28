package com.web.bomulsum.user.gift.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.gift.repository.UserReceiveGiftDetailVO;
import com.web.bomulsum.user.gift.repository.UserReceiveGiftVO;
import com.web.bomulsum.user.gift.repository.UserSendGiftDetailVO;
import com.web.bomulsum.user.gift.repository.UserSendGiftVO;
import com.web.bomulsum.user.gift.service.UserGiftService;
import com.web.bomulsum.user.login.repository.MemberSessionVO;

@Controller
@RequestMapping(value="/user")
public class UserGiftController {

	@Autowired
	UserGiftService service;
	
	@RequestMapping(value="/gift")
	public ModelAndView gift() {
		ModelAndView mav = new ModelAndView("/umyInfo/ugift/uSGiftList");
		return mav;
	}
	
	//보낸 선물함
	@RequestMapping(value="/sendGift")
	public ModelAndView sendGift(UserSendGiftVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/umyInfo/ugift/uSGiftList");
		/*
		//회원 코드 가져오기
		HttpSession session =  request.getSession();
		String memberCode = (String) session.getAttribute("member");
		System.out.println(memberCode);
		*/
		String memberCode = "member_code_seq58";
		//작가정보
		List<UserSendGiftVO> sendGiftList = service.getSendGift(memberCode);
		
		for(int i=0; i<sendGiftList.size(); i++) {
			String yesorno = sendGiftList.get(i).getOrder_address_input();
			String[] photoarr = sendGiftList.get(i).getArt_photo().split(",");
			if(yesorno.equals("N")) {
				sendGiftList.get(i).setOrder_address_input("배송주소 입력대기");
			}
			else {
				sendGiftList.get(i).setOrder_address_input("배송주소 입력완료");
			}
			sendGiftList.get(i).setArt_photo(photoarr[0]);
		}
		System.out.println(sendGiftList);
		
		mav.addObject("sendGiftList", sendGiftList);
		return mav;
	}
	
	//보낸 선물함 상세보기
	@RequestMapping(value="sendGift/{orderCode}")
	public ModelAndView sendGiftDetail(@PathVariable String orderCode) {
		ModelAndView mav = new ModelAndView("/umyInfo/ugift/uSGiftCheck");
		
		List<UserSendGiftDetailVO> sendGiftCheckList = service.getSendGiftCheck(orderCode);
		
		for(int i=0; i<sendGiftCheckList.size(); i++) {
			String yesorno = sendGiftCheckList.get(i).getOrder_address_input();
			String[] photoarr = sendGiftCheckList.get(i).getArt_photo().split(",");
			String limitDate = sendGiftCheckList.get(i).getLimitDate().toString();
			if(yesorno.equals("N")) {
				sendGiftCheckList.get(i).setOrder_address_input("배송주소 입력대기(유효기간: "+limitDate + ")");
			}
			else {
				sendGiftCheckList.get(i).setOrder_address_input("배송주소 입력완료");
			}
			sendGiftCheckList.get(i).setArt_photo(photoarr[0]);
			
		}
		System.out.println(sendGiftCheckList);
		
		mav.addObject("sendGiftCheckList", sendGiftCheckList);
		return mav;
	}
	
	//받은 선물함
	@RequestMapping(value="/receiveGift")
	public ModelAndView receiveGift(MemberSessionVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/umyInfo/ugift/uRGiftList");
		
		//회원 정보 가져오기
		//HttpSession session =  request.getSession();
		//String memberName = (String) session.getAttribute("userName");
		//System.out.println(memberName);
		//MemberSessionVO memberInfo = (MemberSessionVO) session.getAttribute("user");
		//System.out.println(memberInfo);
		//String memberPhone = memberInfo.getMemberPhone();
		//System.out.println(memberPhone);
		String memberName = "홍길동";
		String memberPhone="010-1111-1111";
		Map<String, Object> memberInfo = new HashMap<String, Object>();
		memberInfo.put("memberName", memberName);
		memberInfo.put("memberPhone", memberPhone);
		
		List<UserReceiveGiftVO> receiveGiftList = service.getReceiveGift(memberInfo);
		System.out.println(receiveGiftList);
		
		for(int i=0; i<receiveGiftList.size(); i++) {
			String yesorno = receiveGiftList.get(i).getOrder_address_input();
			String[] photoarr = receiveGiftList.get(i).getArt_photo().split(",");
			String phone = receiveGiftList.get(i).getMember_phone().substring(9);
			String limitDate = receiveGiftList.get(i).getLimitDate().toString();
			if(yesorno.equals("N")) {
				receiveGiftList.get(i).setOrder_address_input("배송주소 입력대기 (유효기간: "+ limitDate + ")");
			}
			else {
				receiveGiftList.get(i).setOrder_address_input("배송주소 입력완료");
			}
			receiveGiftList.get(i).setArt_photo(photoarr[0]);
			receiveGiftList.get(i).setMember_phone(phone);
		}
		System.out.println(receiveGiftList);
		mav.addObject("receiveGiftCheckList", receiveGiftList);
		
		
		return mav;
	} 

	//받은 선물함 상세보기
	@RequestMapping(value="receiveGift/{orderCode}")
	public ModelAndView receiveGiftDetail(@PathVariable String orderCode) {
		ModelAndView mav = new ModelAndView("/umyInfo/ugift/uRGiftCheck");
		
		List<UserReceiveGiftDetailVO> receiveGiftCheckList = service.getReceiveGiftCheck(orderCode);
		System.out.println(receiveGiftCheckList);
		
		for(int i=0; i<receiveGiftCheckList.size(); i++) {
			String[] photoarr = receiveGiftCheckList.get(i).getArt_photo().split(",");
			String phone = receiveGiftCheckList.get(i).getMember_phone().substring(9);
			receiveGiftCheckList.get(i).setArt_photo(photoarr[0]);
			receiveGiftCheckList.get(i).setMember_phone(phone);
		}
		System.out.println(receiveGiftCheckList);
		mav.addObject("receiveGiftDetailList", receiveGiftCheckList);
		
		return mav;
	}
	
	//배송 주소 입력
	@RequestMapping(value="addressRegister")
	public ModelAndView insertAddress(@RequestParam(value="recipientZipcode") String zipcode, 
			@RequestParam(value="addressFirst")String addressFirst,
			@RequestParam(value="addressSecond")String addressSecond,
			@RequestParam(value="orderCodeSeq") String orderCode,
			@RequestParam(value="reliveNum") String reliveNumber, 
			@RequestParam(value="addressInfoAgree") String addressInfoAgree, HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		
		//안심번호 동의 여부
		if(!reliveNumber.equals(null) ) {
			reliveNumber = "Y";
		}
		
		//정보제공 동의 여부
		if(!addressInfoAgree.equals(null) ) {
			addressInfoAgree = "Y";
		}
		
		//배송지 업데이트
		Map<String, Object> addressData = new HashMap<String, Object>();
		addressData.put("addressZipcode", zipcode);
		addressData.put("addressFirst", addressFirst);
		addressData.put("addressSecond", addressSecond);
		addressData.put("orderCode", orderCode);
		addressData.put("reliveNum", reliveNumber);
		System.out.println(addressData);
		service.addressUpdate(addressData);
	
		
		//정보제공동의 업데이트
		Map<String, Object> infoAgree = new HashMap<String, Object>();
		infoAgree.put("addressInfoAgree", addressInfoAgree);
		infoAgree.put("orderCode", orderCode);
		service.infoAgreeUpdate(infoAgree);
		
		mav.setViewName("redirect:/user/receiveGift.do"); 
		return mav;
		
	}
}
