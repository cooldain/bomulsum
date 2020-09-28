package com.web.bomulsum.manager.statistics.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.manager.statistics.repository.ManagerStatisticsDAO;
import com.web.bomulsum.manager.statistics.repository.MonthAverVO;

@Service
public class ManagerStatisticsServiceImpl implements ManagerStatisticsService {

	@Autowired
	private ManagerStatisticsDAO dao;
	
	@Override
	public int yearStatistics() {
		return dao.yearStatistics();
	}

	@Override
	public int gemTotal() {
		return dao.gemTotal();
	}

	@Override
	public List<MonthAverVO> getMonthAverage() {
		return dao.getMonthAverage();
	}

	@Override
	public int getSaleCount() {
		return dao.getSaleCount();
	}

	@Override
	public List<MonthAverVO> filterData(HashMap<String, String> map) {
		return dao.filterData(map);
	}

	@Override
	public int getCoupon() {
		return dao.getCoupon();
	}

	@Override
	public int getPoint() {
		return dao.getPoint();
	}

}
