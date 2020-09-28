package com.web.bomulsum.manager.manage.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerManageDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	

	//작품정보
	public List<ManagerManageArtVO> getArtList() {
		List<ManagerManageArtVO> artInfo = sqlSessionTemplate.selectList("managerManageDAO.selectArt");
		return artInfo;
	}
	
	//클래스 정보
	public List<ManagerManageClassVO> getClassList() {
		List<ManagerManageClassVO> classInfo = sqlSessionTemplate.selectList("managerManageDAO.selectClass");
		return classInfo;
	}
	//작품 삭제
	public void deleteArt(HashMap<String, String> map) {
		sqlSessionTemplate.delete("managerManageDAO.deleteArt",map);
	}
	//클래스 삭제
	public void deleteMidas(HashMap<String, String> map) {
		sqlSessionTemplate.delete("managerManageDAO.deleteMidas",map);
	}
}
