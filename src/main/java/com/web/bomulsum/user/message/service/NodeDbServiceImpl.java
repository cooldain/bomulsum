package com.web.bomulsum.user.message.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.message.repository.NodeDbDAO;
import com.web.bomulsum.user.message.repository.NodeDbVO;
import com.web.bomulsum.user.message.repository.UserChatRoomVO;
import com.web.bomulsum.user.message.repository.UserInsertChatVo;

@Service
public class NodeDbServiceImpl implements NodeDbService{

	@Autowired
	private NodeDbDAO dao;
	
	@Override
	public List<NodeDbVO> getTable() {
		return dao.getTable();
	}

	@Override
	public List<String> getUserCodes() {
		return dao.getUserCodes();
	}

	@Override
	public List<UserChatRoomVO> getChatroom(String userCode) {
		List<UserChatRoomVO> vo = dao.getChatroom(userCode);
		
		for(UserChatRoomVO chat : vo) {
			HashMap<String, String> map = new HashMap<String, String>();
			HashMap<String, String> map2 = new HashMap<String, String>();
			
			map2.put("chatroomCode", chat.getChatroomCode());
			map2.put("receiver", userCode);
			
			chat.setNonReadMsgCount(dao.getNonReadMsg(map2));
			map.put("memberCode", userCode);
			map.put("chatRoomCode", chat.getChatroomCode());
			
			String msg = dao.getNonReadMsgContent(map);
			chat.setLastMessage(msg);
		}
		
		return vo;
	}

	@Override
	public List<UserChatRoomVO> testGetWriter() {
		return dao.testGetWriter();
	}

	@Override
	public String insertChatRoom(UserInsertChatVo vo) {
		return dao.insertChatRoom(vo);		
	}

	@Override
	public void deleteChatRoom(List<HashMap<String, String>> list) {
		dao.deleteChatRoom(list);
	}

	@Override
	public Boolean selectWish(HashMap<String, String> map) {
		if(dao.selectWish(map) == 0) {
			dao.insertWish(map);
			return true;
		}else {
			dao.deleteWish(map);
			return false;
		}
	}

	@Override
	public String getWish(HashMap<String, String> map) {
		if(dao.selectWish(map) == 0) {
			return "N";
		}else {
			return "Y";
		}
	}


}
