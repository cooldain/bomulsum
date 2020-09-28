package com.web.bomulsum.writer.profile.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.writer.login.repository.WriterRegisterVO;
import com.web.bomulsum.writer.profile.repository.WriterProfileVO;
import com.web.bomulsum.writer.profile.service.WriterProfileService;

@Controller
@RequestMapping(value="/writer")
public class WriterProfileController {

		@Autowired
		WriterProfileService service;
		
//		private static final String SAVE_PATH = "C:\\bomulsum\\src\\main\\webapp\\upload"; //저장할 경로
		private static final String SAVE_PATH = "/usr/local/tomcat/webapps/bomulsum/upload";
		
		//-----------------------작가프로필-------------------------
		@RequestMapping(value="/profile")
		public ModelAndView writerProfile(HttpServletRequest request) {
			//작가seq 세션받아오기
			HttpSession session = request.getSession();
			WriterRegisterVO code = (WriterRegisterVO)session.getAttribute("writer_login");
			String seq = code.getWriterSeq();
			
			ModelAndView mav = new ModelAndView("/waccount/writerProfile");
			
			WriterProfileVO result = service.getWriterProfile(seq);
			System.out.println("다시들어옴: " + result);
			mav.addObject("profile", result);
			System.out.println("mav확인:"+mav);
			
//			//테스트 :: 이미지 넘기는거 
//			Map<String, String> imgTest = new HashMap<String, String>();
//			imgTest.put("test", "1596879911463point.png" );
//			mav.addObject("imgtest", imgTest); 
			
			
			//사이드에 프로필 변경 반영-----
			String changedBrandName= result.getWriterBrandName(); 
			String  changedProfileImg = result.getWriterProfileImg();
		  	code.setWriterName(changedBrandName);
		  
		  
			session = request.getSession();
			session.setAttribute("proVO", result);
			
			System.out.println("proVO : " + session.getAttribute("proVO"));
			
			//vo에 담아서 세션에 세션의 proVO에 넣기
			WriterProfileVO changedPro = new WriterProfileVO();
			changedPro.setWriterBrandName(changedBrandName);
			changedPro.setWriterProfileImg(changedProfileImg);
			
			session.setAttribute("proVO", changedPro);
			System.out.println("변경후 proVO : " + session.getAttribute("proVO"));
		  
			
			return mav;
		} 
		
		@RequestMapping(value= "/updateprofile")
		public ModelAndView writerUpdateProfile(@RequestParam(value="writerProfileImgg", required=false) MultipartFile mf
					, @RequestParam(value="writerCoverImgg", required=false) MultipartFile mf2, WriterProfileVO vo, HttpServletRequest request) {
		
			//작가seq 세션받아오기
			HttpSession session = request.getSession();
			WriterRegisterVO code = (WriterRegisterVO)session.getAttribute("writer_login");
			String seq = code.getWriterSeq();
			vo.setWriterCodeSeq(seq);
			
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/writer/profile.wdo");
			
			System.out.println("원래이미지1:" + service.getWriterProfileImg(seq));
			System.out.println("원래이미지2:" + service.getWriterCoverImg(seq));		
			
			
			String originalFileName = mf.getOriginalFilename(); //이미지1(프로필) 이름
			String originalFileName2 = mf2.getOriginalFilename(); //이미지2(커버) 이름
			long fileSize = mf.getSize(); //이미지1 크기
			long fileSize2 = mf2.getSize(); 
			
			System.out.println(vo.toString());
			System.out.println(originalFileName);
			System.out.println(originalFileName2);
			
//			String root_path = getClass().getResource("/upload").getPath(); 
//			System.out.println("TOSTRING : " + getClass().getResource("/upload").toString());
//			System.out.println("PATH : " + getClass().getResource("/upload").getPath());
		
			
			String saveFile = System.currentTimeMillis() + originalFileName; //이미지1 저장할 이름
			vo.setWriterProfileImg(saveFile); //이미지 이름 vo에 저장
			
			if(originalFileName.isEmpty() || (originalFileName==null)) {
				saveFile = service.getWriterProfileImg(seq);
				vo.setWriterProfileImg(saveFile);
			}
			
			String saveFile2 = System.currentTimeMillis() + originalFileName2; //이미지2 저장할 이름
			vo.setWriterCoverImg(saveFile2);
			
			if(originalFileName2.isEmpty() || (originalFileName2==null)) {
				saveFile2 = service.getWriterCoverImg(seq);
				vo.setWriterCoverImg(saveFile2);
			}
			System.out.println("===========================");
			System.out.println(vo.toString());

			service.updateWriterProfile(vo); //프로필 등록
			
			System.out.println(fileSize);
			System.out.println(fileSize2);

//			System.out.println(root_path);
			try {
				mf.transferTo(new File(SAVE_PATH, saveFile)); //이미지1 SAVE_PATH에 저장
				mf2.transferTo(new File(SAVE_PATH, saveFile2)); //이미지2 SAVE_PATH에 저장
			}catch(IllegalStateException e) {
				e.printStackTrace();
			}catch(IOException e) {
				e.printStackTrace();

			}
			return mav;
		}
		
		
//		@RequestMapping(value= "/updateprofile", method=RequestMethod.POST)
//		public ModelAndView writerUpdateProfile(WriterProfileVO vo, HttpServletRequest request) {
//			System.out.println(vo.toString());
//
//			service.updateWriterProfile(vo);
//			//ModelAndView mav = new ModelAndView("redirect:/writer/profile.wdo");
//			ModelAndView mav = new ModelAndView();
//			mav.setViewName("redirect:/writer/profile.wdo");
//			return mav;
//		}
		
		
}
