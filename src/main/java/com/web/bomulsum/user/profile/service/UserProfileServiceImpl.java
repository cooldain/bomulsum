package com.web.bomulsum.user.profile.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.profile.repository.UserProfileAddressVO;
import com.web.bomulsum.user.profile.repository.UserProfileDAO;
import com.web.bomulsum.user.profile.repository.UserProfileVO;

@Service
public class UserProfileServiceImpl implements UserProfileService{
	@Autowired
	UserProfileDAO dao;
	
	//-----------회원등급
	public int getSumpay(String memberCode) { //회원 구매금액 합계
		return dao.getSumpay(memberCode);
	}

	@Override
	public int getSumpayPeriod(String memberCode) { //3개월내 미구매 있는지 알아오기
		return dao.getSumpayPeriod(memberCode);
	}


	//-----------회원정보관리
	@Override
	public UserProfileVO getUserinfo(String memberCode) { //회원 정보 가져오기
		return dao.getUserinfo(memberCode);
	}

	@Override
	public void updateUserinfo(UserProfileVO vo) { //회원정보 수정
		//체크박스 N값 설정
		if(vo.getMember_sms_agree()==null) {
			vo.setMember_sms_agree("N");
		}
		if(vo.getMember_email_agree()==null) {
			vo.setMember_email_agree("N");
		}
		
		
		dao.updateUserinfo(vo);
	}

	@Override
	public void updateUserphone(UserProfileVO vo) { //전화번호 수정
		dao.updateUserphone(vo);
	}

	@Override
	public void deleteUser(UserProfileVO vo) { //회원 탈퇴
		dao.deleteUser(vo);
		
	}

	
	//---------회원 배송지 관리
	
	@Override
	public void insertUserAddress(UserProfileAddressVO vo) { //회원 주소지 입력
		dao.insertUserAddress(vo);
	}

	@Override
	public List<UserProfileAddressVO> selectUserAddress(UserProfileAddressVO vo) { //회원 주소지 가져오기
		List<UserProfileAddressVO> result = dao.selectUserAddress(vo);
		
		//결과없을때 처리
		UserProfileAddressVO [] userAddress; 
		userAddress = new  UserProfileAddressVO[3];
		
		for(int i=0; i<3; i++) {
			/*
			 * if(result == null) { userAddress[i].setMember_address_first("없음");
			 * userAddress[i].setMember_address_name("없음");
			 * userAddress[i].setMember_address_phone("없음");
			 * userAddress[i].setMember_address_second("없음");
			 * userAddress[i].setMember_address_seq("없음");
			 * userAddress[i].setMember_address_zipcode("없음");
			 * userAddress[i].setMember_code_seq("다인"); }
			 */
		  result.add(userAddress[i]);
		}
		
		return result;
	}

	@Override
	public void updateUserAddress(UserProfileAddressVO vo) {
		dao.updateUserAddress(vo);
	}

	
	//---------회원 사이드메뉴 프로필 관리
	@Override
	public void updateUserProfileImg(UserProfileVO vo) {
		dao.updateUserProfileImg(vo);
		
	}
	

}
