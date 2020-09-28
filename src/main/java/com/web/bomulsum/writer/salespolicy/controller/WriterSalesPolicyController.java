package com.web.bomulsum.writer.salespolicy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.bomulsum.writer.login.repository.WriterRegisterVO;
import com.web.bomulsum.writer.salespolicy.repository.WriterSalesPolicyVO;
import com.web.bomulsum.writer.salespolicy.service.WriterSalesPolicyService;

@Controller
@RequestMapping(value = "/writer")
public class WriterSalesPolicyController {
	@Autowired
	WriterSalesPolicyService service;

	// -----------------------판매정책-------------------------
	@RequestMapping(value = "/salespolicy")
	public ModelAndView salespolicy(HttpServletRequest request) {
		// 작가seq 세션받아오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		String seq = code.getWriterSeq();
		System.out.println("작가seq:" + seq);

		ModelAndView mav = new ModelAndView("/waccount/salesPolicy");

		WriterSalesPolicyVO result = service.getSalesPolicy(seq);
		mav.addObject("salespolicy", result);

		return mav;
	}

	@RequestMapping(value = "/updateSalespolicy", method = RequestMethod.POST)
	public ModelAndView writerUpdateSalespolicy(WriterSalesPolicyVO vo, HttpServletRequest request) {
		// 작가seq 세션받아오기
		HttpSession session = request.getSession();
		WriterRegisterVO code = (WriterRegisterVO) session.getAttribute("writer_login");
		String seq = code.getWriterSeq();
		vo.setWriterCodeSeq(seq);
		
		System.out.println(vo.toString());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/writer/salespolicy.wdo");
		service.updateSalesPolicy(vo);
		return mav;
	}

}
