package com.web.bomulsum.user.popular.controller;

import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.popular.repository.UserPopularWriterVO;
import com.web.bomulsum.user.popular.service.UserPopularWriterService;

@Controller
@RequestMapping(value="/user")
public class UserPopularWriterController {
	
	@Autowired
	UserPopularWriterService service;

	//인기작가
	@RequestMapping(value="/popular/writer")
	public ModelAndView popularWriter( HttpServletRequest request) {
		ModelAndView mav= new ModelAndView("/ucategory/uPopularWriter");
		
		//회원 코드 가져오기
		 HttpSession session = request.getSession(); 
		 String memberCode = (String)session.getAttribute("member"); 
		 System.out.println(memberCode);
		
		//작가 상세 정보
		List<UserPopularWriterVO> list = service.getWriterInfo();
		System.out.println(list);
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getWriter_brand_name() == null) {
				String name = list.get(i).getWriter_name();
				list.get(i).setWriter_brand_name(name);
			}
			if(list.get(i).getWriter_intro() == null) {
				list.get(i).setWriter_intro("소개글 없음");
			}
		}
		
		//작가 코드 정보
		String first = list.get(0).getWriter_code_seq();
		String second = list.get(1).getWriter_code_seq();
		String third = list.get(2).getWriter_code_seq();
		String fourth = list.get(3).getWriter_code_seq();
		String fivth = list.get(4).getWriter_code_seq();
		if(memberCode != null) {
		//좋아하는 작가인지 확인
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberCode", memberCode);
		map.put("writerCode1", first);
		map.put("writerCode2", second);
		map.put("writerCode3", third);
		map.put("writerCode4", fourth);
		map.put("writerCode5", fivth);

		List<String> likeWriter = service.getLikeWriter(map);
		System.out.println(likeWriter);
		
		//null처리
		for(int i=0; i<likeWriter.size(); i++) {
			if(likeWriter.get(i).equals(first)) {
				list.get(0).setLikeWriter("yes");
			}
			if(likeWriter.get(i).equals(second)) {
				list.get(1).setLikeWriter("yes");
			}
			if(likeWriter.get(i).equals(third)) {
				list.get(2).setLikeWriter("yes");
			}
			if(likeWriter.get(i).equals(fourth)) {
				list.get(3).setLikeWriter("yes");
			}
			if(likeWriter.get(i).equals(fivth)){
				list.get(4).setLikeWriter("yes");
			}
		}
		}
		List<String> firstArt = service.getRankPhoto(first);
		List<String> secondArt = service.getRankPhoto(second);
		List<String> thirdArt = service.getRankPhoto(third);
		List<String> fourthArt = service.getRankPhoto(fourth);
		List<String> fifthArt = service.getRankPhoto(fivth);
		
		if(firstArt.size() <13) {
			for(int i=0; i<13; i++) {
				firstArt.add("noimage.png,");
			}
		}
		if(secondArt.size() <13) {
			for(int i=0; i<13; i++) {
				secondArt.add("noimage.png,");
			}
		}
		if(thirdArt.size() <13) {
			for(int i=0; i<13; i++) {
				thirdArt.add("noimage.png,");
			}
		}
		if(fourthArt.size() <13) {
			for(int i=0; i<13; i++) {
				fourthArt.add("noimage.png,");
			}
		}
		if(fifthArt.size() <13) {
			for(int i=0; i<13; i++) {
				fifthArt.add("noimage.png,");
			}
		}
		for(int j=0; j<12; j++) {
			String[] photoArr1 = firstArt.get(j).split(",");
			String[] photoArr2 = secondArt.get(j).split(",");
			String[] photoArr3 = thirdArt.get(j).split(",");
			String[] photoArr4 = fourthArt.get(j).split(",");
			String[] photoArr5 = fifthArt.get(j).split(",");
			switch(j) {
			case 0:
				list.get(0).setArtPhoto1(photoArr1[0]);
				list.get(1).setArtPhoto1(photoArr2[0]);
				list.get(2).setArtPhoto1(photoArr3[0]);
				list.get(3).setArtPhoto1(photoArr4[0]);
				list.get(4).setArtPhoto1(photoArr5[0]);
				break;
			case 1:
				list.get(0).setArtPhoto2(photoArr1[0]);
				list.get(1).setArtPhoto2(photoArr2[0]);
				list.get(2).setArtPhoto2(photoArr3[0]);
				list.get(3).setArtPhoto2(photoArr4[0]);
				list.get(4).setArtPhoto2(photoArr5[0]);
				break;
			case 2:
				list.get(0).setArtPhoto3(photoArr1[0]);
				list.get(1).setArtPhoto3(photoArr2[0]);
				list.get(2).setArtPhoto3(photoArr3[0]);
				list.get(3).setArtPhoto3(photoArr4[0]);
				list.get(4).setArtPhoto3(photoArr5[0]);
				break;
			case 3:
				list.get(0).setArtPhoto4(photoArr1[0]);
				list.get(1).setArtPhoto4(photoArr2[0]);
				list.get(2).setArtPhoto4(photoArr3[0]);
				list.get(3).setArtPhoto4(photoArr4[0]);
				list.get(4).setArtPhoto4(photoArr5[0]);
				break;
			case 4:
				list.get(0).setArtPhoto5(photoArr1[0]);
				list.get(1).setArtPhoto5(photoArr2[0]);
				list.get(2).setArtPhoto5(photoArr3[0]);
				list.get(3).setArtPhoto5(photoArr4[0]);
				list.get(4).setArtPhoto5(photoArr5[0]);
				break;
			case 5:
				list.get(0).setArtPhoto6(photoArr1[0]);
				list.get(1).setArtPhoto6(photoArr2[0]);
				list.get(2).setArtPhoto6(photoArr3[0]);
				list.get(3).setArtPhoto6(photoArr4[0]);
				list.get(4).setArtPhoto6(photoArr5[0]);
				break;
			case 6:
				list.get(0).setArtPhoto7(photoArr1[0]);
				list.get(1).setArtPhoto7(photoArr2[0]);
				list.get(2).setArtPhoto7(photoArr3[0]);
				list.get(3).setArtPhoto7(photoArr4[0]);
				list.get(4).setArtPhoto7(photoArr5[0]);
				break;
			case 7:
				list.get(0).setArtPhoto8(photoArr1[0]);
				list.get(1).setArtPhoto8(photoArr2[0]);
				list.get(2).setArtPhoto8(photoArr3[0]);
				list.get(3).setArtPhoto8(photoArr4[0]);
				list.get(4).setArtPhoto8(photoArr5[0]);
				break;
			case 8:
				list.get(0).setArtPhoto9(photoArr1[0]);
				list.get(1).setArtPhoto9(photoArr2[0]);
				list.get(2).setArtPhoto9(photoArr3[0]);
				list.get(3).setArtPhoto9(photoArr4[0]);
				list.get(4).setArtPhoto9(photoArr5[0]);
				break;
			case 9:
				list.get(0).setArtPhoto10(photoArr1[0]);
				list.get(1).setArtPhoto10(photoArr2[0]);
				list.get(2).setArtPhoto10(photoArr3[0]);
				list.get(3).setArtPhoto10(photoArr4[0]);
				list.get(4).setArtPhoto10(photoArr5[0]);
				break;
			case 10:
				list.get(0).setArtPhoto11(photoArr1[0]);
				list.get(1).setArtPhoto11(photoArr2[0]);
				list.get(2).setArtPhoto11(photoArr3[0]);
				list.get(3).setArtPhoto11(photoArr4[0]);
				list.get(4).setArtPhoto11(photoArr5[0]);
				break;
			case 11:
				list.get(0).setArtPhoto12(photoArr1[0]);
				list.get(1).setArtPhoto12(photoArr2[0]);
				list.get(2).setArtPhoto12(photoArr3[0]);
				list.get(3).setArtPhoto12(photoArr4[0]);
				list.get(4).setArtPhoto12(photoArr5[0]);
				break;
			}
		}
	
		System.out.println(list);
		mav.addObject("rank1", list.get(0));
		mav.addObject("rank2", list.get(1));
		mav.addObject("rank3", list.get(2));
		mav.addObject("rank4", list.get(3));
		mav.addObject("rank5", list.get(4));
		return mav;
		
	}
	
	//좋아하는 작가 추가 여부
	@ResponseBody
	@RequestMapping(value="/likeWriter", method=RequestMethod.POST)
	public void addLikeWriter(HttpServletRequest request,
			@RequestParam(value="member") String member,
			@RequestParam(value="option") String option,
			@RequestParam(value="optionCode") String optionCode,
			@RequestParam(value="bool") Boolean bool ) {
		
		//회원코드
		HttpSession session = request.getSession(); 
		String memberCode = (String)session.getAttribute("member"); 
		System.out.println(memberCode);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("member", memberCode);
		map.put("option", option);
		map.put("optionCode", optionCode);
		if(bool) {
			service.likeWriter(map);
		}else {
			service.nonLikeWriter(map);
		}
	}
	
	
}
