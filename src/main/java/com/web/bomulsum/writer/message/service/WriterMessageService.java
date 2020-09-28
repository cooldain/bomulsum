package com.web.bomulsum.writer.message.service;

import java.util.HashMap;
import java.util.List;

import com.web.bomulsum.user.message.repository.UserInsertChatVo;
import com.web.bomulsum.writer.message.repository.MessageVO;
import com.web.bomulsum.writer.message.repository.WriterChatroomVO;
import com.web.bomulsum.writer.message.repository.WriterSendMessageVO;

public interface WriterMessageService {
	List<WriterChatroomVO> getChatRoom(String writerCode);
	List<WriterChatroomVO> testGetMember();
	String insertChatRoom(UserInsertChatVo vo);
	void exitChatRoom(List<HashMap<String, String>> list);
	void sendMessage(WriterSendMessageVO vo);
	List<MessageVO> getChatList(HashMap<String, String> map);
	void updateChatStatus(HashMap<String , String> map);
	String getChatroomCode(HashMap<String, String> map);
}
