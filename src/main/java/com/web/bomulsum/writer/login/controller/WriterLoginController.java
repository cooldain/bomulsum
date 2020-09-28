package com.web.bomulsum.writer.login.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.web.bomulsum.writer.gempoint.service.WriterGempointService;
import com.web.bomulsum.writer.login.repository.WriterRegisterVO;
import com.web.bomulsum.writer.login.service.WriterRegisterService;
import com.web.bomulsum.writer.profile.repository.WriterProfileVO;
import com.web.bomulsum.writer.profile.service.WriterProfileService;

@Controller
@RequestMapping(value="/writer")
public class WriterLoginController {

	@Autowired
	WriterRegisterService service;
	
	@Autowired 
	WriterGempointService gemPointService;
	
	@Autowired
	WriterProfileService profileService;
	
	@ResponseBody
	@PostMapping("/loginCheck")
	public String LoginCheck(@RequestBody WriterRegisterVO vo, HttpSession session,HttpServletResponse response,HttpServletRequest request,WriterProfileVO proVO,
			HttpSession sessionPro,HttpServletRequest requestPro) {
		System.out.println("/writer/loginCheck : Post 요청됨");
		System.out.println("parameter : " + vo);
		
		String result = null;
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		WriterRegisterVO checkVo = service.selectOne(vo.getWriterEmail());
		
		Map<String, Object> gemSum = gemPointService.getGemPointSum(checkVo.getWriterSeq());
		
		
		
		proVO = profileService.getWriterProfile(checkVo.getWriterSeq());
		
		sessionPro = requestPro.getSession();
		sessionPro.setAttribute("proVO", proVO);
		
		System.out.println("proVO : " + proVO.getWriterProfileImg());
		
		checkVo.setGemSum(Integer.parseInt(String.valueOf(gemSum.get("GEMSUM"))));
				
		if(checkVo != null) {
			if(encoder.matches(vo.getWriterPassword(), checkVo.getWriterPassword())) {
				session.setAttribute("writerCode", checkVo.getWriterSeq());
				result = "loginSuccess";
				session.setAttribute("writer_login", checkVo);
				
				long limitTime = 60*60*24*90;
				
				//자동 로그인 체크시 처리해야할 내용
				if(vo.isAutoLogin()) {
					Cookie loginCookie = new Cookie("loginCookie",session.getId());
					loginCookie.setPath("/bomulsum");
					loginCookie.setMaxAge((int)limitTime);
					System.out.println("loginCookie " + loginCookie);
					response.addCookie(loginCookie);
					System.out.println("loginCookie " + loginCookie);
						long exporedDate = System.currentTimeMillis() + (limitTime * 1000);
					
						Date limitDate = new Date(exporedDate);
						System.out.println("limitDate " + limitDate);
						service.keepLogin(session.getId(), limitDate, vo.getWriterEmail());
				}
			
			}else {
				result = "pwFail";
			}
		}else {
			result = "idFail";
		}
		return result;
	}
	
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mav) {
		 mav.setViewName("wlogin/login");
		return mav;
	}
	
	@GetMapping("/register")
	public ModelAndView register(ModelAndView mav) {
		 mav.setViewName("wlogin/register");
		return mav;
	}
	@GetMapping("/forgot-password")
	public ModelAndView forgetPass(ModelAndView mav) {
		mav.setViewName("wlogin/forgot-password");
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="/insertWriterData", method=RequestMethod.POST)
	public void insertVo(WriterRegisterVO vo) {
		service.insertMember(vo);
		System.out.println(vo.toString());
	}
	
	@ResponseBody
	@PostMapping("/checkId")
	public String checkId(@RequestBody String writerEmail) {
		System.out.println("/writer/checkId : POST 요청!");
		System.out.println("parameter : " + writerEmail);
			
		String result = null;
		int checkNum = service.checkId(writerEmail);
		System.out.println(checkNum);
		if(checkNum == 1) {
			System.out.println("아디가 중복됨!!");
			result = "NO";
		}else {
			System.out.println("사용가능아이디!!");
			result = "OK";
		}
			System.out.println("result" + result);
			
			return result;
		}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session,HttpServletRequest request,HttpServletResponse response) {
		System.out.println("로그아룻");
		
		WriterRegisterVO user = (WriterRegisterVO) session.getAttribute("writer_login");
		if(user != null) {
			session.removeAttribute("writer_login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				loginCookie.setMaxAge(0);
				loginCookie.setPath("/bomulsum");
				response.addCookie(loginCookie);
				System.out.println("loginCookie " + loginCookie);
				service.keepLogin("none", new Date(), user.getWriterEmail());
			}
		}
		return new ModelAndView("redirect:login.wdo");
	}
}