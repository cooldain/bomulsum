package com.web.bomulsum.writer.board.repository;

import java.util.List;




public interface writerBoardDAO {

	List<writerBoardVO> getAnnouncementBoard();
	
	writerBoardVO getAnnouncementArticle(String admin_notice_seq);


	//게시판 목록
	List<writerBoardVO> getPolicyGuideBoard();
	
	//게시판 내용
	writerBoardVO getPolicyGuideArticle(String admin_notice_seq);


	//게시판목록 getQuestionBoard
	List<writerBoardVO> getQuestionBoard();
	
	//게시판 내용 getQuestionArticle
	writerBoardVO getQuestionArticle(String admin_notice_seq);


}
