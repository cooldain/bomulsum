package com.web.bomulsum.writer.activity.service;

import java.util.List;

import com.web.bomulsum.writer.activity.repository.AlarmVO;
import com.web.bomulsum.writer.activity.repository.CommentsListVO;
import com.web.bomulsum.writer.activity.repository.WriterActivityVO;


public interface WriterActivityService {

	List<CommentsListVO> commentsList(String seq);
	
	//댓글 등록
	void addRecomment(CommentsListVO vo, AlarmVO avo);
	
	List<AlarmVO> alarmList(String seq);
	
	List<WriterActivityVO> reviewList(String seq);

	void updateReviewComment(WriterActivityVO vo);
}
