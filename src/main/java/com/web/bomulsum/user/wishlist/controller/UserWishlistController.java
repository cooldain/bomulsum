package com.web.bomulsum.user.wishlist.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.wishlist.repository.UserLikeWriterVO;
import com.web.bomulsum.user.wishlist.service.UserLikeWriterService;

@Controller
@RequestMapping(value="/user/wishlist")
public class UserWishlistController {
	
	@Autowired
	UserLikeWriterService service;

	@RequestMapping(value="/likeWriter")
	public ModelAndView likeWriter(UserLikeWriterVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/umyInfo/uwishList/uLikeWriter");
	
		//회원코드
		HttpSession session = request.getSession(); 
		String memberCode = (String)session.getAttribute("member"); 
		System.out.println(memberCode);
	
		//좋아하는 작가 리스트
		List<String> writerList = service.getwriterList(memberCode);
		System.out.println(writerList);
		
		if(writerList.isEmpty()) {
			mav.addObject("artListInfo", null);
		}
		else {
			//작가정보
			List<UserLikeWriterVO> artList = service.getWriterInfo(writerList);
		
			for(int i=0; i<artList.size(); i++) {
				//작가 브랜드명 처리
				if(artList.get(i).getWriter_brand_name() == null) {
					String writerName = artList.get(i).getWriter_name();
					artList.get(i).setWriter_brand_name(writerName);
				}
				//작가 소개글 처리
				if(artList.get(i).getWriter_intro() == null) {
					artList.get(i).setWriter_intro("소개글 없음");
				}
			}
			
			//작품 사진 가져오기
			List<List<Map<String,Object>>> artPhotoList = new ArrayList<List<Map<String,Object>>>();
			for(int i=0;i<writerList.size(); i++) {
				List<Map<String,Object>> photoInfo = service.getArtPhoto(writerList.get(i));
				artPhotoList.add(photoInfo);
			}
			System.out.println(artPhotoList);

			for (int j = 0; j < artPhotoList.size(); j++) {
				List<String> photoFinal = new ArrayList<String>();
				for (int x = 0; x < artPhotoList.get(j).size(); x++) {
					String artName = (String) artPhotoList.get(j).get(x).get("ART_PHOTO");
					String[] photoTest = artName.split(",");
					photoFinal.add(photoTest[0]);
				}
				artList.get(j).setArtPhoto(photoFinal);
			}
			for(int y=0; y<artList.size(); y++) {
				if(artList.get(y).getArtPhoto().size() >= 9) {
					artList.get(y).setArt_photo1(artList.get(y).getArtPhoto().get(0));
					artList.get(y).setArt_photo2(artList.get(y).getArtPhoto().get(1));
					artList.get(y).setArt_photo3(artList.get(y).getArtPhoto().get(2));
					artList.get(y).setArt_photo4(artList.get(y).getArtPhoto().get(3));
					artList.get(y).setArt_photo5(artList.get(y).getArtPhoto().get(4));
					artList.get(y).setArt_photo6(artList.get(y).getArtPhoto().get(5));
					artList.get(y).setArt_photo7(artList.get(y).getArtPhoto().get(6));
					artList.get(y).setArt_photo8(artList.get(y).getArtPhoto().get(7));
					artList.get(y).setArt_photo9(artList.get(y).getArtPhoto().get(8));
				}
				else{
					List<String> tempList = artList.get(y).getArtPhoto();
					for(int t=0; t<9; t++) {
						tempList.add("noimage.png");
					}
					artList.get(y).setArt_photo1(artList.get(y).getArtPhoto().get(0));
					artList.get(y).setArt_photo2(artList.get(y).getArtPhoto().get(1));
					artList.get(y).setArt_photo3(artList.get(y).getArtPhoto().get(2));
					artList.get(y).setArt_photo4(artList.get(y).getArtPhoto().get(3));
					artList.get(y).setArt_photo5(artList.get(y).getArtPhoto().get(4));
					artList.get(y).setArt_photo6(artList.get(y).getArtPhoto().get(5));
					artList.get(y).setArt_photo7(artList.get(y).getArtPhoto().get(6));
					artList.get(y).setArt_photo8(artList.get(y).getArtPhoto().get(7));
					artList.get(y).setArt_photo9(artList.get(y).getArtPhoto().get(8));
				}
			}
			System.out.println("총 list"+artList.toString());	
			mav.addObject("artListInfo", artList);
		}
		return mav;
		
	}
	
	//좋아하는 작가 취소
	@RequestMapping(value="/unLikeWriter")
	   public void unLikeWriter( @RequestParam(value="writer_code_seq") String writerCode, HttpServletRequest request) {
		//회원코드
		HttpSession session = request.getSession(); 
		String memberCode = (String)session.getAttribute("member"); 
		System.out.println(memberCode);   
		
		Map<String, Object> unLikeData = new HashMap<String, Object>();
		unLikeData.put("memberCode", memberCode);
		unLikeData.put("writerCode", writerCode);
		service.deleteLikeWriter(unLikeData);
		System.out.println("좋아하는 작가 취소");
	 }
	

	
}
