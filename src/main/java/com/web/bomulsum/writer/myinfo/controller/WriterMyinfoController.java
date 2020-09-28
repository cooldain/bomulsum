package com.web.bomulsum.writer.myinfo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.writer.login.repository.WriterRegisterVO;
import com.web.bomulsum.writer.myinfo.repository.WriterMyinfoVO;
import com.web.bomulsum.writer.myinfo.service.WriterMyinfoService;

@Controller
@RequestMapping(value="/writer")
public class WriterMyinfoController {
	@Autowired
	WriterMyinfoService service;
	
	@RequestMapping(value="/myinfo")
	public ModelAndView writerMyinfo(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/waccount/myInformation");
		
		//작가seq 세션받아오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO)session.getAttribute("writer_login");
		String seq = code.getWriterSeq();
		System.out.println(seq);
		
		//내정보
		WriterMyinfoVO result = service.getWriterMyinfo(seq);
		System.out.println(result);
		mav.addObject("myinfo", result);
		
		//젬포인트
		Map<String, Object> pointSum = service.getGemPointSum2(seq);//젬포인트 보유포인트
		System.out.println("젬포인트:"+pointSum);
		mav.addObject("pointsum", pointSum);
		return mav;
	} 
	
	@RequestMapping(value="/insertphone")
	public ModelAndView insertPhone(HttpServletRequest request, String writerPhone) throws IOException {
		 
		//작가seq 세션받아오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO)session.getAttribute("writer_login");
		String seq = code.getWriterSeq();
		
		System.out.println("넘어온 폰번호:"+writerPhone);
		ModelAndView mav = new ModelAndView("redirect:/writer/myinfo.wdo");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("writerPhone", writerPhone);
		map.put("writerCodeSeq", seq);
		service.insertPhone(map);
		return mav;
	}
	@RequestMapping(value="/inserturl")
	public ModelAndView insertUrl(HttpServletRequest request, String writerUrl) {
		//작가seq 세션 받아오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO)session.getAttribute("writer_login");
		String seq = code.getWriterSeq();
		
		System.out.println("넘어온 url:" + writerUrl);
		ModelAndView mav = new ModelAndView("redirect:/writer/myinfo.wdo");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("writerUrl", writerUrl);
		map.put("writerCodeSeq", seq);

		service.insertUrl(map);
		return mav;
		
	}
	
}
