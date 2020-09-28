package com.web.bomulsum.writer.order.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.writer.login.repository.WriterRegisterVO;
import com.web.bomulsum.writer.order.repository.WriterOrderVO;
import com.web.bomulsum.writer.order.service.WriterorderServiceImpl;

@Controller
@RequestMapping("/writer")
public class WriterOrderController {

	@Autowired
	private WriterorderServiceImpl service;
	
	@GetMapping("/order/condition")
	public ModelAndView orderCondition(HttpServletRequest request) {
		
		//로그인한 작가 정보 가져오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		String writerSeq = code.getWriterSeq();
		
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("orderConditionList", service.orderConditionList(writerSeq));
		mav.setViewName("/worder/orderCondition");
		
		return mav;
	}
	
	
	@GetMapping(value="/order/orderList")
	public ModelAndView orderList(HttpServletRequest request, @RequestParam(value="buyWriterOrderStatus") String status) {
		
		
		//로그인한 작가 정보 가져오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		String writerCodeSeq = code.getWriterSeq();
		
		ModelAndView mav = new ModelAndView();
		
		WriterOrderVO vo = new WriterOrderVO();
		vo.setWriterCodeSeq(writerCodeSeq);
		vo.setBuyWriterOrderStatus(status);
		
		int orderCount[] = new int[4];
		orderCount[0] = service.getJumunOrderCount(vo);
		orderCount[1] = service.getBesongOrderCount(vo);
		orderCount[2] = service.getHwanbulOrderCount(vo);
		orderCount[3] = service.getHwanbulFinishOrderCount(vo);
		//orderCount[4] = service.getHwanbulNoOrderCount(vo);
		
		
		mav.addObject("orderCount", orderCount);
		mav.addObject("totalOrderList", service.orderList(vo));
		mav.setViewName("/worder/orderList");
		return mav;
	}
	
	@RequestMapping(value="/order/orderDeliveryReg", method= {RequestMethod.POST})
	public ModelAndView orderDeliveryReg(HttpServletRequest request, WriterOrderVO vo) {

		//로그인한 작가 정보 가져오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		String writerCodeSeq = code.getWriterSeq();
		vo.setWriterCodeSeq(writerCodeSeq);
		
		//배송정보 등록
		service.orderDeliveryReg(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/writer/order/orderList.wdo?buyWriterOrderStatus="+vo.getBuyWriterOrderStatus());
		
		return mav;
	}
	
	//환불 처리
	@RequestMapping(value="/order/orderRefundReg", method= {RequestMethod.POST})
	public ModelAndView orderRefundReg(HttpServletRequest request, WriterOrderVO vo) throws UnsupportedEncodingException {
		//로그인한 작가 정보 가져오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		String writerCodeSeq = code.getWriterSeq();
		vo.setWriterCodeSeq(writerCodeSeq);
		
		//옵션별 판매된 수량들 합치기
		int artOptionCount = 0;
		//판매된 수량 계산해서 넣어줘야 됨
		String[] artSaleCount = vo.getArtOptionAmount().split(",");
		
		for(int i=0; i<artSaleCount.length; i++) {
			System.out.println("artSaleCount[i] : " + artSaleCount[i]);
			artOptionCount += Integer.parseInt(artSaleCount[i]);
			System.out.println("artOptionCount : " + artOptionCount);
		}
		
		// 환불 할 작품의 현재 판매수량에서 판매된 옵션별 수량들 만큼 다시 빼줘야 한다.
		System.out.println("현재 작품의 판매 수량 : " + vo.getArtSaleCount());
		int saleArtCount = vo.getArtSaleCount() - artOptionCount;
		System.out.println("수정되서 들어갈 작품의 판매 수량 : " + saleArtCount);
		vo.setArtSaleCount(saleArtCount);
		
		vo.setArtAmount(artOptionCount + vo.getArtAmount());// 작품 수량 은 판매수량 빠졌던 만큼(옵션별 수량-artOptionAmount) 다시 + 시켜주기
		
		System.out.println(vo.getArtSaleCount());
		String category = vo.getBuyWriterOrderStatus();
		category = URLEncoder.encode(category, "UTF-8");

		service.orderRefundReg(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/writer/order/orderList.wdo?buyWriterOrderStatus=" + category);
		return mav;
	}

	
	@GetMapping("/order/registerOfShip")
	public String orderShip() {
		return "/worder/registerOfShip";
	}
	
}
