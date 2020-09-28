package com.web.bomulsum.user.buydirect.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.buydirect.repository.UserBuyNowVO;
import com.web.bomulsum.user.buydirect.service.UserBuyNowService;
import com.web.bomulsum.user.coupon.service.UserCouponServiceImpl;
import com.web.bomulsum.user.order.repository.UserShopbagOptionVO;
import com.web.bomulsum.user.order.service.UserShopbagService;
import com.web.bomulsum.user.payment.repository.UserCouponPaymentVO;
import com.web.bomulsum.user.payment.repository.UserPaymentVO;
import com.web.bomulsum.user.payment.service.UserPaymentService;
import com.web.bomulsum.user.productInfo.repository.TestVo;
import com.web.bomulsum.user.profile.repository.UserProfileAddressVO;
import com.web.bomulsum.user.profile.repository.UserProfileVO;
import com.web.bomulsum.user.profile.service.UserProfileServiceImpl;
import com.web.bomulsum.user.reserves.service.UserReservesService;

@Controller
@RequestMapping(value="/user")
public class UserBuyNowController {

	@Autowired
	UserBuyNowService service;
	@Autowired
	UserPaymentService payment_service;
	@Autowired
	UserProfileServiceImpl profile_service;
	@Autowired
	UserReservesService reserve_service;
	@Autowired
	UserCouponServiceImpl coupon_service;
	@Autowired
	UserShopbagService cart_service;
	
	//바로구매
	@RequestMapping(value="/buy")
	public ModelAndView goShopbag(TestVo vo) {
		ModelAndView mav= new ModelAndView("ushopbag/uBuyNow");
		
		//바로구매 값 받아오기
		List<TestVo> listVo = vo.getTestList();
		String artCode=null;
		String memberCode=null;
		String optionCode="";
		String count="";
		for(TestVo v : listVo) {
			artCode = v.getArtCode();
			memberCode = v.getMemberCode();
			optionCode += v.getOptionCode()+"#";
			count += v.getArtCount()+",";
		}
		
		//바로 구매 값 설정
		UserBuyNowVO buyVO = new UserBuyNowVO();
		buyVO.setArt_code_seq(artCode);
		buyVO.setMember_code_seq(memberCode);
		buyVO.setArt_option_seq(optionCode);
		buyVO.setArt_count(count);
		System.out.println("작업 전 "+buyVO.toString());
		String selectedArtCode = buyVO.getArt_code_seq();
		
		//작가 및 작품 정보 가져오기
		UserBuyNowVO tempVO = new UserBuyNowVO();
		tempVO = service.getArtInfo(selectedArtCode);
		String[] photoArr = tempVO.getArt_photo().split(",");
		
		if(tempVO.getWriter_brand_name() == null) {
			tempVO.setWriter_brand_name(tempVO.getWriter_name());
		}
		
		buyVO.setArt_photo(photoArr[0]);
		buyVO.setArt_name(tempVO.getArt_name());
		buyVO.setArt_discount(tempVO.getArt_discount());
		buyVO.setWriter_brand_name(tempVO.getWriter_brand_name());
		buyVO.setWriter_send_price(tempVO.getWriter_send_price());
		buyVO.setWriter_sendfree_case(tempVO.getWriter_sendfree_case());

		String[] countArray = buyVO.getArt_count().split(",");
		buyVO.setArtCount(countArray);
		
		//옵션 잘라서 넣기
		for(int i=0; i<countArray.length; i++) {
			String[] artOption= buyVO.getArt_option_seq().split("#");
			List<Map<String,Object>> totalOption = new ArrayList<Map<String,Object>>();
			int totalPrice = 0;
			for(int j=0; j<artOption.length; j++) {
				int sum = 0;
				int totalSum = 0;
				
				Map<String,Object> optionMap = new HashMap<String,Object>();
				List<UserShopbagOptionVO> optionList = new ArrayList<UserShopbagOptionVO>();
				String[] artOptionDetail = artOption[j].split(",");
				
				optionMap.put("artCount",countArray[j]);
				for(int k=0; k<artOptionDetail.length; k++) {
					UserShopbagOptionVO optionVO = cart_service.getOptionInfo(artOptionDetail[k]);
					optionList.add(optionVO);
					sum += optionList.get(k).getArt_option_price();
				}
				totalSum = (buyVO.getArt_discount() + sum) * Integer.parseInt(buyVO.getArtCount()[j]);
				optionMap.put("totalSum", totalSum);
				optionMap.put("optionArray", optionList);
				totalOption.add(optionMap);
				totalPrice +=(int) totalOption.get(j).get("totalSum");
			}
			buyVO.setTotalPrice(totalPrice);
			buyVO.setTotalOption(totalOption);
		}
		System.out.println("작업 후 "+buyVO.toString());
		mav.addObject("buyArt", buyVO);
		return mav;
	}
	
