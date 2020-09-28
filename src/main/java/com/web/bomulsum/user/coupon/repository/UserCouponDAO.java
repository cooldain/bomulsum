package com.web.bomulsum.user.coupon.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserCouponDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserCouponListVO> getCouponList(String userCode){
		return sqlSessionTemplate.selectList("couponDao.couponList", userCode);
	}
	
}
