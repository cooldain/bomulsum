package com.web.bomulsum.writer.art.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.web.bomulsum.common.PageVO;
import com.web.bomulsum.common.SearchVO;
import com.web.bomulsum.writer.art.repository.WriterArtInfoDetailVO;
import com.web.bomulsum.writer.art.repository.WriterArtOptionVO;
import com.web.bomulsum.writer.art.repository.WriterArtVO;

public interface WriterArtService {

	//작품 등록
	void insertArt(WriterArtVO vo);
	
	//작품 코드 검색
	String getArtCode(WriterArtVO vo);
	
	//작품정보제공등록
	void insertArtInfoDetail(WriterArtInfoDetailVO vo);

	//작품 옵션 등록
	void insertArtOption1(Map<String, Object> map);
	void insertArtOption2(Map<String, Object> map);
	void insertArtOption3(Map<String, Object> map);
	void insertArtOption4(Map<String, Object> map);
	void insertArtOption5(Map<String, Object> map);
	void insertArtOption6(Map<String, Object> map);
	void insertArtOption7(Map<String, Object> map);
	void insertArtOption8(Map<String, Object> map);
	void insertArtOption9(Map<String, Object> map);
	
	//판매중 작품 목록
	List<WriterArtVO> getArtOnsaleList(String seq);
	//판매 일시중지 작품 목록
	List<WriterArtVO> getArtPauseOnsale(String seq);
	//댓글 카운트
	int getArtSaleComment(String artCode);
	//후기 카운트
	int getArtSaleReview(String artCode);
	//즐겨찾기 카운트
	int getArtSaleBookmark(String artCode);
	
	
	//판매일시 중지로 바꾸기
	void changePauseSalesArt(String[] checkArr);
	//판매중으로 바꾸기
	void changeStartSalesArt(String[] checkArr);
	
	//작품 삭제
	void deleteArt(String[] deleteCheck);

	
	
	//작품 수정 목록
	List<WriterArtVO> getUpdateArt(String artCode);
	List<WriterArtInfoDetailVO> getUpdateArtInfo(String artCode);
	List<WriterArtOptionVO> getUpdateArtOption(String artCode);
	
	//작품 수정
	void updateArt(WriterArtVO vo);
	void updateArtInfoDetail(WriterArtInfoDetailVO vo);
	//작품 옵션 수정
	void updateArtOption1(Map<String, Object> map);
	void updateArtOption2(Map<String, Object> map);
	void updateArtOption3(Map<String, Object> map);
	void updateArtOption4(Map<String, Object> map);
	void updateArtOption5(Map<String, Object> map);
	void updateArtOption6(Map<String, Object> map);
	void updateArtOption7(Map<String, Object> map);
	void updateArtOption8(Map<String, Object> map);
	void updateArtOption9(Map<String, Object> map);
	
	//원희 수정
	List<WriterArtVO> getRecommendSelect(SearchVO vo);
	int getArtCount(PageVO vo);
	void getTempUpdate(String artCodeSeq);
	List<WriterArtVO> getRecommendSelectTemp(WriterArtVO vo);
	void getTempUpdateN(String artCodeSeq);
	int checkArtList(String writerCodeSeq);
	public void recommendUp(String writerCodeSeq);
	public void getTempUpdateReN(String writerCodeSeq);
	
	
	// 우영 수정
	public List<Integer> getGemSum(String writerCode);
	public void insertGem(HashMap<String, Object> map);
}
