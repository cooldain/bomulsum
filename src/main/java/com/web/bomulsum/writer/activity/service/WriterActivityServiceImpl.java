package com.web.bomulsum.writer.activity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.manager.board.repository.MBoardVO;
import com.web.bomulsum.writer.activity.repository.AlarmVO;
import com.web.bomulsum.writer.activity.repository.WriterActivityDAO;
import com.web.bomulsum.writer.activity.repository.WriterActivityVO;
import com.web.bomulsum.writer.activity.repository.CommentsListVO;

@Service
public class WriterActivityServiceImpl implements WriterActivityService {

	@Autowired
	private WriterActivityDAO dao;
	
	@Override
	public List<CommentsListVO> commentsList(String seq) {
		System.out.println("서비스임플 :" + seq);
		return dao.commentsList(seq);
	}

	@Override
	public void addRecomment(CommentsListVO vo, AlarmVO avo) {
		dao.addRecomment(vo, avo);
	}

	@Override
	public List<AlarmVO> alarmList(String seq) {
		return dao.alarmList(seq);
	}

	@Override
	public List<WriterActivityVO> reviewList(String seq) {
		return dao.reviewList(seq);
	}

	@Override
	public void updateReviewComment(WriterActivityVO vo) {
		dao.updateReviewComment(vo);;
	}
}
