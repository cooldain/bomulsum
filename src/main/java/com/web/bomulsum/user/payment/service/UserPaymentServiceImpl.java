package com.web.bomulsum.user.payment.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.payment.repository.UserCouponPaymentVO;
import com.web.bomulsum.user.payment.repository.UserPaymentDAO;
import com.web.bomulsum.user.payment.repository.UserPaymentVO;

@Service
public class UserPaymentServiceImpl implements UserPaymentService{

	@Autowired
	UserPaymentDAO dao;

	@Override
	public List<UserPaymentVO> selectCartChoice(HashMap<String, Object> map) {
		return dao.selectCartChoice(map);
	}

	@Override
	public List<UserCouponPaymentVO> selectCouponPayment(String memberCode) {
		return dao.selectCouponPayment(memberCode);
	}

	@Override
	public String insertOrderList(HashMap<String, Object> map) {
		return dao.insertOrderList(map);
	}

	@Override
	public String insertOrderWriter(HashMap<String, Object> map) {
		return dao.insertOrderWriter(map);
	}

	@Override
	public String insertOrderArt(HashMap<String, Object> map) {
		return dao.insertOrderArt(map);
	}

	@Override
	public String insertOrderArtOption(HashMap<String, Object> map) {
		return dao.insertOrderArtOption(map);
	}

	@Override
	public void deleteUseCoupon(String couponCode) {
		dao.deleteUseCoupon(couponCode);
	}

	@Override
	public int selectArtSaleCount(String artCode) {
		return dao.selectArtSaleCount(artCode);
	}

	@Override
	public void updateArtSaleCount(HashMap<String, Object> map) {
		dao.updateArtSaleCount(map);
	}

	@Override
	public int selectArtAmount(String artCode) {
		return dao.selectArtAmount(artCode);
	}

	@Override
	public void updateArtAmount(HashMap<String, Object> map) {
		dao.updateArtAmount(map);
	}

	@Override
	public void deleteOrderCart(String cartCode) {
		dao.deleteOrderCart(cartCode);
	}

	@Override
	public void insertOrderReserves(HashMap<String, Object> map) {
		dao.insertOrderReserves(map);
	}

	@Override
	public void insertOrderUseReserves(HashMap<String, Object> map) {
		dao.insertOrderUseReserves(map);
	}

	@Override
	public void updateMemberGrade(HashMap<String, Object> map) {
		dao.updateMemberGrade(map);
	}
	
	


}
