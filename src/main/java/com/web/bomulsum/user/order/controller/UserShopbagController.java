package com.web.bomulsum.user.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.user.order.repository.UserShopbagModalVO;
import com.web.bomulsum.user.order.repository.UserShopbagOptionVO;
import com.web.bomulsum.user.order.repository.UserShopbagVO;
import com.web.bomulsum.user.order.service.UserShopbagService;

@Controller
@RequestMapping(value="/user")
public class UserShopbagController {
	
	@Autowired
	UserShopbagService service;

	@RequestMapping(value="/shopbag")
	public ModelAndView goShopbag(HttpServletRequest request) {
		ModelAndView mav= new ModelAndView("ushopbag/ushopbag");
		
		//회원 코드 가져오기
		 HttpSession session = request.getSession(); 
		 String memberCode = (String)session.getAttribute("member"); 
		 System.out.println(memberCode);
		
		 //장바구니 값 가져오기
		List<UserShopbagVO> shopbagInfo = service.getShopbagInfo(memberCode);
		
		//장바구니 세부 내용 설정
		for(int i=0; i<shopbagInfo.size(); i++) {
			UserShopbagVO tempVO = shopbagInfo.get(i);
			String[] artOption= shopbagInfo.get(i).getArt_option_seq().split("#");
			
			String[] photoArray = tempVO.getArt_photo().split(",");
			tempVO.setArt_photo(photoArray[0]);
			
			String[] countArray = tempVO.getArt_count().split(",");
			tempVO.setArtCount(countArray);
			List<Map<String,Object>> totalOption = new ArrayList<Map<String,Object>>();
			
			if(tempVO.getWriter_brand_name() == null) {
				tempVO.setWriter_brand_name(tempVO.getWriter_name());
			}
			
			int totalPrice = 0;
			//옵션 잘라서 넣기
			for(int j=0; j<artOption.length; j++) {
				int sum = 0;
				int totalSum = 0;
				
				Map<String,Object> optionMap = new HashMap<String,Object>();
				List<UserShopbagOptionVO> optionList = new ArrayList<UserShopbagOptionVO>();
				String[] artOptionDetail = artOption[j].split(",");
				
				optionMap.put("artCount",countArray[j]);
				for(int k=0; k<artOptionDetail.length; k++) {
					UserShopbagOptionVO vo = service.getOptionInfo(artOptionDetail[k]);
					optionList.add(vo);
					sum += optionList.get(k).getArt_option_price();
				}
				totalSum = (tempVO.getArt_discount() + sum) * Integer.parseInt(tempVO.getArtCount()[j]);
				optionMap.put("totalSum", totalSum);
				optionMap.put("optionArray", optionList);
				totalOption.add(optionMap);
				totalPrice +=(int) totalOption.get(j).get("totalSum");
			}
			tempVO.setTotalPrice(totalPrice);
			tempVO.setTotalOption(totalOption);
			shopbagInfo.remove(i);
			shopbagInfo.add(i, tempVO);
		}
		
		System.out.println(shopbagInfo);
		
		mav.addObject("shopbagInfo", shopbagInfo);
		return mav;
	} 
	
	// 장바구니 상세 내용
	@ResponseBody
	@RequestMapping(value="/shopbagModal", method=RequestMethod.POST)
	public List<UserShopbagModalVO> goshopbagModal(
			@RequestParam(value="cart") String cartCode, @RequestParam(value="index") int index) {
		String selectedOption = service.selectOption(cartCode);
		String[] options = selectedOption.split("#");
		String nowOption = options[index];
		String[] artOption = nowOption.split(",");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cart", cartCode);
		
		List<UserShopbagModalVO> modalInfo = service.goShopbagModal(map);
		String[] photo = modalInfo.get(0).getArt_photo().split(",");
		modalInfo.get(0).setArt_photo(photo[0]);
		modalInfo.get(0).setIndex(index);
		
		List<UserShopbagOptionVO> optionList = service.getOptionListInfo(artOption);
		switch(optionList.size()) {
		case 3:
			modalInfo.get(0).setArt_option_category3(optionList.get(2).getArt_option_category());
			modalInfo.get(0).setArt_option_name3(optionList.get(2).getArt_option_name());
			modalInfo.get(0).setArt_option_price3(optionList.get(2).getArt_option_price());
		case 2:
			modalInfo.get(0).setArt_option_category2(optionList.get(1).getArt_option_category());
			modalInfo.get(0).setArt_option_name2(optionList.get(1).getArt_option_name());
			modalInfo.get(0).setArt_option_price2(optionList.get(1).getArt_option_price());
		case 1:
			modalInfo.get(0).setArt_option_category1(optionList.get(0).getArt_option_category());
			modalInfo.get(0).setArt_option_name1(optionList.get(0).getArt_option_name());
			modalInfo.get(0).setArt_option_price1(optionList.get(0).getArt_option_price());
			break;
		default :
		}
		System.out.println("modalInfo"+ modalInfo);
		
		
		return modalInfo;
	}
	
