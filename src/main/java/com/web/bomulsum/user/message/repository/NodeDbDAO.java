package com.web.bomulsum.user.message.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NodeDbDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<NodeDbVO> getTable() {
		return sqlSessionTemplate.selectList("NodeDbDAO.getMessage");
	}
	
	public List<String> getUserCodes() {
		return sqlSessionTemplate.selectList("NodeDbDAO.getUserCodes");
	}
	
	public List<UserChatRoomVO> getChatroom(String userCode){
		return sqlSessionTemplate.selectList("NodeDbDAO.getChatroom", userCode);
	}
	
	public List<UserChatRoomVO> testGetWriter(){
		return sqlSessionTemplate.selectList("NodeDbDAO.testGetWriter");
	}
	
	public String insertChatRoom(UserInsertChatVo vo) {
		String result = "success";
		String check = sqlSessionTemplate.selectOne("NodeDbDAO.insertChatRoomBefore", vo);
		System.out.println("dao에 있는 check : " + check);
		if(check == null) { 
			System.out.println("insert dao 작동");
			sqlSessionTemplate.insert("NodeDbDAO.insertChatRoom", vo);	
		}else if(check.equals("N")){		
			System.out.println("update dao 작동");
			sqlSessionTemplate.update("NodeDbDAO.updateChatRoom", vo);
		}else {
			result = "error";	
		}
		return result;
	}
	
	public void deleteChatRoom(List<HashMap<String, String>> list) {
		sqlSessionTemplate.update("NodeDbDAO.delChatRoom", list);
	}
	
	public String getChatroomCode(HashMap<String, String> map) {
		return sqlSessionTemplate.selectOne("NodeDbDAO.getChatroomCode", map);
	}
	
	public int getNonReadMsg(HashMap<String, String> map) {
		return sqlSessionTemplate.selectOne("NodeDbDAO.getNonReadMsg", map);
	}
	
	public String getNonReadMsgContent(HashMap<String, String> map) {
		return sqlSessionTemplate.selectOne("NodeDbDAO.getNonReadMsgContent", map);
	}
	
	public int selectWish(HashMap<String, String> map) {
		return sqlSessionTemplate.selectOne("NodeDbDAO.selectWish", map);
	}
	
	public void insertWish(HashMap<String, String> map) {
		sqlSessionTemplate.insert("NodeDbDAO.insertWish", map);
	}
	public void deleteWish(HashMap<String, String> map) {
		sqlSessionTemplate.delete("NodeDbDAO.deleteWish", map);
	}
	
	
}
