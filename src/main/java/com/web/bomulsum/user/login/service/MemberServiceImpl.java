package com.web.bomulsum.user.login.service;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.web.bomulsum.user.login.repository.LoginVO;
import com.web.bomulsum.user.login.repository.MemberChangePwVO;
import com.web.bomulsum.user.login.repository.MemberDAO;
import com.web.bomulsum.user.login.repository.MemberSessionVO;
import com.web.bomulsum.user.login.repository.MemberVO;
import com.web.bomulsum.user.login.repository.NowLoginVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO dao;

	@Override
	public void insertMember(MemberVO vo) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		encoder.matches(vo.getPassword(), checkVO.getPassword())    암호화 되어잇는거 맞는지 확인.
//		암호화 과정
		vo.setMemberPassword(encoder.encode(vo.getMemberPassword()));
		dao.insertMember(vo);
		// 쿠폰 넣기.
		// 회원가입 감사 쿠폰
		// 신규가입 고객 대상
			
		System.out.println(vo.getMemberCode());
		HashMap<String, Object> map = new HashMap<String, Object>();
		String code = "member_code_seq" + vo.getMemberCode();
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(new java.util.Date());
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		cal.add(Calendar.DATE, 30);
		System.out.println(cal.getTime());
		Date date = Date.valueOf(df.format(cal.getTime()));
		
		map.put("code", code);
		map.put("date", date);
		
		System.out.println(code);
		dao.insertCoupon(map);
		dao.insertCoupon2(map);
		
		if(vo.getMemberRecCode() != null && vo.getMemberRecCode() != "" && vo.getMemberRecCode() != "null") {
			map.put("recCode", dao.getRecCode(vo.getMemberRecCode()));
			dao.insertCoupon3(map);
		}
		
	}

	@Override
	public int checkEmail(String memberEmail) {
		return dao.checkEmail(memberEmail);
	}

	@Override
	public int loginCheck(LoginVO vo) {
		return dao.loginCheck(vo);
	}

	@Override
	public void updateLogin(NowLoginVO vo) {
		dao.updateLogin(vo);
	}

	@Override
	public String getUserCode(String memberEmail) {
		return dao.getUserCode(memberEmail);
	}

	@Override
	public String getUserName(String code) {
		return dao.getUserName(code);
	}

	@Override
	public void logout(NowLoginVO vo) {
		dao.logout(vo);
	}

	@Override
	public MemberSessionVO getUser(String code) {
		return dao.getUser(code);
	}

	@Override
	public HashMap<String, String> forgotpw(String phone) {
		return dao.forgotpw(phone);
	}

	@Override
	public void alterTable(MemberChangePwVO vo) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		vo.setChPw(encoder.encode(vo.getChPw()));
		dao.alterTable(vo);
	}

}