package com.web.bomulsum.user.productInfo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.bomulsum.user.productInfo.repository.CommentVO;
import com.web.bomulsum.user.productInfo.repository.JoinVO;
import com.web.bomulsum.user.productInfo.repository.ReviewVO;
import com.web.bomulsum.user.productInfo.repository.TestVo;
import com.web.bomulsum.user.productInfo.repository.WriterVO;
import com.web.bomulsum.user.productInfo.service.ProductInfoService;
import com.web.bomulsum.writer.art.repository.WriterArtInfoDetailVO;
import com.web.bomulsum.writer.art.repository.WriterArtOptionVO;
import com.web.bomulsum.writer.art.repository.WriterArtVO;

@Controller
@RequestMapping(value="/user")
public class ProductInfoController {
	
	@Autowired
	ProductInfoService service;
	
	@GetMapping("/uProductInfo/{artCodeSeq}")
	public String ProductInfo(HttpServletRequest request, @PathVariable String artCodeSeq,Model model,WriterArtVO vo, @RequestParam String memberCode) {
		
		// 최근 본 리스트
		if(memberCode != null && !memberCode.equals("null")) {	
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("memberCode", memberCode);
			map.put("artCode", artCodeSeq);
			service.selectRecentyleView(map);
		}
		service.updateViewCount(artCodeSeq);
		
		String memberIMG = service.getMemberImg(memberCode);
		
		HttpSession session = request.getSession();
		session.setAttribute("artCodeSeq", artCodeSeq);
		
		WriterArtVO artList = service.getListProductInfo(artCodeSeq);
		
		String writerCodeSeq = artList.getWriterCodeSeq();
		session.setAttribute("writerCodeSeq", writerCodeSeq);
		WriterVO writer = service.getWriterInfo(writerCodeSeq);
		System.out.println(writer.toString());
		List<WriterArtInfoDetailVO> artInfo = service.getListProductartInfoList(artCodeSeq);
		
		List<WriterArtOptionVO> artOption = service.getListProductInfoOption(artCodeSeq);
		
		
		HashMap<String, List<WriterArtOptionVO>> optionMap = new HashMap<String, List<WriterArtOptionVO>>();

		for (int i = 0; i < artOption.size(); i++) {
			List<WriterArtOptionVO> optionList = null;
			if (optionMap.containsKey(artOption.get(i).getArtOptionCategory())) {
				optionList = optionMap.get(artOption.get(i).getArtOptionCategory());
			} else {
				optionList = new ArrayList<WriterArtOptionVO>();
				optionMap.put(artOption.get(i).getArtOptionCategory(), optionList);
			}
			optionList.add(artOption.get(i));
			System.out.println("optionList(" + i + ") : " + optionList);
		}

		System.out.println("optionMap : " + optionMap);
		 

		
		String keyword = artList.getArtKeyword();
		String[] keywordSplit;
		if(keyword != null) {
			keywordSplit = keyword.split(",");
		}else {
			keywordSplit = new String[0];
		}
		String artPhoto = artList.getArtPhoto();
		String[] artPhotoSplit = artPhoto.split(",");
		
		if(memberCode == null) {
			JoinVO join = new JoinVO();
			join.setMemberCodeSeq("x");
		}
		
		List<WriterArtVO> otherArt = service.selectOherProduct(writerCodeSeq); 
		
		List<CommentVO> commentList = service.commentSelect(artCodeSeq);
		
//		artCodeSeq
		List<ReviewVO> reviewList = service.getReviews(artCodeSeq);
		int reviewTotalStar=0;
		for(ReviewVO rVo : reviewList) {
			reviewTotalStar += rVo.getReviewStar();
		}
		int reviewCount = reviewList.size();
		reviewTotalStar = Math.round(reviewTotalStar / (float)reviewCount);
		
		
		int writerReviewCount = service.getWriterAllArticleStar(writerCodeSeq).size();
		int writerReviewTotalStar = 0;
		for(Integer i : service.getWriterAllArticleStar(writerCodeSeq)) {
			writerReviewTotalStar += i;
		}
		
		writerReviewTotalStar = Math.round(writerReviewTotalStar / (float)writerReviewCount);
		
		// 좋아하는 작가 확인
		int checkWishWriter = 0;
		if(memberCode != null && !memberCode.equals("null")) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("memberCode", memberCode);
			map.put("writerCode", writerCodeSeq);
			checkWishWriter = service.checkWishForWriter(map);
		}
		
