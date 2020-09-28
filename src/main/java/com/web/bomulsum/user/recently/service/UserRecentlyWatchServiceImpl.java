package com.web.bomulsum.user.recently.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.recently.repository.UserRecentlyWatchDao;
import com.web.bomulsum.user.recently.repository.UserRecentylWatchReviewVo;
import com.web.bomulsum.user.recently.repository.UserRecentylWatchVo;

@Service
public class UserRecentlyWatchServiceImpl implements UserRecentlyWatchService {
	
	@Autowired
	UserRecentlyWatchDao dao;

	@Override
	public List<UserRecentylWatchVo> getArticleCode(String member) { // 멤버코드 기준 작품 코드 끌어오기
		List<String> list = dao.getArticleCode(member);
		List<UserRecentylWatchVo> voList = new ArrayList<UserRecentylWatchVo>();
		for(String s : list) {
			UserRecentylWatchVo infoVo =  dao.getArtileInfo(s);
			if(infoVo == null) {
				continue;
			}
			if(infoVo.getWriterBrandName() == null) {
				infoVo.setWriterName(infoVo.getWriterName());
			}else {
				infoVo.setWriterName(infoVo.getWriterBrandName());
			}
			String[] imsi = infoVo.getArtImg().split(",");
			infoVo.setArtImg(imsi[0]);
			float per = ((infoVo.getArtPrice() - infoVo.getArtDiscount()) / (float)infoVo.getArtPrice()) * 100;
			infoVo.setArtPercent(Math.round(per));
			List<UserRecentylWatchReviewVo> reviewVo = dao.getArticleReview(s);
			
			int reviewCnt = reviewVo.size();
			int reviewStar = 0;
			String reviewContent = "";
			if(reviewCnt > 0) {
				for(int i = 0; i<reviewCnt; i++) {
					reviewStar += reviewVo.get(i).getReviewStar();
					if(i == 0) {
						reviewContent = reviewVo.get(i).getReviewComment();
					}
				}
			}
			
			reviewStar = Math.round(reviewStar / (float)reviewCnt);
			
			infoVo.setReviewCnt(reviewCnt);
			infoVo.setReviewValue(reviewStar);
			infoVo.setRecentlyReviewContent(reviewContent);
			
			voList.add(infoVo);
		}
		return voList;
	}
	
}
