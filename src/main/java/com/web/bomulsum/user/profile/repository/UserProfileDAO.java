package com.web.bomulsum.user.profile.repository;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UserProfileDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	//회원등급--------------------------------------
	public int getSumpay(String memberCode) {
		int result = sqlSessionTemplate.selectOne("userProfileDAO.getSumPay", memberCode);
		return result;
	}
	public int getSumpayPeriod(String memberCode) {
		int result = sqlSessionTemplate.selectOne("userProfileDAO.getSumPayPeriod", memberCode);
		return result;
	}
	
	//회원 정보관리--------------------------------------
		//회원 정보 불러오기
		public UserProfileVO getUserinfo(String memberCode){
			UserProfileVO info = sqlSessionTemplate.selectOne("userProfileDAO.getUserInfo", memberCode);
			return info;
		}
		//회원정보 업데이트
		public void updateUserinfo(UserProfileVO vo) {
			sqlSessionTemplate.update("userProfileDAO.updateUserInfo", vo);
		}
		//회원전화번호 업데이트
		public void updateUserphone(UserProfileVO vo) {
			sqlSessionTemplate.update("userProfileDAO.updateUserPhone", vo);
		}
		//회원삭제
		public void deleteUser(UserProfileVO vo) {
			sqlSessionTemplate.delete("userProfileDAO.deleteUser", vo);
		}
	
		
		//회원 배송지 관리------------------------------
		//회원 배송지 입력
		public void insertUserAddress(UserProfileAddressVO vo) {
			sqlSessionTemplate.insert("userProfileDAO.insertUserAddress" , vo);
		}
		
		//회원 배송지 조회
		public List<UserProfileAddressVO> selectUserAddress(UserProfileAddressVO vo){
			List<UserProfileAddressVO> result = 
					sqlSessionTemplate.selectList("userProfileDAO.selectUserAddress", vo);
			return result;
		}
		
		//회원 배송지 업데이트
		public void updateUserAddress(UserProfileAddressVO vo){
			sqlSessionTemplate.insert("userProfileDAO.updateUserAddress",vo);
		}
		
		//회원 사이드 프로필------------------------------
		
		public void updateUserProfileImg(UserProfileVO vo){
			sqlSessionTemplate.update("userProfileDAO.updateUserProfile",vo);
		}
		
}
