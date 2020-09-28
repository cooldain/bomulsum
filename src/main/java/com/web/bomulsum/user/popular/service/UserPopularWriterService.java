package com.web.bomulsum.user.popular.service;

import java.util.HashMap;
import java.util.List;

import com.web.bomulsum.user.popular.repository.UserPopularWriterVO;

public interface UserPopularWriterService {
	
	
	public List<UserPopularWriterVO> getWriterInfo();
	
	public List<String> getLikeWriter(HashMap<String, String> map);
	public List<String> getRankPhoto(String writerCode);
	public List<String> isLikeWriter(String member);
	
	public void likeWriter(HashMap<String, String> map);
	public void nonLikeWriter(HashMap<String, String> map);

}
