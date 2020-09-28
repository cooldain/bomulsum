package com.web.bomulsum.writer.art.controller;

import java.util.HashMap;
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

import com.web.bomulsum.common.PageCreator;
import com.web.bomulsum.common.SearchVO;
import com.web.bomulsum.writer.art.repository.WriterArtVO;
import com.web.bomulsum.writer.art.service.WriterArtService;
import com.web.bomulsum.writer.login.repository.WriterRegisterVO;
//
@Controller
@RequestMapping("writer")
public class WriterRecomendController {

	@Autowired
	WriterArtService service;
	
	
	@GetMapping("recommendWriter")
	public String recommendWriter(HttpServletRequest request,Model model,SearchVO vo,WriterArtVO artvo) {
		
		HttpSession session =  request.getSession();
        WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");        
        String seq = code.getWriterSeq();
        vo.setWriterCodeSeq(seq);
        artvo.setWriterCodeSeq(seq);
        
        PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		vo.setCountPerPage(3);

		pc.setArticleTotalCount(service.getArtCount(vo));
		List<WriterArtVO> artList  = service.getRecommendSelect(vo);
		System.out.println(vo);
		
		model.addAttribute("artList", artList);
		System.out.println(artList);
		model.addAttribute("pc", pc);
		List<WriterArtVO> tempList = service.getRecommendSelectTemp(artvo);
	        
		model.addAttribute("tempList", tempList);
		System.out.println(tempList);
		return "wrecommend/recommendWriter";
	}
	@PostMapping("getTempUpdate")
	public @ResponseBody String getTempUpdate(@RequestParam String[] seq, WriterArtVO vo, HttpServletRequest request,Model model) {
		System.out.println("tempUpdate");
		System.out.println(seq);
		System.out.println(seq[1]);
		vo.setTemp(seq[1]);
		vo.setArtCodeSeq(seq[0]);
	
		String artCodeSeq = vo.getArtCodeSeq();
		System.out.println(vo.getTemp());
			if(vo.getTemp().equals("Y")) {	
				System.out.println("들어옴");
				service.getTempUpdateN(artCodeSeq);
				System.out.println(artCodeSeq);
			}else {
				service.getTempUpdate(artCodeSeq);
		}
			
		
		
		return "wrecommend/recommendWriter";
	}
	@PostMapping("getRecommendSelectTemp")
	public String getRecommendSelectTemp(WriterArtVO vo, HttpServletRequest request,Model model) {
		HttpSession session =  request.getSession();
        WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");        
        String seq = code.getWriterSeq();
        vo.setWriterCodeSeq(seq);
		
       
		return "wrecommend/recommendWriter";
	}
	@PostMapping("checkArtList")
	public @ResponseBody String checkArtList(Model model,HttpServletRequest request) {
		System.out.println("int 들어옴");
		HttpSession session =  request.getSession();
        WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");        
        String writerCodeSeq = code.getWriterSeq();
        System.out.println(writerCodeSeq);
        int count = service.checkArtList(writerCodeSeq);
        String price = Integer.toString(count * 3000);
        return price;
	}
	
	@PostMapping("recommendUp")
	public @ResponseBody String recommendUp(@RequestParam(value="count") String count, HttpServletRequest request) {
		System.out.println("count : " + count);
		int price = Integer.parseInt(count) * 3000;
		
		
		HttpSession session =  request.getSession();
        WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");        
        String writerCodeSeq = code.getWriterSeq();
        
        List<Integer> sum = service.getGemSum(writerCodeSeq);
        int total=0;
        for(int i : sum) {
        	total += i;
        }
        if(price > total) {
        	return "fail";
        }else {
        	int dbPrice = Integer.parseInt(count) * (-3000);
        	String gemStr = "추천작품 등록으로 젬포인트 차감 ( "+ count +" 개)";
        	HashMap<String, Object> map = new HashMap<String, Object>();
        	map.put("writerCode", writerCodeSeq);
        	map.put("price", dbPrice);
        	map.put("gemStr", gemStr);
        	service.insertGem(map);
        	service.recommendUp(writerCodeSeq);
        	service.getTempUpdateReN(writerCodeSeq);
        	return "success";
        }
        
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
