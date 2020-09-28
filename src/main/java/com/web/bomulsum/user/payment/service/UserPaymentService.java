package com.web.bomulsum.user.payment.service;

import java.util.HashMap;
import java.util.List;

import com.web.bomulsum.user.payment.repository.UserCouponPaymentVO;
import com.web.bomulsum.user.payment.repository.UserPaymentVO;

public interface UserPaymentService {
	List<UserPaymentVO> selectCartChoice(HashMap<String, Object> map);
	
	//쿠폰
	List<UserCouponPaymentVO> selectCouponPayment(String memberCode);
	
	//주문테이블에 인서트
	String insertOrderList(HashMap<String,Object> map);
	
	//구매작가 테이블에 인서트
	String insertOrderWriter(HashMap<String,Object> map);
	
	//구매작품 테이블에 인서트
	String insertOrderArt(HashMap<String,Object> map);
	
	//구매옵션 테이블에 인서트
	String insertOrderArtOption(HashMap<String,Object> map);
	
	//사용한 쿠폰 삭제
	void deleteUseCoupon(String couponCode);
	
	//판매수량 조회
	int selectArtSaleCount(String artCode);
	
	//판매수량 증가
	void updateArtSaleCount(HashMap<String, Object> map);
	
	//작품수량 조회
	int selectArtAmount(String artCode);
	
	//작품수량 증가
	void updateArtAmount(HashMap<String, Object> map);
	
	//구매작품 카트에서 제거
	void deleteOrderCart(String cartCode);
	
	//작품 구매로 적립금 적립
	void insertOrderReserves(HashMap<String, Object> map);
	
	//적립금 사용
	void insertOrderUseReserves(HashMap<String, Object> map);
	
	//회원등급 반영
	 void updateMemberGrade(HashMap<String, Object> map);
}
