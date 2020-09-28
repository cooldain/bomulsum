package com.web.bomulsum.writer.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.message.repository.UserInsertChatVo;
import com.web.bomulsum.writer.login.repository.WriterRegisterVO;
import com.web.bomulsum.writer.message.repository.MessageVO;
import com.web.bomulsum.writer.message.repository.WriterChatroomVO;
import com.web.bomulsum.writer.message.repository.WriterSendMessageVO;
import com.web.bomulsum.writer.message.service.WriterMessageServiceImpl;

@Controller
@RequestMapping(value="/writer")
public class WriterMessageController {

	@Autowired
	private WriterMessageServiceImpl service;
	
	@RequestMapping(value="/message")
	public ModelAndView writeMessage(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		WriterRegisterVO vo = (WriterRegisterVO)session.getAttribute("writer_login");
		
		
		mav.addObject("testMember", service.testGetMember());
		mav.addObject("chatRoom", service.getChatRoom(vo.getWriterSeq()));
		mav.setViewName("/wmessage/messageList");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/message/reload")
	public List<WriterChatroomVO> reloadChatRoom(@RequestParam String code, @RequestParam String memberCode) {
		return service.getChatRoom(code);
	}
	
	@ResponseBody
	@RequestMapping(value="/message/head/reload")
	public List<WriterChatroomVO> reloadHead(@RequestParam String code){
		return service.getChatRoom(code);
	}
	
	@ResponseBody
	@RequestMapping(value="/message/insertChat")
	public String insertChat(@RequestParam String memberCode, HttpServletRequest request) {
		HttpSession session = request.getSession();
		WriterRegisterVO wvo = (WriterRegisterVO)session.getAttribute("writer_login");
		UserInsertChatVo vo = new UserInsertChatVo();
		vo.setMemberCode(memberCode);
		vo.setWriterCode(wvo.getWriterSeq());
		
		return service.insertChatRoom(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/message/extiChat")
	public void deleteChat(@RequestParam(value="memberCode[]") String[] memberCode, @RequestParam String writerCode) {
		List<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		for(int i=0; i<memberCode.length; i++) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("memberCode", memberCode[i]);
			map.put("writerCode", writerCode);
			list.add(map);
		}
		service.exitChatRoom(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/message/sendMessage")
	public void sendMessage(WriterSendMessageVO vo) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sender", vo.getMessageSenderCode());
		map.put("receiver", vo.getMessageReceiverCode());
		
		vo.setChatroomCode(service.getChatroomCode(map));
		service.sendMessage(vo);
	}
	
	@ResponseBody
	@RequestMapping(value="/message/getChatList")
	public List<MessageVO> getChatList(@RequestParam String senderCode, @RequestParam String receiverCode){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sender", senderCode);
		map.put("receiver", receiverCode);
		List<MessageVO> vo = service.getChatList(map);
		
		HashMap<String, String> map2 = new HashMap<String, String>();
		map2.put("sender", receiverCode);
		map2.put("receiver", senderCode);
		
		service.updateChatStatus(map2);
		
		return vo;
	}
	
	@ResponseBody
	@RequestMapping(value="/message/updateChatStatus")
	public void updateChatStatus(@RequestParam String senderCode, @RequestParam String receiverCode) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("sender", senderCode);
		map.put("receiver", receiverCode);
		service.updateChatStatus(map);
	}
	
}
