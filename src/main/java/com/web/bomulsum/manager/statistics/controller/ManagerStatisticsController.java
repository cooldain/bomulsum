package com.web.bomulsum.manager.statistics.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.manager.statistics.repository.MonthAverVO;
import com.web.bomulsum.manager.statistics.service.ManagerStatisticsService;

@Controller
@RequestMapping("/manager")
public class ManagerStatisticsController {
	
	@Autowired
	private ManagerStatisticsService service;
	
	@RequestMapping("/statistics")
	public ModelAndView statisticsPage(ModelAndView mav) {
		
		int yearTotal = service.yearStatistics();
		int gemTotal = service.gemTotal();
		int saleCount = service.getSaleCount();
		List<MonthAverVO> voList = service.getMonthAverage();
		String[] month = {"1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"};
		int[] monthCount = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
		for(MonthAverVO vo : voList) {
			switch(vo.getDate().split("-")[1]) {
			case "01" :
				monthCount[0] += vo.getAmount() * vo.getPrice();
				break;
			case "02" :
				monthCount[1] += vo.getAmount() * vo.getPrice();
				break;
			case "03" :
				monthCount[2] += vo.getAmount() * vo.getPrice();
				break;
			case "04" :
				monthCount[3] += vo.getAmount() * vo.getPrice();
				break;
			case "05" :
				monthCount[4] += vo.getAmount() * vo.getPrice();
				break;
			case "06" :
				monthCount[5] += vo.getAmount() * vo.getPrice();
				break;
			case "07" :
				monthCount[6] += vo.getAmount() * vo.getPrice();
				break;
			case "08" :
				monthCount[7] += vo.getAmount() * vo.getPrice();
				break;
			case "09" :
				monthCount[8] += vo.getAmount() * vo.getPrice();
				break;
			case "10" :
				monthCount[9] += vo.getAmount() * vo.getPrice();
				break;
			case "11" :
				monthCount[10] += vo.getAmount() * vo.getPrice();
				break;
			case "12" :
				monthCount[11] += vo.getAmount() * vo.getPrice();
				break;
				
			}
		}
		
		String lastMonth = voList.get(voList.size()-1).getDate().split("-")[1];
		
		mav.addObject("yearTotal",yearTotal);
		mav.addObject("gemTotal",gemTotal);
		mav.addObject("saleCount",saleCount);
		mav.addObject("month",Arrays.toString(month));
		mav.addObject("monthCount",Arrays.toString(monthCount));
		mav.addObject("lastMonth",lastMonth);
		mav.addObject("point", service.getPoint());
		mav.addObject("coupon", service.getCoupon());
		mav.setViewName("/mstatistics");
		
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/statistics/filt")
	public List<Integer> ajaxMethod(
			@RequestParam(value="filtDate") String filtDate, 
			@RequestParam(value="filtCategory") String filtCategory) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("filtCategory", filtCategory);
		map.put("filtDate", filtDate);
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
