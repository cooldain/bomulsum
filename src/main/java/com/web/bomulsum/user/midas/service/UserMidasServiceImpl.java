package com.web.bomulsum.user.midas.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.midas.repository.UserMidasDAO;
import com.web.bomulsum.user.midas.repository.UserMidasPagingVO;
import com.web.bomulsum.user.midas.repository.UserMidasVO;

@Service
public class UserMidasServiceImpl implements UserMidasService {

	@Autowired
	UserMidasDAO dao;
	
	@Override
	public List<UserMidasVO> midasCategoryList(UserMidasPagingVO vo) {
		return dao.midasCategoryList(vo);
	}

	@Override
	public int getCategoryMidasCount(UserMidasPagingVO vo) {
		return dao.getCategoryMidasCount(vo.getCategory());
	}

	@Override
	public List<UserMidasVO> midasLocationList(UserMidasPagingVO vo) {
		return dao.midasLocationList(vo);
	}

	@Override
	public int getLocationMidasCount(UserMidasPagingVO vo) {
		return dao.getLocationMidasCount(vo.getLocation());
	}

	@Override
	public List<UserMidasVO> midasNewList(UserMidasPagingVO vo) {
		return dao.midasNewList(vo);
	}

	@Override
	public int getAllMidasCount(UserMidasPagingVO vo) {
		return dao.getAllMidasCount();
	}

	
	@Override
	public void likeClass(HashMap<String, String> map) {
		dao.likeClass(map);
	}

	@Override
	public void nonLikeClass(HashMap<String, String> map) {
		dao.nonLikeClass(map);	
	}

	@Override
	public List<String> getLikeClass(String member) {
		return dao.getLikeClass(member);
	}

	@Override
	public List<UserMidasVO> midasPopularList(UserMidasPagingVO vo) {
		return dao.midasPopularList(vo);
	}


}
