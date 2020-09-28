package com.web.bomulsum.user.buydirect.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.bomulsum.user.order.repository.UserShopbagOptionVO;
import com.web.bomulsum.user.payment.repository.UserPaymentVO;

@Repository
public class UserBuyNowDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 해당 작품 정보
	public UserBuyNowVO getArtInfo(String artCode) {
		UserBuyNowVO artInfo = sqlSessionTemplate.selectOne("userBuyNowDAO.selectCon", artCode);
		return artInfo;
	}
	
	//옵션 정보
	public UserShopbagOptionVO getOptionInfo(String artOption) {
		UserShopbagOptionVO optionInfo = sqlSessionTemplate.selectOne("userBuyNowDAO.selectOption", artOption);
		return optionInfo;
	}
	//바로구매 정보
	public List<UserPaymentVO> getBuyInfo(HashMap<String,Object> map) {
		List<UserPaymentVO> buyInfo = sqlSessionTemplate.selectList("userBuyNowDAO.selectBuyCon", map);
		return buyInfo;
	}

}
