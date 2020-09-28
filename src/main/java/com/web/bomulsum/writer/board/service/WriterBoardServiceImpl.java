package com.web.bomulsum.writer.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.writer.board.repository.writerBoardDAO;
import com.web.bomulsum.writer.board.repository.writerBoardVO;

@Service
public class WriterBoardServiceImpl implements WriterBoardService{
   @Autowired
   writerBoardDAO dao;
   

   @Override
   public List<writerBoardVO> getPolicyGuideBoard() {
      List<writerBoardVO> list = dao.getPolicyGuideBoard();
      return list;
   }


   @Override
   public List<writerBoardVO> getQuestionBoard() {
      List<writerBoardVO> list = dao.getQuestionBoard();
      return list;
   }

   @Override
   public writerBoardVO getQuestionArticle(String admin_notice_seq) {
      return dao.getQuestionArticle(admin_notice_seq);
   }




   @Override
   public writerBoardVO getPolicyGuideArticle(String admin_notice_seq) {
      return dao.getPolicyGuideArticle(admin_notice_seq);
   }


   @Override
   public List<writerBoardVO> getAnnouncementBoard() {
      return dao.getAnnouncementBoard();
   }


   @Override
   public writerBoardVO getAnnouncementArticle(String admin_notice_seq) {
      return dao.getAnnouncementArticle(admin_notice_seq);
   }
}
