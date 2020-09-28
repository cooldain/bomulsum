package com.web.bomulsum.user.orderList.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.web.bomulsum.user.orderList.repository.OrderListDataVO;
import com.web.bomulsum.user.orderList.repository.UserOrderTableVO;

@Service
public interface UserOrderListService {

	// 모든 주문내역 테이블 조회
	List<OrderListDataVO> getOrderTb(String member);
	
	// 주문코드 기반 조회
	OrderListDataVO getOrderDetail(String code);
	
	// 쿠폰 가격 가져오기.
	int getCouponPrice(String coupon);
	
	// 적립금 가져오기
	int getPointPrice(String artCode);
	
	// 최근 주문내역 하나만
	UserOrderTableVO recentOne(String memberCode);
	
	// 주문내역 상태 정보 뽑아오기
	List<String> getOrderStatusList(String memberCode);
	
	// 구매작가별 코드 기반 주문코드 가져오기
	String getOrderCode(String code);
	
	// 환불요청 처리하기
	void requestRefund(HashMap<String, String> map);
	
	// 환불 내역 주문코드, 구매작가별코드
	List<HashMap<String, String>> refundListCodes(String member);
	
	// 환불 내역 주문 테이블 조회
	List<OrderListDataVO> getRefundList(List<HashMap<String, String>> map);
	
	// 환불내역 디테일
	OrderListDataVO ajaxRefundDetail(String code);
}
