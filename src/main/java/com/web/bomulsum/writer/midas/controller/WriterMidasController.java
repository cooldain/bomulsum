package com.web.bomulsum.writer.midas.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.common.PageCreator;
import com.web.bomulsum.common.SearchVO;
import com.web.bomulsum.writer.login.repository.WriterRegisterVO;
import com.web.bomulsum.writer.midas.repository.WriterMidasVO;
import com.web.bomulsum.writer.midas.service.WriterMidasService;

@Controller
@RequestMapping(value="/writer")
public class WriterMidasController {

	
	@Autowired
	WriterMidasService service;
	
	private static final String SAVE_PATH = "/usr/local/tomcat/webapps/bomulsum/upload";
//	private static final String SAVE_PATH = "C:\\bomulsum\\src\\main\\webapp\\upload"; //占쏙옙占쏙옙占쏙옙 占쏙옙占�
	
	@GetMapping("/midasRegister")
	public ModelAndView midas(ModelAndView mav) {
		mav.setViewName("/warticle/midasWorkRegister");
		return mav;	
	}
	
	@PostMapping("/midasClassRegister")
	public ModelAndView midasRegister(WriterMidasVO vo,ModelAndView mav,@RequestParam(value="orderPicture[]", required=false) List<MultipartFile> mf,
			 HttpServletRequest request) {
			System.out.println("midasRegister 들어옴");
			System.out.println(vo.getKeyword());
			
		//사진저장
				String result="";
				
				for (MultipartFile file : mf) {
					String originalfileName = file.getOriginalFilename();
					String saveFile = System.currentTimeMillis() + originalfileName;
					try {
						file.transferTo(new File(SAVE_PATH, saveFile));
					}catch(IllegalStateException e) { e.printStackTrace();}
					catch(IOException e) { e.printStackTrace();	}
					
					result += saveFile+",";
				}	
				System.out.println(vo.getEndTime().toString());
				vo.setOrderImg(result);
				HttpSession session =  request.getSession();
				WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
				
				String seq = code.getWriterSeq();
				
				vo.setWriterCodeSeq(seq);
				
				System.out.println(session);
				
				service.midasRegister(vo);
				mav.setViewName("redirect:/writer/midasRegister.wdo"); 
				mav.addObject("check", 1); 
		
		return mav;
	}
	
	@PostMapping("/midasModify")
	public ModelAndView midasModify(WriterMidasVO vo,ModelAndView mav,@RequestParam(value="orderPicture[]", required=false) List<MultipartFile> mf,
			 HttpServletRequest request,@RequestParam(value="orderSeq", required=false)  String orderSeq) {
			System.out.println("midasModify 들어옴");
			
		//사진저장
				String result="";
				
				for (MultipartFile file : mf) {
					String originalfileName = file.getOriginalFilename();
					String saveFile = System.currentTimeMillis() + originalfileName;
					try {
						file.transferTo(new File(SAVE_PATH, saveFile));
					}catch(IllegalStateException e) { e.printStackTrace();}
					catch(IOException e) { e.printStackTrace();	}
					
					result += saveFile+",";
				}	
				vo.setOrderImg(result);
				System.out.println(result);
				service.midasModify(vo);
				mav.setViewName("redirect:/writer/classInfo.wdo"); 
				mav.addObject("check", 1); 
		
		return mav;
	}
	@PostMapping("/midasDelete")
	public @ResponseBody String midasDelete(@RequestParam(value="orderSeq", required=false) String[] orderSeq,ModelAndView mav) {
		System.out.println("DELETE 들어옴");
		System.out.println("orderSeq : "+orderSeq);
		for(int i =0; i<orderSeq.length; i++) {
			String a = orderSeq[i];
			System.out.println(a);
			service.midasDelete(a);
		}
		return "redirect: warticle/classInfo";
	}
	
	@GetMapping("classInfo")
	public String classInfo(SearchVO vo,HttpServletRequest request,Model model) {
		System.out.println("classInfo 들어옴");
		System.out.println("parameter(페이지 번호): " + vo.getPage());
		
		HttpSession session =  request.getSession();
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		String writerCodeSeq = code.getWriterSeq();
		vo.setWriterCodeSeq(writerCodeSeq);
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		
		
		List<WriterMidasVO> classList = service.getArticleListPaging(vo);
		pc.setArticleTotalCount(service.countArticles(vo));
		model.addAttribute("classList", classList);
		model.addAttribute("pc",pc);
		return "warticle/classInfo";
	}
	
	@GetMapping("classInfoArticle")
	public @ResponseBody WriterMidasVO classInfoOrderSeq(@RequestParam String orderSeq,Model model) {
		
		WriterMidasVO vo = service.getClassArticle(orderSeq);
		model.addAttribute("article",vo);
		return vo;
	}
	@PostMapping("midasRunUpdate")
	public @ResponseBody WriterMidasVO midasRunUpdate(@RequestParam String[] orderSeq,WriterMidasVO vo) {
		for(int i=0; i<orderSeq.length; i++) {
			System.out.println("RunUpdate in !!!");
			String a = orderSeq[i];
			vo = service.getClassArticle(a);
			if(vo.getRun().equals("Y")) {
				vo.setRun("N");
				service.midasRunUpdate(vo);
				System.out.println("if(Y)" + vo);
			}else {
				vo.setRun("Y");
				service.midasRunUpdate(vo);
				System.out.println("else : "+vo);
			}
		}
		return vo;
	}

	
}


















