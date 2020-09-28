package com.web.bomulsum.user.payment.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.coupon.service.UserCouponServiceImpl;
import com.web.bomulsum.user.order.repository.UserShopbagOptionVO;
import com.web.bomulsum.user.order.service.UserShopbagService;
import com.web.bomulsum.user.payment.repository.UserCouponPaymentVO;
import com.web.bomulsum.user.payment.repository.UserPaymentVO;
import com.web.bomulsum.user.payment.service.UserPaymentService;
import com.web.bomulsum.user.profile.repository.UserProfileAddressVO;
import com.web.bomulsum.user.profile.repository.UserProfileVO;
import com.web.bomulsum.user.profile.service.UserProfileServiceImpl;
import com.web.bomulsum.user.reserves.service.UserReservesService;

@Controller
@RequestMapping(value="/user")
public class UserPaymentController {

	@Autowired
	UserPaymentService service;
	
	@Autowired
	UserProfileServiceImpl profile_service;
	
	@Autowired
	UserReservesService reserve_service;
	
	@Autowired
	UserCouponServiceImpl coupon_service;
	
	@Autowired
	UserShopbagService cart_service;
	
	@ResponseBody 
	@RequestMapping(value="/payment")
	public ModelAndView payInfo(
			HttpServletRequest request  , @RequestParam(value="cartCode[]") String cartCode[]) {
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
		List<UserCouponPaymentVO> vo = service.selectCouponPayment(memberCode);
		System.out.println("쿠폰:"+vo);
		mav.addObject("couponList", vo);
		
		
		//멤버 등급계산
		int memberSumPay = profile_service.getSumpay(memberCode);
		String memberGrade = "브론즈";
		//System.out.println("여태까지 총 구매한 금액: "+ memberSumPay);
		
		if(memberSumPay < 100000) { //브론즈
			memberGrade = "브론즈";
		}else if(memberSumPay < 1000000) { //실버
			memberGrade = "실버";
		}else if(memberSumPay < 5000000) { //골드
			memberGrade = "골드";
		}else { //다이아
			memberGrade = "다이아";
		}
		
		HashMap<String, Object> memberProMap = new HashMap<String, Object>();
		memberProMap.put("memberCode",memberCode);
		memberProMap.put("memberGrade",memberGrade);
		service.updateMemberGrade(memberProMap); //멤버 등급 변경


		/*
		 * for (int i = 0; i < cartCode.length; i++) { System.out.println(i +
		 * "번째 장바구니: " + cartCode[i]); }
		 */
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberCode", memberCode);
		map.put("cartCode", cartCode);
		System.out.println("map출력:");
		

		
		//--------------상품정보 뿌림-------------
		
		List<UserPaymentVO> shopbagInfo = service.selectCartChoice(map);
		
		for(int i=0; i<shopbagInfo.size(); i++) {
			
			UserPaymentVO tempVO = shopbagInfo.get(i);
			String[] artOption= shopbagInfo.get(i).getArt_option_seq().split("#");
			
			String[] photoArray = tempVO.getArt_photo().split(",");
			tempVO.setArt_photo(photoArray[0]);
			
			String[] countArray = tempVO.getArt_count().split(",");
			tempVO.setArtCount(countArray);
			
			List<Map<String,Object>> totalOption = new ArrayList<Map<String,Object>>();
			
			if(tempVO.getWriter_brand_name() == null) {
	            tempVO.setWriter_brand_name(tempVO.getWriter_name());
	         }
			
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
	
	
	
	
	/* 주문결제처리---------------------------------------------------------------------------- */
	@ResponseBody 
	@RequestMapping(value="/goPayment")
	public ModelAndView goPay(
									@RequestParam(value="memberCode") String memberCode, 
									@RequestParam(value="shipName") String shipName, 
									@RequestParam(value="shipPhone") String shipPhone,
									@RequestParam(value="shipZip") String shipZip,
									@RequestParam(value="shipFirst") String shipFirst,
									@RequestParam(value="shipSecond") String shipSecond,
									@RequestParam(value="orderSum") int orderSum,
									@RequestParam(value="choiceCoupon") String choiceCoupon,
									@RequestParam(value="artPointSum") int artPointSum,
									@RequestParam(value="finUsePoint") int finUsePoint,
									@RequestParam(value="orderArt[]") String[] orderArt,
									@RequestParam(value="orderArtOption[]") String[] orderArtOption,
									@RequestParam(value="artDaName") String artDaName	//상품 대표이름
									
		) {
		
		
		ModelAndView mav = new ModelAndView("ushopbag/usuccessOrder");
		
		
		System.out.println("orderArt확인--->"+Arrays.toString(orderArt));
		for(int i=0; i<orderArt.length; i++) {
			System.out.println("check : " + i + orderArt[i]);
		}
		
		artDaName.trim();
		
		System.out.println(memberCode+"의 주문내용-> 받을이름: "+shipName  +", 받을번호: "+ shipPhone 
				+ ", 우편번호: "+ shipZip + ", 기본주소: "+ shipFirst +", 상세주소: "+ shipSecond 
				+ ", 총주문액: "+ orderSum + ", 사용쿠폰: " + choiceCoupon + ", 사용적립금: "+ finUsePoint 
				+ ", 예상적립금: "+ artPointSum + ", 상품대표이름: "+ artDaName 
				) ;
		
		if(choiceCoupon.length()!=0) {
			service.deleteUseCoupon(choiceCoupon);
		}else {
			System.out.println("쿠폰없음");
		}
		
		HashMap<String,Object> orderMap = new HashMap<String,Object>();
		orderMap.put("memberCode", memberCode);
		orderMap.put("shipName", shipName);
		orderMap.put("shipPhone", shipPhone);
		orderMap.put("shipZip", shipZip);
		orderMap.put("shipFirst", shipFirst);
		orderMap.put("shipSecond", shipSecond);
		orderMap.put("orderSum", orderSum);
		orderMap.put("choiceCoupon", choiceCoupon);
		orderMap.put("finUsePoint", finUsePoint);
		
		artDaName += " ";
		
		if(orderArt.length > 1) {
			artDaName = artDaName + "외 " + (orderArt.length-1)+"건 ";
		}
		
		System.out.println(artDaName+"아트대표네임");
		//작품구매 적립금처리
		HashMap<String, Object> reserveMap = new HashMap<String, Object>();
		reserveMap.put("memberCode", memberCode); 
		reserveMap.put("artPointSum", artPointSum); //예상적립금 
		reserveMap.put("artDaName", artDaName); //구매한작품 대표이름
		if(artPointSum > 0) {
			service.insertOrderReserves(reserveMap); //예상적립금 적립
		}
		reserveMap.put("finUsePoint", finUsePoint); //사용한적립금
		if(finUsePoint > 0) {
		service.insertOrderUseReserves(reserveMap);
		}
		
		
		
		String orderCodeSeq = service.insertOrderList(orderMap); //주문내역테이블에 인서트
		//System.out.println("주문넣은 주문내역seq->"+orderCodeSeq);
		
		// 우영
		List<HashMap<String, String>> imsi = new ArrayList<HashMap<String,String>>();
		// 우영
		for(int i=0; i<orderArt.length; i++) {	//장바구니 코드별
			
			//System.out.println("맵내용:"+orderMap);			
			
			System.out.println(i+"번째 orderArt : "+orderArt[i]);
			
			String[] orderArtOne = orderArt[i].split("@#@"); //작품한줄에 들어간 내용
			
			
			
		
			for(int j=0; j<orderArtOne.length; j++) {	//작품별
				System.out.println(j+"번째 orderArtOne:"+orderArtOne[j] );
				orderMap.put("artInfo"+j, orderArtOne[j]);
//--------------사용 변수명  : 들어가는 내용 ---------------
//				artInfo0 : cart_seq33(장바구니 카트번호)
//				artInfo1: writer_code_seq83(작가번호)
//				artInfo2 : art_code_seq567(작품번호)
//				artInfo3 : 고기(상품이름)
//				artInfo4 : 없음(고객 요청사항)
//				artInfo5 : 0(작품배송비)
//				artInfo6 : 0(제주산간배송비)
				
				//System.out.println(j+"번째 작품내용 : "+orderArtOne[j]);
			}
			//System.out.println("수정된 맵내용:"+orderMap);	
			
			
			orderMap.put("orderCodeSeq", orderCodeSeq); //주문내역코드 맵에넣음
			
			
			String orderWriterCode = service.insertOrderWriter(orderMap); //주문내역테이블에 인서트
			//System.out.println(orderWriterCode); //주문작가코드
			
			orderMap.put("orderWriterCode", orderWriterCode); //주문작가코드 맵에넣음
			
			String orderArtCode = service.insertOrderArt(orderMap);
			System.out.println("orderArtCode->"+orderArtCode);
			
			
			
			//orderMap.put("orderArtCode"+i, orderArtCode); //주문작품코드 맵에넣음
			orderMap.put("orderArtCode", orderArtCode); //주문작품코드 맵에넣음
			
			// 우영
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("orderArtCode", orderArtCode);
			map.put("artCode", (String)orderMap.get("artInfo2"));
			imsi.add(map);
			// 우영
			
			
			
			//구매한 작품 장바구니에서 제거 처리----
			System.out.println("삭제할 작품-->"+ orderArtOne[0]);
			String cartCode = orderArtOne[0];
			service.deleteOrderCart(cartCode);
			
			
			
			
			//System.out.println("현재판매수량----->"+preSalesArt);
			
		} //for문끝(작품별)
		
		
		

		
		
		
		
		System.out.println(Arrays.toString(orderArtOption));
		for(int j=0; j<orderArtOption.length; j++) {
			System.out.println("test : " + orderArtOption[j]);
		}
		//------옵션별
		for(int j=0; j<orderArtOption.length; j++) {
			  //System.out.println(j+"번째 주문결제작품 옵션 : "+orderArtOption[j]); 
			  String[] orderArtOptionOne = orderArtOption[j].split("#"); //작품옵션한줄에 들어간 내용
			  System.out.println("---------------------새로운옵션----------------"+j);
			  for(int z = 0; z<orderArtOptionOne.length; z++) {
						  System.out.println(z+"번째 옵션:"+orderArtOptionOne[z]);
						  
				/*
				 * if(z==0) { //옵션내용 뒤에 / 빼주는 처리 orderArtOptionOne[z] =
				 * orderArtOptionOne[z].substring(0, orderArtOptionOne[z].length()-3); }
				 */
						  
						 orderMap.put("artOptionInfo"+z, orderArtOptionOne[z]);
//						  		변수명         : 내용
//						  artOptionInfo0 : 옵션내용
//						  artOptionInfo1 : art_option_seq539,art_option_seq533,art_option_seq535, (옵션코드들)
//						  artOptionInfo2 : 1 (수량)
//						  artOptionInfo3 : cart_seq33 (장바구니번호)
//						  artOptionInfo4 : art_code_seq567 (작품번호)
//						  artOptionInfo5 : 26000 (작품가격)
			  }
			  System.out.println("최종맵:"+orderMap);
			  // 우영
			  System.out.println("dndud test : " + (String)orderMap.get("artOptionInfo4"));
			  for(HashMap<String, String> m : imsi) {
				  System.out.println("in for dndud test :" + m.get("orderArtCode"));
				  if(m.get("artCode").equals((String)orderMap.get("artOptionInfo4"))) {
					  System.out.println("우영이 테스트 진행중");
					  orderMap.put("orderArtCode", m.get("orderArtCode"));
					  String orderArtOptionCode = service.insertOrderArtOption(orderMap);					  
				  }
//				  orderMap.put("orderArtCode", orderArtCode);
			  }
			  // 우영
			  //System.out.println(orderArtOptionCode);
			  
			  
				//작품 판매수량 증가 처리-----
				String artCode = orderArtOptionOne[4];
				int preSalesArt= service.selectArtSaleCount(artCode); 	//---현재판매수량 얻어오기
				int nowSalesArt = preSalesArt + Integer.parseInt(orderArtOptionOne[2]); //새로운 판매수량
				//System.out.println(artCode+"작품의 이전판매수량: "+preSalesArt+ ", 새로운 판매수량: "+nowSalesArt);
				HashMap<String, Object> salesArtMap = new HashMap<String, Object>();
				salesArtMap.put("artCode", artCode);
				salesArtMap.put("nowSalesArt", nowSalesArt);
				service.updateArtSaleCount(salesArtMap);	//---판매수량 증가시키기
				
				//작품 수량 감소 처리-----
				int preAmount =  service.selectArtAmount(artCode); //---현재작품수량 얻어오기
				int nowAmount = preAmount - Integer.parseInt(orderArtOptionOne[2]); //남은 작품수량
				salesArtMap.put("nowAmount", nowAmount);
				service.updateArtAmount(salesArtMap);
		  }
		
		return mav;
	}
	
	
	
	/* 주문완료 처리---------------------------------------------------------------------------- */
	@ResponseBody 
	@RequestMapping(value="/successPayment" )
	public ModelAndView successPay(
			HttpServletRequest request, 
			@RequestParam(value="SuccessShipName") String SuccessShipName,
			@RequestParam(value="SuccessShipZip") String SuccessShipZip,
			@RequestParam(value="SuccessShipPhone") String SuccessShipPhone,
			@RequestParam(value="SuccessShipAddr1") String SuccessShipAddr1,
			@RequestParam(value="SuccessShipAddr2") String SuccessShipAddr2,
			@RequestParam(value="SuccessArtPrice") int SuccessArtPrice,
			@RequestParam(value="SuccessShipPrice") int SuccessShipPrice,
			@RequestParam(value="SuccessDiscount") int SuccessDiscount,
			@RequestParam(value="SuccessShipJeju") int SuccessShipJeju,
			@RequestParam(value="SuccessPriceSum") int SuccessPriceSum
			) {
		ModelAndView mav =  new ModelAndView("ushopbag/usuccessOrder");
		
		/*
		 * System.out.println("결제한내용--------------");
		 * System.out.println(SuccessShipName); System.out.println(SuccessShipPhone);
		 * System.out.println(SuccessShipZip); System.out.println(SuccessShipAddr1);
		 * System.out.println(SuccessShipAddr2); System.out.println(SuccessArtPrice);
		 * System.out.println(SuccessShipPrice); System.out.println(SuccessShipJeju);
		 * System.out.println(SuccessDiscount); System.out.println(SuccessPriceSum);
		 */
		
		mav.addObject("SuccessShipName", SuccessShipName);
		mav.addObject("SuccessShipPhone", SuccessShipPhone);
		mav.addObject("SuccessShipZip", SuccessShipZip);
		mav.addObject("SuccessShipAddr1", SuccessShipAddr1);
		mav.addObject("SuccessShipAddr2", SuccessShipAddr2);
		mav.addObject("SuccessArtPrice", SuccessArtPrice);
		mav.addObject("SuccessShipPrice", SuccessShipPrice);
		mav.addObject("SuccessShipJeju", SuccessShipJeju);
		mav.addObject("SuccessDiscount", SuccessDiscount);
		mav.addObject("SuccessPriceSum", SuccessPriceSum);
		
		
		
		
		return mav;
	}
	
	
}