	//선택한 작품 개수 변화
	@ResponseBody
	@RequestMapping(value="/buyNowChangeCount", method=RequestMethod.POST)
	public String goshopbagPlusCount( @RequestParam(value="count") String changeCount,
			@RequestParam(value="artCount") String OriginArtCount,
			@RequestParam(value="index") int index) {
		
		String[] countArray = OriginArtCount.split(",");
		countArray[index] =changeCount;
		
		String counts = null;
		for(int i=0; i<countArray.length; i++) {
			String temp = countArray[i];
			counts += temp+",";
		}
		String result = counts.substring(4);
		System.out.println("바뀐 카운트" + result);
		return result;
	}
		
	
	//바로구매에서 주문
	@RequestMapping(value="direct/payment")
	public ModelAndView directPay(HttpServletRequest request,
			@RequestParam(value="orderRequest") String orderRequest, @RequestParam(value="artCode") String artCode,
			@RequestParam(value="artOptionCode") String artOptionCode,@RequestParam(value="artCount") String artCount) {
		ModelAndView mav= new ModelAndView("ushopbag/uPayment");
		
		HttpSession session = request.getSession();
		String memberCode= (String) session.getAttribute("member");  //멤버코드
		System.out.println("멤버코드:"+memberCode);
		
		//멤버 이름, 전화번호
		UserProfileVO profileVO = profile_service.getUserinfo(memberCode);
		System.out.println(profileVO);
		String memName = profileVO.getMember_name();
		String memPhone = profileVO.getMember_phone();
		mav.addObject("memName", memName);
		mav.addObject("memPhone", memPhone);
		
		//멤버 배송지
		UserProfileAddressVO addrVO = new UserProfileAddressVO();
		addrVO.setMember_code_seq(memberCode);
		List<UserProfileAddressVO> selectAddress = profile_service.selectUserAddress(addrVO);
		System.out.println("회원주소지:"+selectAddress);
		//mav.addObject("memAddress", selectAddress);
		
		UserProfileAddressVO[] userAddress;
		userAddress = new UserProfileAddressVO[3];

		for (int i = 0; i < 3; i++) {
			userAddress[i] = selectAddress.get(i);
			System.out.println("주소지 배열 값 확인:" + userAddress[i]);
		}
		mav.addObject("address1", userAddress[0]);
		mav.addObject("address2", userAddress[1]);
		mav.addObject("address3", userAddress[2]);
		
		//멤버 적립금
		//int memReserve=reserve_service.getUserSumReserves()-reserve_service.getUserPointUse();
		int memReserve=reserve_service.getUserSumReserves(memberCode) -  reserve_service.getUserPointUse(memberCode);
		//int memReserve = 10000000;
		mav.addObject("memReserve",memReserve);
		
		//멤버 쿠폰 ---- 쿠폰 vo랑 mapping새로만들어서쓰기... 
		List<UserCouponPaymentVO> vo = payment_service.selectCouponPayment(memberCode);
		System.out.println("쿠폰:"+vo);
		mav.addObject("couponList", vo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("artCode", artCode);
		System.out.println("map출력:");
		
		//--------------상품정보 뿌림-------------
		List<UserPaymentVO> shopbagInfo = service.getBuyInfo(map);
		
		for(int i=0; i<shopbagInfo.size(); i++) {
			
			UserPaymentVO tempVO = shopbagInfo.get(i);
			//받아온 값 따로 설정
			tempVO.setMember_code_seq(memberCode);
			tempVO.setOrder_request(orderRequest);
			tempVO.setCart_seq("바로구매");
			tempVO.setArt_option_seq(artOptionCode);
			tempVO.setArt_count(artCount);
			
			String[] artOption= shopbagInfo.get(i).getArt_option_seq().split("#");
			
			String[] photoArray = tempVO.getArt_photo().split(",");
			tempVO.setArt_photo(photoArray[0]);
			
			String[] countArray = tempVO.getArt_count().split(",");
			tempVO.setArtCount(countArray);
			
			List<Map<String,Object>> totalOption = new ArrayList<Map<String,Object>>();
			
			int totalPrice = 0;
			for(int j=0; j<artOption.length; j++) {
				int sum = 0;
				int totalSum = 0;
				
				Map<String,Object> optionMap = new HashMap<String,Object>();
				List<UserShopbagOptionVO> optionList = new ArrayList<UserShopbagOptionVO>();
				String[] artOptionDetail = artOption[j].split(",");
				
				optionMap.put("artCount",countArray[j]);
				
				for(int k=0; k<artOptionDetail.length; k++) {
					UserShopbagOptionVO vo1 = cart_service.getOptionInfo(artOptionDetail[k]);
					optionList.add(vo1);
					sum += optionList.get(k).getArt_option_price();
				}
				
				totalSum = (tempVO.getArt_discount() + sum) * Integer.parseInt(tempVO.getArtCount()[j]);
				optionMap.put("totalSum", totalSum);
				optionMap.put("optionArray", optionList);
				totalOption.add(optionMap);
				totalPrice +=(int) totalOption.get(j).get("totalSum");
				
			}
			tempVO.setTotalPrice(totalPrice);
			tempVO.setTotalOption(totalOption);
			shopbagInfo.remove(i);
			shopbagInfo.add(i, tempVO);
		}
		System.out.println("담은상품목록:"+shopbagInfo);
		
		mav.addObject("shopbagInfo", shopbagInfo);
		//---------------------------
		
		System.out.println("mav내용:"+mav);		
		return mav;
		
	}

}
