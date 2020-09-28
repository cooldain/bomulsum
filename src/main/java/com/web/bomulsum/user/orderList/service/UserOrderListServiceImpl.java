package com.web.bomulsum.user.orderList.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.orderList.repository.OrderListDataVO;
import com.web.bomulsum.user.orderList.repository.UserBuyArtVO;
import com.web.bomulsum.user.orderList.repository.UserBuyOptionVO;
import com.web.bomulsum.user.orderList.repository.UserBuyWriterVO;
import com.web.bomulsum.user.orderList.repository.UserOrderListDao;
import com.web.bomulsum.user.orderList.repository.UserOrderTableVO;

@Service
public class UserOrderListServiceImpl implements UserOrderListService {
	
	@Autowired
	private UserOrderListDao dao;

	@Override
	public List<OrderListDataVO> getOrderTb(String member) {// 모든 주문내역 테이블 조회
		List<OrderListDataVO> data = new ArrayList<OrderListDataVO>();
		
		List<UserOrderTableVO> forData = new ArrayList<UserOrderTableVO>();
		List<UserOrderTableVO> imsiData = dao.getOrderTb(member);
		for(UserOrderTableVO imsi : imsiData) {
			for(UserOrderTableVO imsi2 : imsiData) {
				if(!imsi.getOrderCodeSeq().equals(imsi2.getOrderCodeSeq())) {
					forData.add(imsi);
					break;
				}else {
					continue;
				}
			}
		}
		for(int i=0; i<forData.size(); i++) {
			System.out.println(i);
			OrderListDataVO vo = new OrderListDataVO();
			vo.setOrderTable(forData.get(i));
			
			String orderCode = vo.getOrderTable().getOrderCodeSeq();
			List<UserBuyWriterVO> writeVO  = dao.getWriterTb(orderCode);
			List<UserBuyWriterVO> imsiwriter = new ArrayList<UserBuyWriterVO>();
			for(UserBuyWriterVO dd : writeVO) {
				if(dd.getBuyWriterOrderStatus().equals("결제 완료") || dd.getBuyWriterOrderStatus().equals("배송 완료")) {
					imsiwriter.add(dd);
				}
			}
			vo.setBuyWriter(imsiwriter);
			
			List<UserBuyArtVO> volist = new ArrayList<UserBuyArtVO>();
			List<UserBuyArtVO> imsiList = dao.getBuyArtTb(orderCode);
			if(imsiList != null) {
				for(int j=0; j<imsiList.size(); j++) {
					if(imsiList.get(j).getArtPhoto().length() > 1) {
						String[] imsi = imsiList.get(j).getArtPhoto().split(",");
						imsiList.get(j).setArtPhoto(imsi[0]);
					}
					volist.add(imsiList.get(j));
				}
			}
			
			vo.setBuyArt(volist);
			vo.setBuyOption(dao.getBuyOptionTb(orderCode));
			
			data.add(vo);
		}
		
		
		return data;
	}

	@Override
	public OrderListDataVO getOrderDetail(String code) {
		
		OrderListDataVO vo = new OrderListDataVO();
		
		vo.setOrderTable(dao.getorderDetail(code));
		
		vo.setBuyWriter(dao.getWriterTb(code));
		
		List<UserBuyArtVO> volist = new ArrayList<UserBuyArtVO>();
		List<UserBuyArtVO> imsiList = dao.getBuyArtTb(code);
		if(imsiList != null) {
			for(int j=0; j<imsiList.size(); j++) {
				if(imsiList.get(j).getArtPhoto().length() > 1) {
					String[] imsi = imsiList.get(j).getArtPhoto().split(",");
					imsiList.get(j).setArtPhoto(imsi[0]);
				}
				volist.add(imsiList.get(j));
			}
		}
		
		vo.setBuyArt(volist);
		vo.setBuyOption(dao.getBuyOptionTb(code));
		
		return vo;
	}

	@Override
	public int getCouponPrice(String coupon) {
		return dao.getCouponPrice(coupon);
	}

	@Override
	public int getPointPrice(String artCode) {
		return dao.getPointPrice(artCode);
	}