	//옵션 상세 내용
	@ResponseBody
	@RequestMapping(value="/shopbagOptionModal", method=RequestMethod.POST)
	public List<UserShopbagOptionVO> goshopbagOptionModal(@RequestParam(value="art") String artCode) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("art", artCode);
		List<UserShopbagOptionVO> optionModalInfo = service.goShopbagOptionModal(map);
			return optionModalInfo;
		}
	
	
	//요청사항 저장
	@ResponseBody
	@RequestMapping(value="/shopbagRequest", method=RequestMethod.POST)
	public void goshopbagRequest( @RequestParam(value="request") String requestCon,	@RequestParam(value="cart") String cartCode) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("request", requestCon);
		map.put("cart", cartCode);
		service.goOrderRequest(map);
	}
	
	//선택한 작품 개수 변화
	@ResponseBody
	@RequestMapping(value="/shopbagChangeCount", method=RequestMethod.POST)
	public void goshopbagPlusCount( @RequestParam(value="count") String changeCount, @RequestParam(value="cart") String cartCode,
			@RequestParam(value="index") int index) {
		String artCount = service.getArtCount(cartCode);
		String[] countArray = artCount.split(",");
		countArray[index] =changeCount;
		
		String counts = null;
		for(int i=0; i<countArray.length; i++) {
			String temp = countArray[i];
			counts += temp+",";
		}
		String result = counts.substring(4);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("count", result);
		map.put("cart", cartCode);
		service.goArtCount(map);
	}
		
	//옵션 삭제
	@ResponseBody
	@RequestMapping(value="/shopbagDelete", method=RequestMethod.POST)
	public void goshopbagDelete( @RequestParam(value="cart") String cartCode, 
			@RequestParam(value="index") int index) {
		String selectedOption = service.selectOption(cartCode);
		String[] options = selectedOption.split("#");
		
		if(options.length == 1) {
			service.deleteArt(cartCode);
		}
		else if(options.length >1) {
			List<String> list = new ArrayList<String>();
			for (int i = 0; i < options.length; i++) {
				list.add(options[i]);
			}
			list.remove(index);
			String updateOptions = null;
			for(int j=0; j<list.size(); j++) {
				updateOptions += (list.get(j)+"#");
			}
			String optionUpdates = updateOptions.substring(4);
		
			String artCount = service.getArtCount(cartCode);
			String[] countArray = artCount.split(",");
			List<String> countlist = new ArrayList<String>();
			for (int k = 0; k < countArray.length; k++) {
				countlist.add(countArray[k]);
			}
			countlist.remove(index);
			String countTemp = null;
			for(int l=0; l<countlist.size(); l++) {
				countTemp += (countlist.get(l)+",");
			}
			String updateCounts = countTemp.substring(4);

			HashMap<String, String> map = new HashMap<String, String>();
			map.put("cart", cartCode);
			map.put("option", optionUpdates);
			map.put("count", updateCounts);
			service.updateOption(map);
		}
	}
	
	//선택 삭제
	@ResponseBody
	@RequestMapping(value="/deleteChoice")
	public void deleteChoice( @RequestParam(value="cart[]") String[] cartCheck, HttpServletRequest request) {
		service.deleteChoice(cartCheck);
	}
	
	//옵션 변경
	 @ResponseBody
	 @RequestMapping(value="/shopbagUpdateOption", method=RequestMethod.POST)
	  public void goshopbagUpdateOption( @RequestParam(value="optionCode[]") String[] optionCode,
			  @RequestParam(value="cart") String cartCode, @RequestParam(value="count") String count,
			  @RequestParam(value="index") int index ) { 
		 
		String selectedOption = service.selectOption(cartCode);
		String[] options = selectedOption.split("#");
		String tempOption = null;
		for(int i=0; i<optionCode.length; i++) {
			tempOption +=(optionCode[i]+",");
		}
		String updateOption = tempOption.substring(4);
		options[index]=updateOption;
		String temp = null;
		for(int j=0; j<options.length; j++) {
			temp +=(options[j]+"#");
		}
		String selectedUpdateOption = temp.substring(4);
		
		String countsList = service.getArtCount(cartCode);
		String[] countArray = countsList.split(",");
		countArray[index] = count;
		String tempCount = null;
		for(int k=0; k<countArray.length; k++) {
			tempCount +=(countArray[k]+",");
		}
		String updateCount = tempCount.substring(4);
		System.out.println(updateCount);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cart", cartCode);
		map.put("count", updateCount);
		map.put("option", selectedUpdateOption);
		service.updateOption(map);
	 }
	 
	 //장바구니 카운트
	 @ResponseBody
	 @RequestMapping(value="/shopbagCount", method=RequestMethod.POST)
	public String shopbagCount( @RequestParam(value="member") String member) {
		 String shopbagCount = service.shopbagCount(member);
		return shopbagCount;
		} 
		

	 
}
