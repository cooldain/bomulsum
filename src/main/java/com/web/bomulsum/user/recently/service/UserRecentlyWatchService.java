package com.web.bomulsum.user.recently.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.bomulsum.user.recently.repository.UserRecentylWatchVo;

@Service
public interface UserRecentlyWatchService {
	// 멤버코드 기준 작품 코드 끌어오기
	List<UserRecentylWatchVo> getArticleCode(String member);
}
