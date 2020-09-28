package com.web.bomulsum.writer.activity.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class WriterActivityDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//댓글 목록 불러오기
	public List<CommentsListVO> commentsList(String seq){
		System.out.println("다오 :" + seq);
		return sqlSessionTemplate.selectList("writerActivityDAO.selectComment", seq);
	}
	
	//댓글 등록
	public void addRecomment(CommentsListVO vo, AlarmVO avo) {
		System.out.println("코멘트vo : " + vo.toString());
		System.out.println("알람vo : " + avo.toString());
		avo.setAlarmTitle("댓글");
		avo.setRecipientCode((String)vo.getMember_code_seq());
		avo.setAlarmContent((String)vo.getComment_recomment());
		System.out.println("형변환후 :" + avo.toString());
		avo.setWriterSeq((String)vo.getWriter_code_seq());
		String check = vo.getComment_status();
		System.out.println(vo.getComment_status());
		if(check.equals("N")) {
			sqlSessionTemplate.insert("writerActivityDAO.addAlarm", avo);			
		}
		sqlSessionTemplate.update("writerActivityDAO.addRecomment", vo);
	}
	
	//알람 목록 불러오기
	public List<AlarmVO> alarmList(String seq){
		System.out.println("다오 :" + seq);
		return sqlSessionTemplate.selectList("writerActivityDAO.selectAlarmList", seq);
	}
	
	public List<WriterActivityVO> reviewList(String seq){
		return sqlSessionTemplate.selectList("writerActivityDAO.selectReviewList", seq);
	}
	
	//후기 답글 등록
	public void updateReviewComment(WriterActivityVO vo) {
		String check = vo.getReviewCommentReStatus();
		if(check.equals("N")) {
			vo.setAlarmContent(vo.getReviewCommentRe());
			sqlSessionTemplate.insert("writerActivityDAO.insertAlarmMBoard", vo);
		}
		sqlSessionTemplate.update("writerActivityDAO.updateReviewComment", vo);
	}
}
