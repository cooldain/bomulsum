package com.web.bomulsum.user.order.repository;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserShopbagDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 장바구니 정보
	public List<UserShopbagVO> getShopbagInfo(String memberCode) {
		List<UserShopbagVO> shopbagInfo = sqlSessionTemplate.selectList("userShopbagDAO.selectCartCon", memberCode);
		return shopbagInfo;

	}
	
	public UserShopbagOptionVO getOptionInfo(String artOption) {
		UserShopbagOptionVO optionInfo = sqlSessionTemplate.selectOne("userShopbagDAO.selectOption", artOption);
		return optionInfo;
	}
	
	//작품 카운트
	public String getArtCount(String cartCode) {
		String artCount = sqlSessionTemplate.selectOne("userShopbagDAO.selectArtCount", cartCode);
		return artCount;
	}
	//기본 모달 부분 --------------
	//기본 모달
	public List<UserShopbagModalVO> goShopbagModal(HashMap<String, String> map){
		List<UserShopbagModalVO> modalInfo = sqlSessionTemplate.selectList("userShopbagDAO.selectmodalCon", map);
		return modalInfo;
	}
	
	//모달에서의 기본 옵션 select
	public String selectOption(String cartCode){
		String optionInfo = sqlSessionTemplate.selectOne("userShopbagDAO.selectArtOption", cartCode);
		return optionInfo;
	}
	//옵션 상세정보
	public List<UserShopbagOptionVO> getOptionListInfo(List<String> artOption) {
		List<UserShopbagOptionVO> optionInfo = sqlSessionTemplate.selectList("userShopbagDAO.selectedListOption", artOption);
		return optionInfo;
	}

	
	
	//옵션 모달
	public List<UserShopbagOptionVO> goShopbagOptionModal(HashMap<String, String> map){
		List<UserShopbagOptionVO> optionModalInfo = sqlSessionTemplate.selectList("userShopbagDAO.selectModalOption", map);
		return optionModalInfo;
	}
	
	//요청사항 등록
	public void goOrderRequest(HashMap<String, String> map) {
		sqlSessionTemplate.update("userShopbagDAO.updateOrderRequest",map);
	}
	//작품 개수 변화
	public void goArtCount(HashMap<String, String> map) {
		sqlSessionTemplate.update("userShopbagDAO.updateArtCount",map);
	}
	//옵션 삭제
	public void deleteArt(String cartCode) {
		sqlSessionTemplate.delete("userShopbagDAO.deleteArt",cartCode);
	}
	//선택 삭제
	public void deleteChoice(List<String> cartCheck) {
		sqlSessionTemplate.delete("userShopbagDAO.deleteChoice",cartCheck);
	}

	//옵션 수정 
	public void updateOption(HashMap<String, String> map) {
		sqlSessionTemplate.update("userShopbagDAO.updateArtOption",map); 
	}
	 
	//장바구니 카운트
	public String shopbagCount(String member) {
		String shopbagCount = sqlSessionTemplate.selectOne("userShopbagDAO.shopbagCount", member);
		return shopbagCount;
	}
	
	
	

}
