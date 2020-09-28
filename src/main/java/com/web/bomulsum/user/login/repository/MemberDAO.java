package com.web.bomulsum.user.login.repository;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertMember(MemberVO vo) {
		sqlSessionTemplate.insert("MemberDAO.insertMember", vo);
	}
	
	public String choiceMemberCode(MemberVO vo) {
		return sqlSessionTemplate.selectOne("MemberDAO.choiceMemberCode", vo);
	}
	
	public void insertCoupon(HashMap<String, Object> map) {
		sqlSessionTemplate.insert("MemberDAO.insertCoupon", map);
	}
	public void insertCoupon2(HashMap<String, Object> map) {
		sqlSessionTemplate.insert("MemberDAO.insertCoupon2", map);
	}
	public String getRecCode(String email) {
		return sqlSessionTemplate.selectOne("MemberDAO.getRecCode", email);
	}
	public void insertCoupon3(HashMap<String, Object> map) {
		sqlSessionTemplate.insert("MemberDAO.insertCoupon3", map);
	}
	
	public int checkEmail(String memberEmail) {
		return sqlSessionTemplate.selectOne("MemberDAO.checkEmail", memberEmail);
	}
	
	public int loginCheck(LoginVO vo) {
		System.out.println("dao : " + vo.toString());
		String email = vo.getEmail();
		String pw = sqlSessionTemplate.selectOne("MemberDAO.getPw", email);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(encoder.matches(vo.getPassword(), pw)) {
			vo.setPassword(pw);
			return sqlSessionTemplate.selectOne("MemberDAO.checkLogin", vo);
		}
		return 0;
	}
	
	public void updateLogin(NowLoginVO vo) {
		sqlSessionTemplate.update("MemberDAO.updateLogin", vo);
	}
	
	public String getUserCode(String memberEmail) {
		return sqlSessionTemplate.selectOne("MemberDAO.getUserCode", memberEmail);
	}
	
	public String getUserName(String code) {
		return sqlSessionTemplate.selectOne("MemberDAO.getUserName", code);
	}
	
	public void logout(NowLoginVO vo) {
		sqlSessionTemplate.update("MemberDAO.logout", vo);
	}
	
	public MemberSessionVO getUser(String code) {
		return sqlSessionTemplate.selectOne("MemberDAO.getUser", code);
	}
	
	public HashMap<String, String> forgotpw(String phone){
		return sqlSessionTemplate.selectOne("MemberDAO.forgotpw", phone);
	}
	
	public void alterTable(MemberChangePwVO vo) {
		sqlSessionTemplate.update("MemberDAO.alterTable", vo);
	}
	
}
