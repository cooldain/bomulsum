package com.web.bomulsum.manager.manage.service;

import java.util.HashMap;
import java.util.List;

import com.web.bomulsum.manager.manage.repository.ManagerManageArtVO;
import com.web.bomulsum.manager.manage.repository.ManagerManageClassVO;

public interface ManagerManageService {

	public List<ManagerManageArtVO> getArtList();
	public List<ManagerManageClassVO> getClassList();
	public void deleteArt(HashMap<String, String> map);
	public void deleteMidas(HashMap<String, String> map);
}
