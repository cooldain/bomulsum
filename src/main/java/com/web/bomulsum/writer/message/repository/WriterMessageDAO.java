package com.web.bomulsum.writer.message.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.bomulsum.user.message.repository.UserInsertChatVo;

@Repository
public class WriterMessageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<WriterChatroomVO> getChatRoom(String writerCode){
		return sqlSessionTemplate.selectList("writerMessageDAO.getChatroom", writerCode);
	}
	
	public List<WriterChatroomVO> testGetMember(){
		return sqlSessionTemplate.selectList("writerMessageDAO.memberTest");
	}
	
	public String insertChatRoom(UserInsertChatVo vo) {
		String result = "success";
		String check = sqlSessionTemplate.selectOne("writerMessageDAO.insertChatRoomBefore", vo);
		if(check == null) {
			sqlSessionTemplate.insert("writerMessageDAO.insertChatRoom", vo);
		}else if(check.equals("N")) {
			sqlSessionTemplate.update("writerMessageDAO.updateChatRoom", vo);
		}else {
			result = "error";
		}
		return result;
	}
	
	public void exitChatRoom(List<HashMap<String, String>> list) {
		sqlSessionTemplate.delete("writerMessageDAO.delChatRoom", list);
	}
	
	public void sendMessage(WriterSendMessageVO vo) {
		sqlSessionTemplate.update("writerMessageDAO.sendMessageBefore", vo);
		sqlSessionTemplate.insert("writerMessageDAO.sendMessage", vo);
	}
	
	public List<MessageVO> getChatList(HashMap<String, String> map){
		return sqlSessionTemplate.selectList("writerMessageDAO.getChatList", map);
	}
	
	public void updateChatStatus(HashMap<String , String> map) {
		sqlSessionTemplate.update("writerMessageDAO.updateChatStatus", map);
	}
	
	public String getChatroomCode(HashMap<String, String> map) {
		return sqlSessionTemplate.selectOne("writerMessageDAO.getChatroomCode", map);
	}
	
	public int getNonReadMsg(HashMap<String, String> map) {
		return sqlSessionTemplate.selectOne("writerMessageDAO.getNonReadMsg", map);
	}
	
	public String getNonReadMsgContent(HashMap<String, String> map) {
		return sqlSessionTemplate.selectOne("writerMessageDAO.getNonReadMsgContent", map);
	}

}
