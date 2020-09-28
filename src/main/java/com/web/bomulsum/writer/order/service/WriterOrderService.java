package com.web.bomulsum.writer.order.service;

import java.util.List;

import com.web.bomulsum.writer.order.repository.WriterOrderVO;

public interface WriterOrderService {

	List<WriterOrderVO> orderConditionList(String writerCodeSeq);
	List<WriterOrderVO> orderList(WriterOrderVO vo);
	//배송 정보 등록
	void orderDeliveryReg(WriterOrderVO vo);
	//환불 처리
	void orderRefundReg(WriterOrderVO vo);
	// 주문 완료 수
	int getJumunOrderCount(WriterOrderVO vo);
	// 배송 완료 수
	int getBesongOrderCount(WriterOrderVO vo);
	// 환분 요청 수
	int getHwanbulOrderCount(WriterOrderVO vo);
	// 환불 완료 수
	int getHwanbulFinishOrderCount(WriterOrderVO vo);
	// 환불 거부 수
	int getHwanbulNoOrderCount(WriterOrderVO vo);
}
