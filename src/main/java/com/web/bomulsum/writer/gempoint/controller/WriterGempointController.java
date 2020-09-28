package com.web.bomulsum.writer.gempoint.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.writer.gempoint.service.WriterGempointService;
import com.web.bomulsum.writer.login.repository.WriterRegisterVO;


@Controller
@RequestMapping(value = "/writer")
public class WriterGempointController {
	
	@Autowired
	WriterGempointService service;
	
	//젬포인트 조회
	@GetMapping(value="/gempoint")
	public ModelAndView gempoint(HttpServletRequest request) {
		//작가seq 세션받아오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO)session.getAttribute("writer_login");
		String seq = code.getWriterSeq();
		System.out.println(seq);
		
		//젬포인트 이용내역
		List<Map<String, String>> list = service.getGemPoint(seq);
		ModelAndView mav = new ModelAndView("/waccount/gemPoint");
		mav.addObject("article", list);
		
		//젬포인트 보유포인트
		Map<String, Object> gemSum = service.getGemPointSum(seq);
		mav.addObject("gemsum", gemSum);
		
		//사이드에 젬포인트 반영
		
		  code.setGemSum(Integer.parseInt(String.valueOf(gemSum.get("GEMSUM"))));
		  System.out.println("사이드반영:"+code);
	 
		
		return mav;
	} 
	
	//젬포인트 충전
	@RequestMapping(value="/gempoint/charge")
	public ModelAndView gempointCharge(int chargeMoney, HttpServletRequest request) {
		//작가seq 세션받아오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO)session.getAttribute("writer_login");
		String seq = code.getWriterSeq();
		System.out.println(seq);
		
		Map<String, Object> gemMap = new HashMap<String, Object>();
		gemMap.put("writerCodeSeq", seq);
		
		//포인트 충전
		System.out.println("충전한 포인트 : " + chargeMoney);
		ModelAndView mav = new ModelAndView("redirect:/writer/gempoint.wdo");
		gemMap.put("chargeMoney", chargeMoney);
		service.insertGemPointCharge(gemMap);
		System.out.println("맵에 들어간 내용:" + chargeMoney);

		return mav;
	}

	
	
}
