package com.web.bomulsum.user.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.order.repository.UserShopbagDAO;
import com.web.bomulsum.user.order.repository.UserShopbagModalVO;
import com.web.bomulsum.user.order.repository.UserShopbagOptionVO;
import com.web.bomulsum.user.order.repository.UserShopbagVO;

@Service
public class UserShopbagServiceImpl implements UserShopbagService{
	
	
	@Autowired
	UserShopbagDAO dao;

	@Override
	public List<UserShopbagVO> getShopbagInfo(String memberCode) {
		return dao.getShopbagInfo(memberCode);
	}

	@Override
	public List<UserShopbagModalVO> goShopbagModal(HashMap<String, String> map) {
		return dao.goShopbagModal(map);
	}

	@Override
	public void goOrderRequest(HashMap<String, String> map) {
		dao.goOrderRequest(map);
	}

	@Override
	public void goArtCount(HashMap<String, String> map) {
		dao.goArtCount(map);
	}
	

	@Override
	public List<UserShopbagOptionVO> getOptionListInfo(String[] artOption) {
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < artOption.length; i++) {
			list.add(artOption[i]);
		}
		return dao.getOptionListInfo(list);
	}

	@Override
	public void deleteArt(String cartCode) {
		dao.deleteArt(cartCode);
	}

	@Override
	public void deleteChoice(String[] cartCheck) {
		List<String> list = new ArrayList<String>();
		for(int i=0; i<cartCheck.length; i++) {
			list.add(cartCheck[i]);
		}
		dao.deleteChoice(list);
	}

	@Override
	public List<UserShopbagOptionVO> goShopbagOptionModal(HashMap<String, String> map) {
		return dao.goShopbagOptionModal(map);
	}

	@Override
	public void updateOption(HashMap<String, String> map) {
		dao.updateOption(map);
		
	}

	@Override
	public UserShopbagOptionVO getOptionInfo(String artOption) {
		return dao.getOptionInfo(artOption);
	}

	@Override
	public String getArtCount(String cartCode) {
		return dao.getArtCount(cartCode);
	}

	@Override
	public String selectOption(String cartCode) {
		return dao.selectOption(cartCode);
	}

	@Override
	public String shopbagCount(String member) {
		return dao.shopbagCount(member);
	}

}
