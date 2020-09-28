package com.web.bomulsum.manager.manage.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.manager.manage.repository.ManagerManageArtVO;
import com.web.bomulsum.manager.manage.repository.ManagerManageClassVO;
import com.web.bomulsum.manager.manage.service.ManagerManageService;

@Controller
@RequestMapping(value="/manager/manage")
public class ManagerManageController {

	@Autowired
	ManagerManageService service;
	
	@RequestMapping(value="/art")
	public ModelAndView mArtList() {
		ModelAndView mav = new ModelAndView("/mManage/mArtManage");
		List<ManagerManageArtVO> artList = service.getArtList();
		for(int i=0; i<artList.size(); i++) {
				String[] photoArr = artList.get(i).getArt_photo().split(",");
				artList.get(i).setArt_photo(photoArr[0]);
				if(artList.get(i).getWriter_brand_name() == null) {
					artList.get(i).setWriter_brand_name(artList.get(i).getWriter_name());
				}
		}
		mav.addObject("artList", artList);
		return mav;
	}
	@RequestMapping(value="/class")
	public ModelAndView mClassList() {
		ModelAndView mav = new ModelAndView("/mManage/mMidasManage");
		List<ManagerManageClassVO> classList = service.getClassList();
		for(int i=0; i<classList.size(); i++) {
			String[] photoArr = classList.get(i).getMidas_img().split(",");
			classList.get(i).setMidas_img(photoArr[0]);
			if(classList.get(i).getWriter_brand_name() == null) {
				classList.get(i).setWriter_brand_name(classList.get(i).getWriter_name());
			}
	}
		mav.addObject("classList", classList);
		return mav;
	}
	//작품 삭제
	@ResponseBody
	@RequestMapping(value="/deleteArt",method = RequestMethod.POST)
	public void godeleteArt(@RequestParam(value="code") String artCode, HttpServletRequest request) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("artCode", artCode);
		service.deleteArt(map);
	}
		
	//금손클래스 삭제
	@ResponseBody
	@RequestMapping(value="/deleteMidas",method = RequestMethod.POST)
	public void godeleteMidas(@RequestParam(value="code") String midasCode, HttpServletRequest request) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("midasCode", midasCode);
		service.deleteMidas(map);
	}
		

}
