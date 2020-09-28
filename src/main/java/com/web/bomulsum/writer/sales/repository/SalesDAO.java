package com.web.bomulsum.writer.sales.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.bomulsum.manager.statistics.repository.MonthAverVO;

@Repository
public class SalesDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public List<MonthAverVO> filterData(HashMap<String, String> map){
		return template.selectList("salesDao.filterData", map);
	}
	
	public int yearTotal(String writer) {
		return template.selectOne("salesDao.yearTotal", writer);
	}
	
	public int getSaleCount(String writer) {
		return template.selectOne("salesDao.getSaleCount", writer);
	}
	
	public int likeArt(String writer) {
		return template.selectOne("salesDao.likeArt", writer);
	}
	
	public int likeWriter(String writer) {
		return template.selectOne("salesDao.likeWriter", writer);
	}
	
}
