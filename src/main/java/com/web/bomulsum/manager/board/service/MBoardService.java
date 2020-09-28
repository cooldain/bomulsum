package com.web.bomulsum.manager.board.service;

import java.util.List;

import com.web.bomulsum.manager.board.repository.MBoardListVO;
import com.web.bomulsum.manager.board.repository.MBoardVO;

public interface MBoardService {

	//게시판 글 등록
	void mboardRegister(MBoardVO vo);
	
	//게시판 목록 불러오기
	List<MBoardListVO> mboardList();
	
	//게시판 상세 내용 보기
	MBoardVO mboardSelect(MBoardVO vo);
	
	//게시판 글 수정
	void mboardUpdate(MBoardVO vo);
	
	//게시판 글 삭제
	void mboardDelete(MBoardVO vo);
	
}
