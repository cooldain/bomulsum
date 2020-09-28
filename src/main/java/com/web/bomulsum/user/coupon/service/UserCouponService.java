package com.web.bomulsum.user.coupon.service;

import java.util.List;

import com.web.bomulsum.user.coupon.repository.UserCouponListVO;

public interface UserCouponService {
	List<UserCouponListVO> getCouponList(String userCode);
}
