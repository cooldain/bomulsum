package com.web.bomulsum.user.payment.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UserPaymentDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 장바구니 정보
	public List<UserPaymentVO> selectCartChoice(HashMap<String, Object> map) {
		List<UserPaymentVO> shopbagInfo = sqlSessionTemplate.selectList("paymentDAO.selectCartChoice", map);
		System.out.println(shopbagInfo);
		return shopbagInfo;

	}
	// 선택한쿠폰
	public List<UserCouponPaymentVO> selectCouponPayment(String memberCode){
		return sqlSessionTemplate.selectList("paymentDAO.selectCouponPayment", memberCode);
	}
	
	/* 주문내역테이블에 인서트 */
	public String insertOrderList(HashMap<String,Object> map) {
		sqlSessionTemplate.insert("paymentDAO.insertOrderList",map);
		return String.valueOf(map.get("OrdCode"));
	}
	
	/* 구매작가테이블에 인서트 */
	public String insertOrderWriter(HashMap<String,Object> map) {
		sqlSessionTemplate.insert("paymentDAO.insertOrderWriter",map);
		return String.valueOf(map.get("OrdWriterCode"));
	}
	
	/* 구매작품테이블에 인서트 */
	public String insertOrderArt(HashMap<String,Object> map) {
		sqlSessionTemplate.insert("paymentDAO.insertOrderArt",map);
		return String.valueOf(map.get("OrdArtCode"));
	}
	
	/* 옵션테이블에 인서트 */
	public String insertOrderArtOption(HashMap<String,Object> map) {
		sqlSessionTemplate.insert("paymentDAO.insertOrderArtOption",map);
		return String.valueOf(map.get("OrdOptionCode"));
	}
	
	//쿠폰 삭제
	public void deleteUseCoupon(String couponCode) {
		sqlSessionTemplate.delete("paymentDAO.deleteUseCoupon",couponCode);
	}
	
	//판매수량 조회
	public int selectArtSaleCount(String artCode) {
		return sqlSessionTemplate.selectOne("paymentDAO.selectArtSaleCount",artCode);
	}
	
	//판매수량 증가
	public void updateArtSaleCount(HashMap<String, Object> map) {
		sqlSessionTemplate.selectOne("paymentDAO.updateArtSaleCount", map);
	}
	
	//작품수량 조회
	public int selectArtAmount(String artCode) {
		return sqlSessionTemplate.selectOne("paymentDAO.selectArtAmount",artCode);
	}
	
	//작품수량 증가
	public void updateArtAmount(HashMap<String, Object> map) {
		sqlSessionTemplate.selectOne("paymentDAO.updateArtAmount", map);
	}
	
	//구매작품 장바구니에서 삭제
	public void deleteOrderCart(String cartCode) {
		sqlSessionTemplate.delete("paymentDAO.deleteOrderCart", cartCode);
	}
	
	
	//작품 구매로 적립금 적립
	public void insertOrderReserves(HashMap<String, Object> map) {
		sqlSessionTemplate.insert("paymentDAO.insertOrderReserves", map);
	}
	
	//작품 구매로 적립금 사용
	public void insertOrderUseReserves(HashMap<String, Object> map) {
		sqlSessionTemplate.insert("paymentDAO.insertOrderUseReserves", map);
	}
	
	//회원등급 반영
	public void updateMemberGrade(HashMap<String, Object> map) {
		sqlSessionTemplate.update("paymentDAO.updateMemberGrade", map);
	}
}
