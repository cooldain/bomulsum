package com.web.bomulsum.user.midas.service;

import java.util.HashMap;
import java.util.List;

import com.web.bomulsum.user.midas.repository.UserMidasPagingVO;
import com.web.bomulsum.user.midas.repository.UserMidasVO;

public interface UserMidasService {

	//카테고리 리스트 불러오기
	List<UserMidasVO> midasCategoryList(UserMidasPagingVO vo);
	int getCategoryMidasCount(UserMidasPagingVO vo);
	
	//지역별 리스트 불러오기
	List<UserMidasVO> midasLocationList(UserMidasPagingVO vo);
	int getLocationMidasCount(UserMidasPagingVO vo);
	
	//신규 리스트 불러오기
	List<UserMidasVO> midasNewList(UserMidasPagingVO vo);
	int getAllMidasCount(UserMidasPagingVO vo);
	
	//인기 리스트 불러오기
	List<UserMidasVO> midasPopularList(UserMidasPagingVO vo);
	
	//즐겨찾기 추가
	void likeClass(HashMap<String, String> map);
	void nonLikeClass(HashMap<String, String> map);
	List<String> getLikeClass(String member);
}
