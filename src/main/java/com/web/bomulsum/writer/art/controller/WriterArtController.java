package com.web.bomulsum.writer.art.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.writer.art.repository.WriterArtInfoDetailVO;
import com.web.bomulsum.writer.art.repository.WriterArtOptionVO;
import com.web.bomulsum.writer.art.repository.WriterArtVO;
import com.web.bomulsum.writer.art.service.WriterArtService;
import com.web.bomulsum.writer.login.repository.WriterRegisterVO;

@Controller
@RequestMapping(value = "/writer")
public class WriterArtController {
	
	@Autowired
	WriterArtService service;
	
	private static final String SAVE_PATH = "/usr/local/tomcat/webapps/bomulsum/upload";	//aws 경로
//	private static final String SAVE_PATH = "C:\\bomulsum\\src\\main\\webapp\\upload"; //로컬 저장 경로
	
	@GetMapping("/workRegister")
	public String workRegister() {
		return "/warticle/workRegister";
	} 

	//판매중 작품 목록
	@RequestMapping(value="/workOnsale")
	public ModelAndView workOnsale(WriterArtVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("warticle/onSale");
		
		//작가코드 받아오기
		HttpSession session =  request.getSession();
        WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");        
        String seq = code.getWriterSeq();
		
        //해당 작가의 판매중 작품
		List<WriterArtVO> artList  = service.getArtOnsaleList(seq);
		//System.out.println(artList);

		if(artList.size() >= 1) {
			for(int i=0; i<artList.size(); i++) {
				WriterArtVO tempVO = artList.get(i);
				String[] photoArray = tempVO.getArtPhoto().split(",");
				int reviewCount = service.getArtSaleReview(tempVO.getArtCodeSeq());
				int commentCount = service.getArtSaleComment(tempVO.getArtCodeSeq());
				int bookMarkCount = service.getArtSaleBookmark(tempVO.getArtCodeSeq());
				tempVO.setArtPhoto(photoArray[0]);
				tempVO.setBookMarkCount(bookMarkCount);
				tempVO.setCommentCount(commentCount);
				tempVO.setReviewCount(reviewCount);
				artList.remove(i);
				artList.add(i, tempVO);		
			}
			//System.out.println(artList);
		}

		mav.addObject("onSaleList", artList);
		return mav;
	} 

	//판매일시중지 작품으로 변경
	@ResponseBody
	@RequestMapping(value="/pauseSalesArt")
	   public void updateSalesArtlist( @RequestParam(value="saleState[]") String[] checkArr, HttpServletRequest request) {
			System.out.println(Arrays.toString(checkArr));
	        service.changePauseSalesArt(checkArr);
	        System.out.println("판매일시중지 변경 완료");
	   }
	
	//판매 작품으로 변경
	@ResponseBody
	@RequestMapping(value="/salesStartArt")
	   public void updateSalesStartArt( @RequestParam(value="saleState[]") String[] checkArr, HttpServletRequest request) {
			System.out.println(Arrays.toString(checkArr));
	        service.changeStartSalesArt(checkArr);
	        System.out.println("판매일시중지 변경 완료");
	   }
	
	//작품 삭제
	@ResponseBody
	@RequestMapping(value="/deleteArt")
	   public void deleteArtlist( @RequestParam(value="artDelete[]") String[] deleteCheck, HttpServletRequest request) {
			System.out.println(Arrays.toString(deleteCheck));
	        service.deleteArt(deleteCheck);
	        System.out.println("작품 삭제");
	   }


	//작품 수정
	@RequestMapping(value = "/updateWork/{artCodeUpdate}")
	public ModelAndView artUpdate(@PathVariable String artCodeUpdate, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("/warticle/updateWork");
		System.out.println(artCodeUpdate);
		List<WriterArtVO> artList = service.getUpdateArt(artCodeUpdate);
		List<WriterArtInfoDetailVO> artInfoList = service.getUpdateArtInfo(artCodeUpdate);
		List<WriterArtOptionVO> artOptionList = service.getUpdateArtOption(artCodeUpdate);
		System.out.println(artList);
		System.out.println(artInfoList);
		System.out.println(artOptionList);

		String photo = artList.get(0).getArtPhoto();
		String keyword = artList.get(0).getArtKeyword();

		String[] photoArray = photo.split(",");
		String[] keywordArray = keyword.split(",");
		mav.addObject("photoArr", photoArray);
		mav.addObject("keywordArr", keywordArray);
		mav.addObject("updateArtList", artList);
		mav.addObject("updateArtInfoList", artInfoList);
		mav.addObject("updateArtOptionList", artOptionList);
		return mav;
	}


	
	
	
	
