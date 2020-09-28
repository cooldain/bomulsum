package com.web.bomulsum.writer.order.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WriterOrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<WriterOrderVO> orderConditionList(String writerSeq){
		return sqlSessionTemplate.selectList("writerOrderDAO.selectOrderConditionList", writerSeq);
	}
	// 배송정보 입력을 위한 구매내역 조회
	public List<WriterOrderVO> orderList(WriterOrderVO vo){
		return sqlSessionTemplate.selectList("writerOrderDAO.selectOrderList", vo);
	}
	// 배송정보 등록
	public void orderDeliveryReg(WriterOrderVO vo) {
		sqlSessionTemplate.update("writerOrderDAO.orderDeliveryReg", vo);
		sqlSessionTemplate.insert("writerOrderDAO.insertAlarmMBoard", vo);
	}
	// 알람 등록

	// 환불 처리
	public void orderRefundReg(WriterOrderVO vo) {
		sqlSessionTemplate.update("writerOrderDAO.orderRefundBuyWriterTb", vo);
		sqlSessionTemplate.update("writerOrderDAO.orderRefundArtTb",vo);
	}
	
	
	// 주문 완료 수
	public int getJumunOrderCount(WriterOrderVO vo) {
		return sqlSessionTemplate.selectOne("writerOrderDAO.jumunOrderCount", vo);
	}
	// 배송 완료 수
	public int getBesongOrderCount(WriterOrderVO vo) {
		return sqlSessionTemplate.selectOne("writerOrderDAO.besongOrderCount", vo);
	}
	// 환분 요청 수
	public int getHwanbulOrderCount(WriterOrderVO vo) {
		return sqlSessionTemplate.selectOne("writerOrderDAO.hwanbulOrderCount", vo);
	}
	// 환불 완료 수
	public int getHwanbulFinishOrderCount(WriterOrderVO vo) {
		return sqlSessionTemplate.selectOne("writerOrderDAO.hwanbulFinishOrderCount", vo);
	}
	// 환불 거부 수
	public int getHwanbulNoOrderCount(WriterOrderVO vo) {
		return sqlSessionTemplate.selectOne("writerOrderDAO.hwanbulNoOrderCount", vo);
	}
	
}
