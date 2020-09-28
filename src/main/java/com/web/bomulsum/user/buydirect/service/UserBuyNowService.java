package com.web.bomulsum.user.buydirect.service;

import java.util.HashMap;
import java.util.List;

import com.web.bomulsum.user.buydirect.repository.UserBuyNowVO;
import com.web.bomulsum.user.payment.repository.UserPaymentVO;

public interface UserBuyNowService {
	
	public UserBuyNowVO getArtInfo(String artCode);
	public List<UserPaymentVO> getBuyInfo(HashMap<String,Object> map);

}
