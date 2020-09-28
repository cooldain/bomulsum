package com.web.bomulsum.writer.message.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.message.repository.UserInsertChatVo;
import com.web.bomulsum.writer.message.repository.MessageVO;
import com.web.bomulsum.writer.message.repository.WriterChatroomVO;
import com.web.bomulsum.writer.message.repository.WriterMessageDAO;
import com.web.bomulsum.writer.message.repository.WriterSendMessageVO;

@Service
public class WriterMessageServiceImpl implements WriterMessageService{

	@Autowired
	private WriterMessageDAO dao;
	
	@Override
	public List<WriterChatroomVO> getChatRoom(String writerCode) {
		List<WriterChatroomVO> vo = dao.getChatRoom(writerCode);
		for(WriterChatroomVO chat : vo) {
			HashMap<String, String> map = new HashMap<String, String>();
			HashMap<String, String> map2 = new HashMap<String, String>();
			
			map2.put("chatroomCode", chat.getChatroomCode());
			map2.put("receiver", writerCode);
			// 채팅방 코드 가져오기
			chat.setNonReadMsgCount(dao.getNonReadMsg(map2));
			
			map.put("writerCode", writerCode);
			map.put("chatRoomCode", chat.getChatroomCode());
			// 마지막 메세지 가져오기
			String msg = dao.getNonReadMsgContent(map);
			chat.setLastMessage(msg);
		}
		
		return vo;
	}

	@Override
	public List<WriterChatroomVO> testGetMember() {
		return dao.testGetMember();
	}

	@Override
	public String insertChatRoom(UserInsertChatVo vo) {
		return dao.insertChatRoom(vo);
	}

	@Override
	public void exitChatRoom(List<HashMap<String, String>> list) {
		dao.exitChatRoom(list);
	}

	@Override
	public void sendMessage(WriterSendMessageVO vo) {
		dao.sendMessage(vo);
	}

	@Override
	public List<MessageVO> getChatList(HashMap<String, String> map) {
		return dao.getChatList(map);
	}

	@Override
	public void updateChatStatus(HashMap<String, String> map) {
		dao.updateChatStatus(map);
	}

	@Override
	public String getChatroomCode(HashMap<String, String> map) {
		return dao.getChatroomCode(map);
	}
	
}
