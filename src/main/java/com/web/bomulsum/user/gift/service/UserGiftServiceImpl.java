package com.web.bomulsum.user.gift.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.gift.repository.UserGiftDAO;
import com.web.bomulsum.user.gift.repository.UserReceiveGiftDetailVO;
import com.web.bomulsum.user.gift.repository.UserReceiveGiftVO;
import com.web.bomulsum.user.gift.repository.UserSendGiftDetailVO;
import com.web.bomulsum.user.gift.repository.UserSendGiftVO;

@Service
public class UserGiftServiceImpl implements UserGiftService{

	 @Autowired
	 UserGiftDAO dao;

	//보낸 선물함 리스트
	@Override
	public List<UserSendGiftVO> getSendGift(String memberCode) {
		return dao.getSendGift(memberCode);
	}
	//보낸 선물함 상세정보
	@Override
	public List<UserSendGiftDetailVO> getSendGiftCheck(String orderCode) {
		return dao.getSendGiftCheck(orderCode);
	}
	
	//받은 선물함 리스트
	@Override
	public List<UserReceiveGiftVO> getReceiveGift(Map<String, Object> memberInfo) {
		return dao.getReceiveGift(memberInfo);
	}
	//받은 선물함 상세정보
	@Override
	public List<UserReceiveGiftDetailVO> getReceiveGiftCheck(String orderCode) {
		return dao.getReceiveGiftCheck(orderCode);
	}
	//주소 입력
	@Override
	public void addressUpdate(Map<String, Object> map) {
		dao.addressUpdate(map);
		
	}
	//정보 제공 동의
	@Override
	public void infoAgreeUpdate(Map<String, Object> map) {
		dao.infoAgreeUpdate(map);
	}
	
	

}
