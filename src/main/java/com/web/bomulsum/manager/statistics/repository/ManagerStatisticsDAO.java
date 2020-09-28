package com.web.bomulsum.manager.statistics.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerStatisticsDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int yearStatistics() {
		return template.selectOne("managerStatistics.yearStatistics");
	}
	
	public List<MonthAverVO> getMonthAverage(){
		return template.selectList("managerStatistics.getMonthAverage");
	}
	
	public int getSaleCount() {
		return template.selectOne("managerStatistics.getSaleCount");
	}
	
	public int gemTotal() {
		return template.selectOne("managerStatistics.gemTotal");
	}
	
	public List<MonthAverVO> filterData(HashMap<String, String> map){
		return template.selectList("managerStatistics.filterData", map);
	}
	
	public int getCoupon() {
		return template.selectOne("managerStatistics.getCoupon");
	}
	
	public int getPoint() {
		return template.selectOne("managerStatistics.getPoint");
	}
}
