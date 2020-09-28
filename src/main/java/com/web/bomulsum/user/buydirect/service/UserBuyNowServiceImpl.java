package com.web.bomulsum.user.buydirect.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.buydirect.repository.UserBuyNowDAO;
import com.web.bomulsum.user.buydirect.repository.UserBuyNowVO;
import com.web.bomulsum.user.payment.repository.UserPaymentVO;
@Service
public class UserBuyNowServiceImpl implements UserBuyNowService{

	@Autowired
	UserBuyNowDAO dao;
	
	@Override
	public UserBuyNowVO getArtInfo(String artCode) {
		return dao.getArtInfo(artCode);
	}

	@Override
	public List<UserPaymentVO> getBuyInfo(HashMap<String, Object> map) {
		return dao.getBuyInfo(map);
	}

}
