package com.web.bomulsum.writer.sales.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.manager.statistics.repository.MonthAverVO;
import com.web.bomulsum.writer.sales.repository.SalesDAO;

@Service
public class SalesServiceImpl implements SalesService {
	
	@Autowired
	private SalesDAO dao;

	@Override
	public List<MonthAverVO> filterData(HashMap<String, String> map) {
		return dao.filterData(map);
	}

	@Override
	public int getSaleCount(String writer) {
		return dao.getSaleCount(writer);
	}

	@Override
	public int likeArt(String writer) {
		return dao.likeArt(writer);
	}

	@Override
	public int likeWriter(String writer) {
		return dao.likeWriter(writer);
	}

	@Override
	public int yearTotal(String writer) {
		return dao.yearTotal(writer);
	}
	
}