	@Override
	public UserOrderTableVO recentOne(String memberCode) {
		return dao.recentOne(memberCode);
	}

	@Override
	public List<String> getOrderStatusList(String memberCode) {
		return dao.getOrderStatusList(memberCode);
	}

	@Override
	public String getOrderCode(String code) {
		return dao.getOrderCode(code);
	}

	@Override
	public void requestRefund(HashMap<String, String> map) {
		dao.requestRefund(map);
	}

	@Override
	public List<HashMap<String, String>> refundListCodes(String member) {
		return dao.refundListCodes(member);
	}

	@Override
	public List<OrderListDataVO> getRefundList(List<HashMap<String, String>> map) {
		
		List<OrderListDataVO> data = new ArrayList<OrderListDataVO>();
		
		for(HashMap<String, String> i : map) {
			OrderListDataVO vo = new OrderListDataVO();
			
			String code = i.get("order"); // 주문 내역 테이블 코드
			String writer = i.get("writer"); // 작가 구매 테이블 코드
			
			UserOrderTableVO orderTb = dao.getorderDetail(code);
			List<UserBuyWriterVO> writerTb = dao.refundWriterList(writer);
			
			List<UserBuyArtVO> artTb = new ArrayList<UserBuyArtVO>();
			List<UserBuyArtVO> imsiList = dao.refundArtList(i);
			List<UserBuyOptionVO> optionTb = new ArrayList<UserBuyOptionVO>();
			if(imsiList != null) {
				for(int j=0; j<imsiList.size(); j++) {
					if(imsiList.get(j).getArtPhoto().length() > 1) {
						String[] imsi = imsiList.get(j).getArtPhoto().split(",");
						imsiList.get(j).setArtPhoto(imsi[0]);
					}
					HashMap<String, String> imsiMap = new HashMap<String, String>();
					imsiMap.put("art", imsiList.get(j).getBuyArtCodeSeq());
					imsiMap.put("order", code);
					List<UserBuyOptionVO> imsiOption = dao.refundOptionList(imsiMap);
					if(imsiOption.size()>0) {
						for(UserBuyOptionVO v : imsiOption) {
							optionTb.add(v);
						}
					}
					artTb.add(imsiList.get(j));
				}
			}
			vo.setOrderTable(orderTb);
			vo.setBuyWriter(writerTb);
			vo.setBuyArt(artTb);
			vo.setBuyOption(optionTb);
			data.add(vo);
			System.out.println(vo.toString());
		}
		return data;
	}

	@Override
	public OrderListDataVO ajaxRefundDetail(String code) {
		OrderListDataVO vo = new OrderListDataVO();
		
		List<UserBuyWriterVO> writerVo = dao.refundWriterList(code);
		List<UserBuyArtVO> artVo = new ArrayList<UserBuyArtVO>();
		List<UserBuyOptionVO> optionVo = new ArrayList<UserBuyOptionVO>();
		
		HashMap<String, String> map = new HashMap<String, String>();
		String orderCode = null;
		for(UserBuyWriterVO v : writerVo) {
			orderCode = v.getOrderCodeSeq();
			map.put("order", orderCode);
			map.put("writer", code);			
		}
		
		List<UserBuyArtVO> imsiList = dao.refundArtList(map);
		for(int j=0; j<imsiList.size(); j++) {
			if(imsiList.get(j).getArtPhoto().length() > 1) {
				String[] imsi = imsiList.get(j).getArtPhoto().split(",");
				imsiList.get(j).setArtPhoto(imsi[0]);
			}
			HashMap<String, String> imsiMap = new HashMap<String, String>();
			imsiMap.put("art", imsiList.get(j).getBuyArtCodeSeq());
			imsiMap.put("order", orderCode);
			List<UserBuyOptionVO> imsiOption = dao.refundOptionList(imsiMap);
			if(imsiOption.size()>0) {
				for(UserBuyOptionVO v : imsiOption) {
					optionVo.add(v);
				}
			}
			artVo.add(imsiList.get(j));
		}
		
		vo.setBuyWriter(writerVo);
		vo.setBuyArt(artVo);
		vo.setBuyOption(optionVo);
		
		return vo;
	}
	
	
	
}
