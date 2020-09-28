package com.web.bomulsum.writer.board.service;

import java.util.List;

import com.web.bomulsum.writer.board.repository.writerBoardVO;

public interface WriterBoardService {
   //작가 게시판 글 목록 검색
   List<writerBoardVO> getPolicyGuideBoard();
   
   //작가 글 상세
   writerBoardVO getPolicyGuideArticle(String admin_notice_seq);
   List<writerBoardVO> getQuestionBoard();
   
   writerBoardVO getQuestionArticle(String admin_notice_seq);
   
   List<writerBoardVO> getAnnouncementBoard();
   
   writerBoardVO getAnnouncementArticle(String admin_notice_seq);

}
