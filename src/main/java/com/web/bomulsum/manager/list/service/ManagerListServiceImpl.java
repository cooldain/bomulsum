package com.web.bomulsum.manager.list.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.web.bomulsum.manager.list.repository.ManagerListDAO;
import com.web.bomulsum.manager.list.repository.ManagerListUserVO;
import com.web.bomulsum.manager.list.repository.ManagerListWriterVO;

@Service
public class ManagerListServiceImpl implements ManagerListService{
	@Autowired
	ManagerListDAO dao;

	@Override
	public List<ManagerListUserVO> getUserList() {
		return dao.getUserList();
	}

	@Override
	public List<ManagerListWriterVO> getWriterList() {
		return dao.getWriterList();
	}
	

}
