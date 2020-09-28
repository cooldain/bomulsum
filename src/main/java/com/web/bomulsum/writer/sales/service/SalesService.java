package com.web.bomulsum.writer.sales.service;

import java.util.HashMap;
import java.util.List;

import com.web.bomulsum.manager.statistics.repository.MonthAverVO;

public interface SalesService {
	List<MonthAverVO> filterData(HashMap<String, String> map);
	int yearTotal(String writer);
	public int getSaleCount(String writer);
	int likeArt(String writer);
	int likeWriter(String writer);
}
