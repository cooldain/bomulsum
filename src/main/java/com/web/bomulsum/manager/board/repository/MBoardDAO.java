package com.web.bomulsum.manager.board.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//글 등록
	public void mboardRegister(MBoardVO vo) {
		sqlSessionTemplate.insert("mBoardDAO.insertMBoard", vo);
		sqlSessionTemplate.insert("mBoardDAO.insertAlarmMBoard", vo);
	}
	
	//게시판 글 목록 불러오기
	public List<MBoardListVO> mboardList(){
		return sqlSessionTemplate.selectList("mBoardDAO.selectMBoard");
	}
	
	//글 수정을 위한 데이터 불러와서 수정폼에 뿌려주기
	public MBoardVO mboardSelectOne(MBoardVO vo) {
		MBoardVO result = sqlSessionTemplate.selectOne("mBoardDAO.selectRewrite", vo);
		return result;
	}
	
	//글 수정 반영
	public void mboardUpdate(MBoardVO vo) {
		System.out.println("업데이트 입력될 데이터 : " + vo.toString());
		sqlSessionTemplate.update("mBoardDAO.updateMBoard", vo);
	}
	
	
	public void mboardDelete(MBoardVO vo) {
		System.out.println("삭제될 데이터 시퀀스 : "+ vo.getAdminNoticeSeq());
		sqlSessionTemplate.delete("mBoardDAO.deleteMBoard", vo);
	}
}
