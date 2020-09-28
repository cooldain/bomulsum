package com.web.bomulsum.writer.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.writer.order.repository.WriterOrderDAO;
import com.web.bomulsum.writer.order.repository.WriterOrderVO;

@Service
public class WriterorderServiceImpl implements WriterOrderService {

	@Autowired
	private WriterOrderDAO dao;
	
	@Override
	public List<WriterOrderVO> orderConditionList(String writerSeq) {
		return dao.orderConditionList(writerSeq);
	}
	//배송정보 등록을 위한 구매내역 조회
	@Override
	public List<WriterOrderVO> orderList(WriterOrderVO vo) {
		return dao.orderList(vo);
	}
	//배송정보 등록
	@Override
	public void orderDeliveryReg(WriterOrderVO vo) {
		dao.orderDeliveryReg(vo);
	}
	//환불 처리
	@Override
	public void orderRefundReg(WriterOrderVO vo) {
		dao.orderRefundReg(vo);
	}

	@Override
	public int getJumunOrderCount(WriterOrderVO vo) {
		return dao.getJumunOrderCount(vo);
	}
	@Override
	public int getBesongOrderCount(WriterOrderVO vo) {
		return dao.getBesongOrderCount(vo);
	}
	@Override
	public int getHwanbulOrderCount(WriterOrderVO vo) {
		return dao.getHwanbulOrderCount(vo);
	}
	@Override
	public int getHwanbulFinishOrderCount(WriterOrderVO vo) {
		return dao.getHwanbulFinishOrderCount(vo);
	}
	@Override
	public int getHwanbulNoOrderCount(WriterOrderVO vo) {
		return dao.getHwanbulNoOrderCount(vo);
	}
	

}
