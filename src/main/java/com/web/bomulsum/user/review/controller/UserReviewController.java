package com.web.bomulsum.user.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.review.repository.UserReviewPagingVO;
import com.web.bomulsum.user.review.repository.UserReviewVO;
import com.web.bomulsum.user.review.service.UserReviewServiceImpl;

@Controller
@RequestMapping(value="/user")
public class UserReviewController {

	@Autowired
	private UserReviewServiceImpl service;
	
	private static final String SAVE_PATH = "/usr/local/tomcat/webapps/bomulsum/upload";	//aws 경로
//	private static final String SAVE_PATH = "C:\\bomulsum\\src\\main\\webapp\\upload"; //로컬 저장 경로
	
	@RequestMapping("/myInfo/review")
	public String myReview(HttpServletRequest request) {
		/*
		 * HttpSession session = request.getSession(); String seq =
		 * (String)session.getAttribute("member"); System.out.println(seq);
		 * 
		 * ModelAndView mav = new ModelAndView(); mav.addObject("reviewList",
		 * service.myReview(seq)); mav.setViewName("/umyInfo/uReview/uWriteReview");
		 * return mav;
		 */
		return "/umyInfo/uReview/uWriteReview";
	}
	
	@RequestMapping("/myInfo/reviewedList")
	public String myReviewList(HttpServletRequest request) {
		/*
		 * HttpSession session = request.getSession(); String seq =
		 * (String)session.getAttribute("member"); System.out.println(seq);
		 * 
		 * ModelAndView mav = new ModelAndView(); mav.addObject("reviewedList",
		 * service.myReviewed(seq)); mav.setViewName("/umyInfo/uReview/uWriteReviewMe");
		 */
		return "/umyInfo/uReview/uWriteReviewMe";
	}
	
	//페이징 처리
	@ResponseBody
	@RequestMapping(value="/myInfo/reviewInfo", method=RequestMethod.POST)
	public HashMap<String, Object> reviewInfo(
			@RequestParam(value="reviewedCheck") int reviewedCheck,
			@RequestParam(value="page") int page,
			@RequestParam(value="member") String member){
		System.out.println("멤버 : " + member);
		String seq = member;
		System.out.println("seq : " + seq);
		
		UserReviewPagingVO vo = new UserReviewPagingVO();
		vo.setMemberSeq(seq);
		
		int totalCnt;
		
		if(reviewedCheck == 1) {
			totalCnt = service.getReviewCount(vo);			
		} else {
			totalCnt = service.getReviewedCount(vo);
			System.out.println("내가 쓴 구매후기로 진입했습니다.");
		}
		System.out.println("totalCnt : " + totalCnt);
		
		int pageCnt = page;
		if(pageCnt == 1) {
			vo.setStartNum(1);
			if(reviewedCheck == 1) {
				vo.setEndNum(5);
			} else {
				vo.setEndNum(6);
			}
		} else {
			if(reviewedCheck == 1) {
				vo.setStartNum(pageCnt + (4 * (pageCnt-1)));
				vo.setEndNum(pageCnt * 5);
			} else {
				vo.setStartNum(pageCnt + (5 * (pageCnt-1)));
				vo.setEndNum(pageCnt * 6);
			}
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<UserReviewVO> data;
		
		if(reviewedCheck == 1) {
			data = service.myReview(vo);			
		} else {
			data = service.myReviewed(vo);
			System.out.println("내가 쓴 구매후기로 데이터가 들어갑니다.");
		}
		
		System.out.println("data 개수 : " + data.toArray().length);
		
		map.put("totalCnt", totalCnt);
		map.put("startNum", vo.getStartNum());
		map.put("data", data);
		
		return map;
	}
	
	//구매후기 등록
	@RequestMapping(value="/myInfo/reviewRegster", method= {RequestMethod.POST})
	public ModelAndView insertArtwork(@RequestParam(value="reviewPicture", required=false) List<MultipartFile> mf,
			 HttpServletRequest request, UserReviewVO vo){
		
		//유저코드 받아오기
		HttpSession session =  request.getSession();
        String seq = (String)session.getAttribute("member");
        vo.setMemberCodeSeq(seq);
        System.out.println("강민 맴버코드 찍기 : " + vo.getMemberCodeSeq());
        
        ModelAndView mav = new ModelAndView();
        
        System.out.println(vo.getbArtReviewStatus());
        
        //처음 등록하는 거
        if(vo.getbArtReviewStatus().equals("N")) {
        	//사진 경로 설정
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
      		vo.setReviewPhoto(result);
      		System.out.println(vo.toString());
    		//리뷰 등록 & 구매작품 테이블에서 구매후기상태를 Y로 변경 & 작가한테 해당 작품에 구매후기 등록되었음을 알림 으로 등록
      		service.insertReview(vo);
    		service.updateBuyArtTb(vo);
    		mav.addObject("checkReg", 1); // 뷰로 보낼 데이터 값
        } else {
        	service.updateReview(vo);
        	service.updateBuyArtTb2(vo);
        	mav.addObject("checkReg", 2); // 뷰로 보낼 데이터 값
        }
        service.insertAlarmTb(vo);

		mav.setViewName("redirect:/user/myInfo/review.do");
		
		return mav;
	}
	
	@RequestMapping("/realtimeReview")
	public String realtimeReview(HttpServletRequest request) {
		return "/ucategory/uRealtimeReview";
	}
	
	@ResponseBody
	@RequestMapping(value="/realtimReviewInfo", method=RequestMethod.POST)
	public HashMap<String, Object> realtimeReviewInfo(
			@RequestParam(value="page") int page,
			@RequestParam(value="member") String member){
		
		System.out.println("멤버 : " + member);
		String seq = member;
		System.out.println("seq : " + seq);
		
		UserReviewPagingVO vo = new UserReviewPagingVO();
		
		int totalCnt = service.getRealTimeReviewCount(vo);
	
		System.out.println("totalCnt : " + totalCnt);
		
		int pageCnt = page;
		if(pageCnt == 1) {
			vo.setStartNum(1);
			vo.setEndNum(12);
		} else {
			vo.setStartNum(pageCnt + (11 * (pageCnt-1)));
			vo.setEndNum(pageCnt * 12);
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<UserReviewVO> data;
		
		data = service.realtimeReview(vo);
		
		System.out.println("data 개수 : " + data.toArray().length);
		
		map.put("totalCnt", totalCnt);
		map.put("startNum", vo.getStartNum());
		map.put("data", data);
		
		return map;
	}
}
