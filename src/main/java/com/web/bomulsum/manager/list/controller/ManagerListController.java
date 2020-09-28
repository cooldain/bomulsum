package com.web.bomulsum.manager.list.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.manager.list.repository.ManagerListUserVO;
import com.web.bomulsum.manager.list.repository.ManagerListWriterVO;
import com.web.bomulsum.manager.list.service.ManagerListService;

@Controller
@RequestMapping(value="/manager/list")
public class ManagerListController {
	
	@Autowired
	ManagerListService service;
	
	@RequestMapping(value="/user")
	public ModelAndView mUserList() {
		ModelAndView mav = new ModelAndView("/mList/mUserList");
		List<ManagerListUserVO> memberList = service.getUserList();
		mav.addObject("memberList", memberList);
		return mav;
	}

	@RequestMapping(value="/writer")
	public ModelAndView mWriterList() {
		ModelAndView mav = new ModelAndView("/mList/mWriterList");
		List<ManagerListWriterVO> writerList = service.getWriterList();
		mav.addObject("writerList", writerList);
		return mav;
	}

		
	
}
