package com.web.bomulsum.writer.sales.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.manager.statistics.repository.MonthAverVO;
import com.web.bomulsum.writer.login.repository.WriterRegisterVO;
import com.web.bomulsum.writer.sales.service.SalesService;

@Controller
@RequestMapping(value="/writer")
public class SalesController {
	
	@Autowired
	private SalesService service;
	
	@GetMapping("/sales")
	public ModelAndView sales(HttpSession session, ModelAndView mav) {
		
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		String seq = code.getWriterSeq();
		System.out.println(seq);
		
		int saleCount = service.getSaleCount(seq);
		int likeArt = service.likeArt(seq);
		int likeWriter = service.likeWriter(seq);
		int yearTotal = service.yearTotal(seq);
		
		mav.addObject("saleCount",saleCount);
		mav.addObject("likeArt",likeArt);
		mav.addObject("likeWriter",likeWriter);
		mav.addObject("yearTotal",yearTotal);
		
		mav.setViewName("/wstats/sales");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/sales/filt")
	public List<Integer> filt(@RequestParam(value="filtDate") String filtDate, HttpSession session){
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("filtDate", filtDate);
		map.put("writer", code.getWriterSeq());
		List<MonthAverVO> voList = service.filterData(map);
		List<Integer> monthData = new ArrayList<Integer>();
		
		if(filtDate.equals("월별")) {
			
			for(int i=0; i<12; i++) {
				monthData.add(0);
			}
			
			for(int i=0; i<voList.size(); i++) {
				MonthAverVO vo = voList.get(i);
				int tempPrice = vo.getAmount() * vo.getPrice();
				int dateForm = Integer.parseInt(vo.getDate().split("-")[1]);
				Integer monthAmount = monthData.get(dateForm-1);
				monthAmount += tempPrice;
				monthData.set(dateForm-1, monthAmount);
			}
		}else { // 일별
			
			
			for(int i=1; i<32; i++) {
				monthData.add(0);
			}
			
			for(int i=0; i<voList.size(); i++) {
				MonthAverVO vo = voList.get(i);
				int tempPrice = vo.getAmount() * vo.getPrice();
				int dateForm = Integer.parseInt(vo.getDate().split("-")[2]);
				Integer monthAmount = monthData.get(dateForm-1);
				monthAmount += tempPrice;
				monthData.set(dateForm-1, monthAmount);
			}
		}
		
		return monthData;
	}
}