		// 좋아하는 작품 확인
		int checkWishArticle = 0;
		if(memberCode != null && !memberCode.equals("null")) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("memberCode", memberCode);
			map.put("artCode", artCodeSeq);
			System.out.println("member : " + memberCode);
			System.out.println("art : " + artCodeSeq);
			checkWishArticle = service.checkWishForArticle(map);
		}
		
		System.out.println("checkWishArticle : " + checkWishArticle);
		
		artList.setBookMarkCount(service.getWishForWriter(artCodeSeq));
		
		model.addAttribute("checkWishWriter", checkWishWriter);
		model.addAttribute("checkWishArticle", checkWishArticle);
		model.addAttribute("writerAllArticlesStar", writerReviewTotalStar);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("reviewTotalStar", reviewTotalStar);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("artOther",otherArt);
		model.addAttribute("firstPhoto",artPhotoSplit[0]);
		model.addAttribute("artPhotoSplit", artPhotoSplit);
		model.addAttribute("keywordSplit", keywordSplit);
		model.addAttribute("otherArt", otherArt);
		model.addAttribute("writer",writer);
		model.addAttribute("artList",artList);
		model.addAttribute("artInfo",artInfo);
		model.addAttribute("artOption",optionMap);
		model.addAttribute("memberImg", memberIMG);
		model.addAttribute("dndudArtCode", artCodeSeq);
		
		return "/ushopbag/uProductInfo";
	}
	
	@GetMapping("commentUpdate")
	public @ResponseBody List<CommentVO> commentUpdate(Model model,
			@RequestParam(value="comment") String comment,
			@RequestParam(value="memberCode") String memberCode,
			@RequestParam(value="artCodeSeq") String artCodeSeq,
			@RequestParam(value="writerCodeSeq") String writerCodeSeq) {
		System.out.println("들어옴");
		System.out.println(comment + " , " + memberCode +","+writerCodeSeq);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("commentContent",comment);
		map.put("memberCodeSeq",memberCode);
		map.put("artCodeSeq",artCodeSeq);
		map.put("writerCodeSeq",writerCodeSeq);
		service.commentInsert(map);
		
		List<CommentVO> commentList = service.commentSelect(artCodeSeq);
		System.out.println(commentList);
		
		return commentList; 
	}
	
	@RequestMapping(value="/product/shopbag", method=RequestMethod.POST)
	public String insertShopbag(TestVo vo) {
		List<TestVo> listVo = vo.getTestList();
		String artCode=null;
		String memberCode=null;
		String optionCode="";
		String count="";
		for(TestVo v : listVo) {
			artCode = v.getArtCode();
			memberCode = v.getMemberCode();
			optionCode += v.getOptionCode()+"#";
			count += v.getArtCount()+",";
		}
		
		TestVo serviceVo = new TestVo();
		serviceVo.setArtCode(artCode);
		serviceVo.setMemberCode(memberCode);
		serviceVo.setOptionCode(optionCode);
		serviceVo.setArtCount(count);
		
		System.out.println(serviceVo.toString());
		
		service.insertShopBag(serviceVo);
		
		return "redirect:/user/shopbag.do";
	}
	
	@ResponseBody
	@RequestMapping(value="/shopbag/confirm")
	public int checkShopbag(@RequestParam(value="code") String code, @RequestParam(value="memberCode") String memberCode) {
		System.out.println(code);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("code", code);
		map.put("member", memberCode);
		
		return service.checkShopBag(map);
	}
	
	
	
}
