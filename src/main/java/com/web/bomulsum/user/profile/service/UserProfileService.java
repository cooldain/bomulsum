package com.web.bomulsum.user.profile.service;

import java.util.List;

import com.web.bomulsum.user.profile.repository.UserProfileAddressVO;
import com.web.bomulsum.user.profile.repository.UserProfileVO;

public interface UserProfileService {
	//-----------회원등급
	int getSumpay(String memberCode);	//회원 구매금액 합계
	int getSumpayPeriod(String memberCode); //3개월내 미구매 있는지 알아오기
	
	//-----------회원정보관리
	UserProfileVO getUserinfo(String memberCode); //회원 정보 가져오기
	void updateUserinfo(UserProfileVO vo); //회원정보 수정
	void updateUserphone(UserProfileVO vo); //전화번호 수정
	void deleteUser(UserProfileVO vo); //회원 탈퇴
	
	//-----------회원배송지관리
	void insertUserAddress(UserProfileAddressVO vo); //회원 주소지 입력
	List<UserProfileAddressVO> selectUserAddress(UserProfileAddressVO vo); //회원 주소지 가져오기
	void updateUserAddress(UserProfileAddressVO vo); //회원 주소지 수정
	
	//-----------회원 사이드메뉴 프로필정보관리
	void updateUserProfileImg(UserProfileVO vo);
}
