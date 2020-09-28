package com.web.bomulsum.manager.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.manager.board.repository.MBoardListVO;
import com.web.bomulsum.manager.board.repository.MBoardVO;
import com.web.bomulsum.manager.board.service.MBoardServiceImpl;

@Controller
@RequestMapping(value="/manager")
public class managerController {
	
	/* 이 컨트롤러에서 "/mboard/*.mdo" 형태로 접속되는 링크들에 대한 네비게이션 역할을 해준다! */
	
	
	@Autowired
	private MBoardServiceImpl service;
	
	@GetMapping("/mboard/write")
	public String mboard_write() {
		return "/mBoard/mboard_write";
	}
	
	
	/*게시판 글 목록 보여주기*/
	@GetMapping("/mboard/list")
	public ModelAndView mboardList() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mboardList", service.mboardList());
		/*addObject에서 설정한 "mboardList" 가 "mboard_list.jsp"에서 사용될 값을 불러올 변수명이 된다.
		 * "mboardList" = .jsp에서 사용할 변수명 , 
		 * "service.mboardList" = 담을 값 */
		for(MBoardListVO vo : service.mboardList()){
			System.out.println(vo.toString());
		}
		mav.setViewName("/mBoard/mboard_list");
		return mav;
	}
	
	
	/*
	 * mboard_write.jsp 에서 form 태그의 엑션 값이
	 * "/register"이기 때문에 이 메소드에서 입력된 데이터를 vo로 받아 처리해줄 수 있는 거다.
	 */
	@RequestMapping(value="/mboard/register", method=RequestMethod.POST)
	public ModelAndView mboardRegister(MBoardVO vo, HttpServletRequest request){
		//모델엔뷰란? - 데이터와 뷰를 동시에 설정이 가능하다!
		System.out.println(vo.toString());
		service.mboardRegister(vo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("check", 1); // 뷰로 보낼 데이터 값
		mav.setViewName("redirect:/manager/mboard/write.mdo"); // 뷰 이름 _ 어떤 뷰로 보낼 지
		return mav;
	}

	/*글 상세보기에서 수정버튼 눌렀을 때 -> 글 수정 폼으로 가서 기존 입력된 정보를 뿌려준다.*/
	@RequestMapping(value="/mboard/rewrite", method=RequestMethod.POST)
	public ModelAndView mboardRewrite(MBoardVO vo, HttpServletRequest request){
		
		MBoardVO mBoardVO = service.mboardSelect(vo);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/mBoard/mboard_rewrite");
		mav.addObject("mBoardVO", mBoardVO);
		System.out.println("글수정을 위한 데이터 가져와보기"+ mBoardVO.toString());
		return mav;
	}
	
	/*글 수정 폼에서 저장 눌렀을 때 -> DB 업데이트문 실행하고 목록으로 돌아간다. */
	@RequestMapping(value="/mboard/update", method=RequestMethod.POST)
	public ModelAndView mboardUpdate(MBoardVO vo, HttpServletRequest request) {
		System.out.println("사용자가 입력한 수정 데이터 : " + vo.toString());
		
		service.mboardUpdate(vo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("check", 1);
		mav.setViewName("redirect:/manager/mboard/list.mdo");//글 수정 버튼 누르고 나면 다시 게시글 목록으로 돌아가기.
		return mav;
	}
	
	/*삭제 버튼 눌럿을 때 -> 폼으로 넘어오는게 아니라, 시퀀스값 갖고 location.href 로 넘어감 / 별도의 보여줄 페이지가 필요 없으므로 모델앤뷰도 안씀*/
	@RequestMapping(value="/mboard/delete", method = RequestMethod.GET)
	public String mboardDelete(MBoardVO vo) {
		service.mboardDelete(vo);
		return "redirect:/manager/mboard/list.mdo";
	}
	
	
}
