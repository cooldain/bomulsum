package com.web.bomulsum.writer.activity.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.writer.activity.repository.AlarmVO;
import com.web.bomulsum.writer.activity.repository.CommentsListVO;
import com.web.bomulsum.writer.activity.repository.WriterActivityVO;
import com.web.bomulsum.writer.activity.service.WriterActivityServiceImpl;
import com.web.bomulsum.writer.login.repository.WriterRegisterVO;


@Controller
@RequestMapping(value="/writer")
public class WriterActivityController {
	/* 이 컨트롤러에서 "/writer/*.wdo" 형태로 접속되는 링크들에 대한 네비게이션 역할을 해줄거다! */

	@Autowired
	private WriterActivityServiceImpl service;

	
	/*댓글 - 댓글 목록 보여주기*/
	@GetMapping("/activity/comments")
	public ModelAndView commentsList(HttpServletRequest request) {
		
		//로그인한 작가 정보 가져오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		String seq = code.getWriterSeq();
		
		System.out.println("컨트롤러 1 :" + seq);
	
		ModelAndView mav = new ModelAndView();
		System.out.println("컨트롤러 2 :" + seq);
		
		mav.addObject("commentsList", service.commentsList(seq));
		System.out.println("이게 실행 되었나요?");

		mav.setViewName("/wactivity/comments");
		return mav;
	}
	
	/*댓글 - 작가가 댓글 등록 */
	@RequestMapping(value="/activity/addReComment", method=RequestMethod.POST)
	public ModelAndView addReComment(CommentsListVO vo, AlarmVO avo, HttpServletRequest request){
		//모델엔뷰란? - 데이터와 뷰를 동시에 설정이 가능하다!
		
		//로그인한 작가 정보 가져오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		String seq = code.getWriterSeq();
		
		System.out.println("addRecomment : "+ vo.toString());
		service.addRecomment(vo, avo);
		ModelAndView mav = new ModelAndView();
		if(vo.getComment_status().equals("Y")) {
			mav.addObject("check", 4); // 뷰로 보낼 데이터 값			
		} else {
			mav.addObject("check", 3); 
		}
		mav.setViewName("redirect:/writer/activity/comments.wdo"); // 뷰 이름 _ 어떤 뷰로 보낼 지
		return mav;
	}
	
	
	/*알람 목록 가져오기*/
	@GetMapping("/activity/alarm")
	public ModelAndView alarmList(HttpServletRequest request) {
	
		//로그인한 작가 정보 가져오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		String seq = code.getWriterSeq();
	
		ModelAndView mav = new ModelAndView();
		for(AlarmVO vo : service.alarmList(seq)) {
			System.out.println(vo.toString());
		}
		mav.addObject("alarmList", service.alarmList(seq));
		mav.addObject("adminName", "보물섬");
		mav.setViewName("/wactivity/alarm");
		return mav;
	}
	
	
	/*댓글 - 댓글 목록 보여주기*/
	@GetMapping("/activity/review")
	public ModelAndView reviewList(HttpServletRequest request) {
		
		//로그인한 작가 정보 가져오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		String seq = code.getWriterSeq();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("reviewList", service.reviewList(seq));
		System.out.println("여기서 reviewList를 찍어보자");
		mav.setViewName("/wactivity/review");
		
		return mav;
	}
	
	/*댓글 - 작가가 댓글 등록 */
	@RequestMapping(value="/activity/updateReviewComment", method=RequestMethod.POST)
	public ModelAndView updateReviewComment(WriterActivityVO vo, HttpServletRequest request){
		//모델엔뷰란? - 데이터와 뷰를 동시에 설정이 가능하다!
		
		//로그인한 작가 정보 가져오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		String seq = code.getWriterSeq();
		
		System.out.println("updateReviewComment : "+ vo.toString());
		service.updateReviewComment(vo);
		ModelAndView mav = new ModelAndView();
		
		if(vo.getReviewCommentReStatus().equals("Y")) {
			mav.addObject("check", 4); // 뷰로 보낼 데이터 값			
		} else {
			mav.addObject("check", 3); 
		}
		mav.setViewName("redirect:/writer/activity/review.wdo"); // 뷰 이름 _ 어떤 뷰로 보낼 지
		return mav;
	}
	
}
