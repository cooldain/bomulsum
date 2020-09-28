package com.web.bomulsum.user.order.service;

import java.util.HashMap;
import java.util.List;

import com.web.bomulsum.user.order.repository.UserShopbagModalVO;
import com.web.bomulsum.user.order.repository.UserShopbagOptionVO;
import com.web.bomulsum.user.order.repository.UserShopbagVO;

public interface UserShopbagService {
	public List<UserShopbagVO> getShopbagInfo(String memberCode);
	public UserShopbagOptionVO getOptionInfo(String artOption);
	public String getArtCount(String cartCode);
	public String selectOption(String cartCode);
	public List<UserShopbagOptionVO> getOptionListInfo(String[] artOption);
	public List<UserShopbagModalVO> goShopbagModal(HashMap<String, String> map);
	public void goOrderRequest(HashMap<String, String> map);
	public void goArtCount(HashMap<String, String> map);
	public void deleteArt(String cartCode);
	public void deleteChoice(String[] cartCheck);
	public List<UserShopbagOptionVO> goShopbagOptionModal(HashMap<String, String> map);
	public void updateOption(HashMap<String, String> map);
	public String shopbagCount(String member);
}