	//판매 일시 중지 작품 목록
	@RequestMapping(value="/pauseOnsale")
	public ModelAndView pauseOnsale(WriterArtVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("warticle/pauseOnsale");
		
		//작가코드 받아오기
		HttpSession session =  request.getSession();
        WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");        
        String seq = code.getWriterSeq();
		
        //해당 작가의 판매일시중지 작품
		List<WriterArtVO> artList  = service.getArtPauseOnsale(seq);
		//System.out.println(artList);

		if(artList.size() >= 1) {
			for(int i=0; i<artList.size(); i++) {
				WriterArtVO tempVO = artList.get(i);
				String[] photoArray = tempVO.getArtPhoto().split(",");
				int reviewCount = service.getArtSaleReview(tempVO.getArtCodeSeq());
				int commentCount = service.getArtSaleComment(tempVO.getArtCodeSeq());
				int bookMarkCount = service.getArtSaleBookmark(tempVO.getArtCodeSeq());
				tempVO.setArtPhoto(photoArray[0]);
				tempVO.setBookMarkCount(bookMarkCount);
				tempVO.setCommentCount(commentCount);
				tempVO.setReviewCount(reviewCount);
				artList.remove(i);
				artList.add(i, tempVO);		
			}
			//System.out.println(artList);
		}

		mav.addObject("pauseOnSale", artList);
		return mav;
	} 

