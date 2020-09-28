package com.web.bomulsum.manager.statistics.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.web.bomulsum.manager.statistics.repository.MonthAverVO;

@Service
public interface ManagerStatisticsService {
	
	int yearStatistics();
	int gemTotal();
	List<MonthAverVO> getMonthAverage();
	int getSaleCount();
	List<MonthAverVO> filterData(HashMap<String, String> map);
	int getCoupon();
	int getPoint();
}
