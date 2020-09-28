package com.web.bomulsum.user.reserves.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserReservesDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//이용내역
	public List<UserReservesVO> getUserPoint(String member) {
		List<UserReservesVO>  list = sqlSessionTemplate.selectList("userReservesDAO.selectReserves", member);
		System.out.println(list); //테스트
		return list;
	}
	
	//총 사용한 포인트
	public int getUserPointUse(String member) {
		int result = sqlSessionTemplate.selectOne("userReservesDAO.selectUseReserves", member);
		return result;
	}
	
	//총 적립된 포인트
	public int getUserSumReserves(String member) {
		int result = sqlSessionTemplate.selectOne("userReservesDAO.selectSumReserves", member);
		return result;
	}
	
	// 환불 포인트
	public int selectRefundReserves(String member) {
		return sqlSessionTemplate.selectOne("userReservesDAO.selectRefundReserves", member);
	}
	
	
}
