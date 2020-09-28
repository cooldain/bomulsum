package com.web.bomulsum.user.coupon.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.coupon.repository.UserCouponDAO;
import com.web.bomulsum.user.coupon.repository.UserCouponListVO;

@Service
public class UserCouponServiceImpl implements UserCouponService{
	
	@Autowired
	private UserCouponDAO dao;

	@Override
	public List<UserCouponListVO> getCouponList(String userCode) {
		return dao.getCouponList(userCode);
	}
	
}
