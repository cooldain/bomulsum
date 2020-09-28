package com.web.bomulsum.user.login.service;

import java.util.HashMap;

import com.web.bomulsum.user.login.repository.LoginVO;
import com.web.bomulsum.user.login.repository.MemberChangePwVO;
import com.web.bomulsum.user.login.repository.MemberSessionVO;
import com.web.bomulsum.user.login.repository.MemberVO;
import com.web.bomulsum.user.login.repository.NowLoginVO;

public interface MemberService {
	
	// 유저 회원 가입
	void insertMember(MemberVO vo);
	
	// 유저 이메일 중복 확인
	int checkEmail(String memberEmail);
	
	// 로그인 체크
	int loginCheck(LoginVO vo);
	
	// 로그인 유무 처리
	void updateLogin(NowLoginVO vo);
	
	// 회원 코드 가져오기
	String getUserCode(String memberEmail);
	
	// 회원 이름 가져오기
	String getUserName(String code);
	
	// 회원 로그아웃
	void logout(NowLoginVO vo);
	
	// 세션 회원 정보
	MemberSessionVO getUser(String code);
	
	// 비밀번호 찾기용 멤버 정보
	HashMap<String, String> forgotpw(String phone);
	
	// 비밀번호 수정
	void alterTable(MemberChangePwVO vo);
	
}