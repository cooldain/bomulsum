package com.web.bomulsum.manager.list.service;

import java.util.List;

import com.web.bomulsum.manager.list.repository.ManagerListUserVO;
import com.web.bomulsum.manager.list.repository.ManagerListWriterVO;

public interface ManagerListService {
	public List<ManagerListUserVO> getUserList();
	public List<ManagerListWriterVO> getWriterList();
}
