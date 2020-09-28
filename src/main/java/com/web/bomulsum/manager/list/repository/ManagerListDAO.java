package com.web.bomulsum.manager.list.repository;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerListDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	

	//회원정보
	public List<ManagerListUserVO> getUserList() {
		List<ManagerListUserVO> userInfo = sqlSessionTemplate.selectList("managerListDAO.userList");
		return userInfo;
	}

	//작가정보
	public List<ManagerListWriterVO> getWriterList() {
		List<ManagerListWriterVO> writerInfo = sqlSessionTemplate.selectList("managerListDAO.writerList");
		return writerInfo;
	}

}
