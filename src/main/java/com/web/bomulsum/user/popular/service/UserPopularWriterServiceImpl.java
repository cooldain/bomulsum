package com.web.bomulsum.user.popular.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.popular.repository.UserPopularWriterDAO;
import com.web.bomulsum.user.popular.repository.UserPopularWriterVO;

@Service
public class UserPopularWriterServiceImpl implements UserPopularWriterService{
	
	
	 @Autowired
	 UserPopularWriterDAO dao;

	@Override
	public List<UserPopularWriterVO> getWriterInfo() {
		return dao.getWriterInfo();
	}


	@Override
	public List<String> getRankPhoto(String writerCode) {
		return dao.getRankPhoto(writerCode);

	}

	@Override
	public void likeWriter(HashMap<String, String> map) {
		dao.likeWriter(map);
		
	}

	@Override
	public void nonLikeWriter(HashMap<String, String> map) {
		dao.nonLikeWriter(map);
		
	}

	@Override
	public List<String> getLikeWriter(HashMap<String, String> map) {
		return dao.getLikeWriter(map);
	}


	@Override
	public List<String> isLikeWriter(String member) {
		return dao.isLikeWriter(member);
	}



}
