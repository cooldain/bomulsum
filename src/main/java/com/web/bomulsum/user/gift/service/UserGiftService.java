package com.web.bomulsum.user.gift.service;

import java.util.List;
import java.util.Map;

import com.web.bomulsum.user.gift.repository.UserReceiveGiftDetailVO;
import com.web.bomulsum.user.gift.repository.UserReceiveGiftVO;
import com.web.bomulsum.user.gift.repository.UserSendGiftDetailVO;
import com.web.bomulsum.user.gift.repository.UserSendGiftVO;

public interface UserGiftService {

	//보낸 선물함 리스트
	public List<UserSendGiftVO> getSendGift(String memberCode);
	
	//보낸 선물함 상세정보
	public List<UserSendGiftDetailVO> getSendGiftCheck(String orderCode);
	
	//받은 선물함 리스트
	public List<UserReceiveGiftVO> getReceiveGift(Map<String,Object> memberInfo);
	
	//받은 선물함 상세정보
	public List<UserReceiveGiftDetailVO> getReceiveGiftCheck(String orderCode);
	
	//주소 입력
	public void addressUpdate(Map<String, Object> map);
	
	//정보제공동의
	public void infoAgreeUpdate(Map<String, Object> map);
}