	//작품 수정 액션
	@RequestMapping(value="/updateWorkArt")
	public ModelAndView updateArtwork(@RequestParam(value="artPicture", required=false) List<MultipartFile> mf,
			 HttpServletRequest request, WriterArtVO vo, WriterArtInfoDetailVO vo1, WriterArtOptionVO vo2){	

		// 사진 등록
		String result = "";

		for (MultipartFile file : mf) {
			String originalfileName = file.getOriginalFilename();
			String saveFile = System.currentTimeMillis() + originalfileName;
			try {
				file.transferTo(new File(SAVE_PATH, saveFile));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			result += saveFile + ",";
		}
		vo.setArtPhoto(result);
		
		//작가코드 받아오기
		HttpSession session =  request.getSession();
        WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");        
        String seq = code.getWriterSeq();
        vo.setWriterCodeSeq(seq);
        
        
        ModelAndView mav = new ModelAndView();
        System.out.println("수정해야할 값 가져옴1"+ vo.toString());
        
        String artCode = vo.getArtCodeSeq();
        System.out.println("수정해야할 값 가져옴2"+ vo1.toString());
        System.out.println("수정해야할 값 가져옴3"+ vo2.toString());
        vo1.setArtCode(artCode);
        vo2.setArtCodeSeq(artCode);
        
        //작품 수정
        service.updateArt(vo);
        service.updateArtInfoDetail(vo1);    

		//작품 옵션 등록
		String[] optionCategoryArr = vo2.getArtOptionCategory().split(",");
		String[] optionNameArr = vo2.getArtOptionName().split(",");
		String[] optionPriceArr = vo2.getArtOptionPrice().split(",");
		String[] optionSeq = vo2.getArtOptionSeq().split(",");

		Map<String, Object> optionData = new HashMap<String, Object>();
		//optionData.put("ArtCodeSeq", vo2.getArtCodeSeq());
		switch(optionNameArr.length) {
		case 9: 
			optionData.put("optionSeq9", optionSeq[8]);
			optionData.put("OptionCategory3", optionCategoryArr[2]);
			optionData.put("optionName9", optionNameArr[8]);
			optionData.put("optionPrice9", Integer.parseInt(optionPriceArr[8]));
			service.updateArtOption9(optionData);
		case 8:
			optionData.put("optionSeq8", optionSeq[7]);
			optionData.put("OptionCategory3", optionCategoryArr[2]);
			optionData.put("optionName8", optionNameArr[7]);
			optionData.put("optionPrice8", Integer.parseInt(optionPriceArr[7]));
			service.updateArtOption8(optionData);
		case 7:
			optionData.put("optionSeq7", optionSeq[6]);
			optionData.put("OptionCategory3", optionCategoryArr[2]);
			optionData.put("optionName7", optionNameArr[6]);
			optionData.put("optionPrice7", Integer.parseInt(optionPriceArr[6]));
			service.updateArtOption7(optionData);
		case 6:
			optionData.put("optionSeq6", optionSeq[5]);
			optionData.put("OptionCategory2", optionCategoryArr[1]);
			optionData.put("optionName6", optionNameArr[5]);
			optionData.put("optionPrice6", Integer.parseInt(optionPriceArr[5]));
			service.updateArtOption6(optionData);
		case 5:
			optionData.put("optionSeq5", optionSeq[4]);
			optionData.put("OptionCategory2", optionCategoryArr[1]);
			optionData.put("optionName5", optionNameArr[4]);
			optionData.put("optionPrice5", Integer.parseInt(optionPriceArr[4]));
			service.updateArtOption5(optionData);
		case 4:
			optionData.put("optionSeq4", optionSeq[3]);
			optionData.put("OptionCategory2", optionCategoryArr[1]);
			optionData.put("optionName4", optionNameArr[3]);
			optionData.put("optionPrice4", Integer.parseInt(optionPriceArr[3]));
			service.updateArtOption4(optionData);
		case 3:
			optionData.put("optionSeq3", optionSeq[2]);
			optionData.put("OptionCategory1", optionCategoryArr[0]);
			optionData.put("optionName3", optionNameArr[2]);
			optionData.put("optionPrice3", Integer.parseInt(optionPriceArr[2]));
			service.updateArtOption3(optionData);
        case 2:
        	optionData.put("optionSeq2", optionSeq[1]);
        	optionData.put("OptionCategory1", optionCategoryArr[0]);
			optionData.put("optionName2", optionNameArr[1]);
			optionData.put("optionPrice2", Integer.parseInt(optionPriceArr[1]));
			service.updateArtOption2(optionData);
        case 1 :
        	optionData.put("optionSeq1", optionSeq[0]);
        	optionData.put("OptionCategory1", optionCategoryArr[0]);
        	optionData.put("optionName1", optionNameArr[0]);
        	optionData.put("optionPrice1", Integer.parseInt(optionPriceArr[0]));
        	service.updateArtOption1(optionData);
            break;
        default :
		
		}		
		System.out.println(optionData);

		mav.setViewName("redirect:/writer/workOnsale.wdo"); 
		mav.addObject("check", 1); // 수정 완료 확인
		return mav;
	}
	
	//작품 등록 액션
	@RequestMapping(value="/artregister")
	public ModelAndView insertArtwork(@RequestParam(value="artPicture", required=false) List<MultipartFile> mf,
			 HttpServletRequest request, WriterArtVO vo, WriterArtInfoDetailVO vo1, WriterArtOptionVO vo2){	
		//사진 등록
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
		vo.setArtPhoto(result);
		
		//작가코드 받아오기
		HttpSession session =  request.getSession();
        WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");        
        String seq = code.getWriterSeq();
        vo.setWriterCodeSeq(seq);
	
		//작품 등록
		service.insertArt(vo);
		System.out.println(vo.toString());
		
		//작품코드 검색
		String artCode = service.getArtCode(vo);
		System.out.println(artCode);

		ModelAndView mav = new ModelAndView();
		
		//작품코드 등록
		vo1.setArtCode(artCode);
		vo2.setArtCodeSeq(artCode);

		//작품 정보제공 등록
		service.insertArtInfoDetail(vo1);
		System.out.println(vo1.toString());

		//작품 옵션 등록
		String[] optionCategoryArr = vo2.getArtOptionCategory().split(",");
		String[] optionNameArr = vo2.getArtOptionName().split(",");
		String[] optionPriceArr = vo2.getArtOptionPrice().split(",");

		Map<String, Object> optionData = new HashMap<String, Object>();
		optionData.put("ArtCodeSeq", vo2.getArtCodeSeq());
		switch(optionNameArr.length) {
		case 9: 
			optionData.put("OptionCategory3", optionCategoryArr[2]);
			optionData.put("optionName9", optionNameArr[8]);
			optionData.put("optionPrice9", Integer.parseInt(optionPriceArr[8]));
			service.insertArtOption9(optionData);
		case 8:
			optionData.put("OptionCategory3", optionCategoryArr[2]);
			optionData.put("optionName8", optionNameArr[7]);
			optionData.put("optionPrice8", Integer.parseInt(optionPriceArr[7]));
			service.insertArtOption8(optionData);
		case 7:
			optionData.put("OptionCategory3", optionCategoryArr[2]);
			optionData.put("optionName7", optionNameArr[6]);
			optionData.put("optionPrice7", Integer.parseInt(optionPriceArr[6]));
			service.insertArtOption7(optionData);
		case 6:
			optionData.put("OptionCategory2", optionCategoryArr[1]);
			optionData.put("optionName6", optionNameArr[5]);
			optionData.put("optionPrice6", Integer.parseInt(optionPriceArr[5]));
			service.insertArtOption6(optionData);
		case 5:
			optionData.put("OptionCategory2", optionCategoryArr[1]);
			optionData.put("optionName5", optionNameArr[4]);
			optionData.put("optionPrice5", Integer.parseInt(optionPriceArr[4]));
			service.insertArtOption5(optionData);
		case 4:
			optionData.put("OptionCategory2", optionCategoryArr[1]);
			optionData.put("optionName4", optionNameArr[3]);
			optionData.put("optionPrice4", Integer.parseInt(optionPriceArr[3]));
			service.insertArtOption4(optionData);
		case 3:
			optionData.put("OptionCategory1", optionCategoryArr[0]);
			optionData.put("optionName3", optionNameArr[2]);
			optionData.put("optionPrice3", Integer.parseInt(optionPriceArr[2]));
			service.insertArtOption3(optionData);
        case 2:
        	optionData.put("OptionCategory1", optionCategoryArr[0]);
			optionData.put("optionName2", optionNameArr[1]);
			optionData.put("optionPrice2", Integer.parseInt(optionPriceArr[1]));
			service.insertArtOption2(optionData);
        case 1 :
        	optionData.put("OptionCategory1", optionCategoryArr[0]);
        	optionData.put("optionName1", optionNameArr[0]);
        	optionData.put("optionPrice1", Integer.parseInt(optionPriceArr[0]));
        	service.insertArtOption1(optionData);
            break;
        default :
		
		}		
		System.out.println(optionData);

		mav.setViewName("redirect:/writer/workRegister.wdo"); 
		mav.addObject("check", 1); // 등록 완료 확인
		return mav;
	}
	

}
