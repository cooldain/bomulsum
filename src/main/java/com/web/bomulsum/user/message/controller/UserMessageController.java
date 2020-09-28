package com.web.bomulsum.user.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.message.repository.UserChatRoomVO;
import com.web.bomulsum.user.message.repository.UserInsertChatVo;
import com.web.bomulsum.user.message.service.NodeDbServiceImpl;

@Controller
@RequestMapping(value="/user")
public class UserMessageController {
	
	@Autowired
	private NodeDbServiceImpl service;
	
	@GetMapping("/message")
	public ModelAndView nodeDb(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userCode = (String)session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/umyInfo/umessageNalarm/uMessage");
		if(userCode == null) {
			return mav;
		}else {
			mav.addObject("testWriter", service.testGetWriter());
			mav.addObject("chatRoom", service.getChatroom(userCode));
			return mav;
		}
	}
	
	@ResponseBody
	@RequestMapping("/message/reload")
	public List<UserChatRoomVO> reload(@RequestParam String code, @RequestParam String writerCode){
		return service.getChatroom(code);
	}
	
	@ResponseBody
	@RequestMapping("/message/head/reload")
	public List<UserChatRoomVO> headReload(@RequestParam String memberCode) {
		return service.getChatroom(memberCode);
	}
	
	@ResponseBody
	@RequestMapping("/message/left")
	public ModelAndView leftSide(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userCode = (String)session.getAttribute("member");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("testWriter", service.testGetWriter());
		mav.addObject("chatRoom", service.getChatroom(userCode));
		return mav;
		
	}
	
	@ResponseBody
	@GetMapping("/message/insertChat")
	public String insertChat(UserInsertChatVo vo){
		System.out.println(vo.toString());
		return service.insertChatRoom(vo);
	}
	
	@ResponseBody
	@GetMapping("/message/extiChat")
	public void exitChat(@RequestParam String memberCode, @RequestParam(value="writerCode[]")String[] writerCode){
		
		List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		for(int i=0; i<writerCode.length; i++) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("memberCode", memberCode);
			map.put("writerCode", writerCode[i]);
			list.add(map);
		}
		for(HashMap<String, String> m : list) {
			System.out.println(m.get("memberCode"));
			System.out.println(m.get("writerCode"));
		}
		service.deleteChatRoom(list);
	}
	
	@ResponseBody
	@GetMapping("/message/wishlist")
	public String wish(@RequestParam String memberCode, @RequestParam String writerCode) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("memberCode", memberCode);
		map.put("writerCode", writerCode);
		map.put("option", "좋아하는작가");
		
		if(service.selectWish(map)) {
			return "insert";
		}else {
			return "delete";
		}
		
	}
	
	@ResponseBody
	@GetMapping("/message/memberWishInfo")
	public String wishInfo(@RequestParam String memberCode, @RequestParam String writerCode) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("memberCode", memberCode);
		map.put("writerCode", writerCode);
		map.put("option", "좋아하는작가");
		
		return service.getWish(map);
	}

	
}
