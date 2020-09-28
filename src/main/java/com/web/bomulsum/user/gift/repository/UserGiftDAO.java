package com.web.bomulsum.user.gift.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserGiftDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//보낸 선물함 정보
	public List<UserSendGiftVO> getSendGift(String memberCode){
		
		List<String> sendGiftCode = sqlSessionTemplate.selectList("userGiftDAO.selectSendCode", memberCode);
		System.out.println(sendGiftCode);
		
		Map<String, Object> orderList = new HashMap<String,Object>();
		orderList.put("orderList", sendGiftCode);
		
		List<UserSendGiftVO> sendGiftList = sqlSessionTemplate.selectList("userGiftDAO.selectSendGift", orderList);
		//System.out.println(sendGiftList);
		return sendGiftList;
	}
	
	//보낸 선물함 상세정보
	public List<UserSendGiftDetailVO> getSendGiftCheck(String orderCode){
		List<UserSendGiftDetailVO> sendGiftDetailCheck = sqlSessionTemplate.selectList("userGiftDAO.selectSendGiftCheck", orderCode);
		return sendGiftDetailCheck;
		
	}
	

	//받은 선물함 정보
	public List<UserReceiveGiftVO> getReceiveGift(Map<String,Object> memberInfo){
		
		List<String> receiveGiftCode = sqlSessionTemplate.selectList("userGiftDAO.selectreceiveCode", memberInfo);
		System.out.println(receiveGiftCode);
		
		Map<String, Object> orderGiftList = new HashMap<String,Object>();
		orderGiftList.put("orderGiftList", receiveGiftCode);
		
		List<UserReceiveGiftVO> sendGiftList = sqlSessionTemplate.selectList("userGiftDAO.selectReceiveGift", orderGiftList);
		//System.out.println(sendGiftList);
		return sendGiftList;
	}
	//받은  선물함 상세정보
	public List<UserReceiveGiftDetailVO> getReceiveGiftCheck(String orderCode){
		List<UserReceiveGiftDetailVO> receiveGiftDetailCheck = sqlSessionTemplate.selectList("userGiftDAO.selectReceiveGiftCheck", orderCode);
		return receiveGiftDetailCheck;
		
	}
	
	// 배송지 입력
	public void addressUpdate(Map<String, Object> map) {
		sqlSessionTemplate.update("userGiftDAO.updateAddress", map);
	}
	//정보제공동의
	public void infoAgreeUpdate(Map<String, Object> map) {
		sqlSessionTemplate.update("userGiftDAO.updateInfoAgree", map);
	}
	
	
	
	
}
