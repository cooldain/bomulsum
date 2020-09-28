package com.web.bomulsum.manager.manage.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.web.bomulsum.manager.manage.repository.ManagerManageArtVO;
import com.web.bomulsum.manager.manage.repository.ManagerManageClassVO;
import com.web.bomulsum.manager.manage.repository.ManagerManageDAO;

@Service
public class ManagerManageServiceImpl implements ManagerManageService{

	@Autowired
	ManagerManageDAO dao;

	@Override
	public List<ManagerManageArtVO> getArtList() {
		return dao.getArtList();
	}

	@Override
	public List<ManagerManageClassVO> getClassList() {
		return dao.getClassList();
	}

	@Override
	public void deleteMidas(HashMap<String, String> map) {
		dao.deleteMidas(map);
	}

	@Override
	public void deleteArt(HashMap<String, String> map) {
		dao.deleteArt(map);
	}

}
