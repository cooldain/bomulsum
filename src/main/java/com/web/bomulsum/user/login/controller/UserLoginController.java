package com.web.bomulsum.user.login.controller;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.login.repository.LoginVO;
import com.web.bomulsum.user.login.repository.MemberChangePwVO;
import com.web.bomulsum.user.login.repository.MemberVO;
import com.web.bomulsum.user.login.repository.NowLoginVO;
import com.web.bomulsum.user.login.service.MemberServiceImpl;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping(value = "/user")
public class UserLoginController {
	
	@Autowired
	MemberServiceImpl service;

	@GetMapping("/login")
	public ModelAndView userLogin(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Cookie cookie[] = request.getCookies();
		if(cookie != null) {
			for(Cookie c : cookie) {
				if(c.getName().equals("rememberEmail")) {
					if(c.getValue() != null) {
						mav.addObject("rememberedEmail", c.getValue());
					}
				}
			}
		}
		mav.setViewName("/ulogin/ulogin");
		
		return mav;  
	}

	@GetMapping("/newAccount")
	public String userNewAccount() {
		return "/ulogin/unewAccount";
	}

	@GetMapping("/newAccountEmail")
	public String userNewAccountEmail() {
		return "/ulogin/unewAccountEmail";
	}

	@RequestMapping(value = "/smsCheck")
	public void sendSms(@RequestParam String msg, @RequestParam String receiver) {
		System.out.println(msg);
		System.out.println(receiver);

		String api_key = "NCSRZ9EUI4F5PIVX";
		String api_secret = "KANEQZYC68WB7STQ6PCEIYQDC3MYVP2N";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", receiver);
		params.put("from", "01036292628"); // 보낼 사람 전화번호
		params.put("type", "SMS");
		params.put("text", msg);
		params.put("app_version", "test app 1.2"); // application name and version

	    try {
	    	//send() 전송할지 말지.
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	}
	
	@ResponseBody
	@RequestMapping(value="/insertUserData", method=RequestMethod.POST)
	public void insertVo(MemberVO vo) {
		// 회원가입 성공 후 로직
		service.insertMember(vo);
		
		System.out.println(vo.toString());
	}
	
	@RequestMapping(value="/successNewAccount")
	public String successNewAccount() {
		return "/ulogin/usuccessNewAccountEmail";
	}
	
	
	@RequestMapping(value="/checkEmail", method=RequestMethod.GET)
	public @ResponseBody int checkEmail(@RequestParam String memberEmail){
		return service.checkEmail(memberEmail);
	}
	
	@RequestMapping(value="/loginCheck", method=RequestMethod.POST)
	public ModelAndView loginCheck(LoginVO vo, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView(); 
		int check = service.loginCheck(vo);
		mav.addObject("checkValue", check);
		mav.setViewName("/ulogin/ulogin");
		if(check == 1) {
			
			// 세션에 사용자 고유코드 넣기.
			String userCode = service.getUserCode(vo.getEmail());
			HttpSession session = request.getSession();
			session.setAttribute("member", userCode);
			
			//로그인 유무 처리
			NowLoginVO newloginVo = new NowLoginVO();
			newloginVo.setMemberEmail(vo.getEmail());
			newloginVo.setyORn("Y");
			service.updateLogin(newloginVo);
			
			// 사용자 이름 넣어주기
			String userName = service.getUserName(userCode);
			session.setAttribute("userName", userName);
			session.setAttribute("user", service.getUser(userCode));
			System.out.println("신규 추가 : " + service.getUser(userCode));
			
			// 이메일 저장하기 체크박스 선택시 쿠키 생성해주기.
			if(vo.getRememberEmail() != null) {
				Cookie cookie = new Cookie("rememberEmail", vo.getEmail());
				cookie.setMaxAge(24*60*60*30);
				cookie.setPath("/");
				response.addCookie(cookie);
			}else {
				Cookie cookie = new Cookie("rememberEmail", null);
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
			}
		}
		return mav;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		NowLoginVO vo = new NowLoginVO();
		vo.setMemberCode((String)session.getAttribute("member"));
		vo.setyORn("N");
		service.logout(vo);
		session.invalidate();
		
		return "redirect:/home.do";
	}
	
//	@RequestMapping(value="/loginkakao/oauth", produces="application/json", method=RequestMethod.GET)
//	public String loginkakao(@RequestParam("code") String code, RedirectAttributes ra, HttpSession session,
//			HttpServletResponse response) throws IOException{
//		System.out.println("kakao code: " + code);
//		return "";
//	}
	
	
	@RequestMapping(value="/findAboutAccount")
	public String forgotIdPw() {
		return "/ulogin/uforgotIdPw";
	}
	
	@RequestMapping(value="/phoneCheck", method = RequestMethod.POST)
	public ModelAndView updatePw(@RequestParam String phone, ModelAndView mav) {
		System.out.println("HP: " + phone);
		HashMap<String, String> map = service.forgotpw(phone);
		
		mav.setViewName("/ulogin/uUpdatePw");
		if(map != null) {
			mav.addObject("data", map);		
		}else {
			mav.addObject("phone", phone);
		}
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/updatePW", method = RequestMethod.POST)
	public void alterTable(MemberChangePwVO vo) {

		service.alterTable(vo);
	}
	

}