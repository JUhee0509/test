package com.kh.store;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.MdDAO;
import dao.ProductDAO;
import vo.MdVO;
import vo.ProductVO;

@Controller
public class mdController {
	
	@Autowired
	HttpServletRequest request;
	
	MdDAO Md_dao;
	ProductDAO product_dao;
	public mdController(MdDAO Md_dao, ProductDAO product_dao) {
		this.Md_dao = Md_dao;
		this.product_dao = product_dao;
	}
	
	
	@RequestMapping(value = {"/","/main.do"})
	public String list(Model model) {
		
		List<MdVO> list = Md_dao.selectList();
		
		model.addAttribute("list", list);
		//포워딩
		return Common.main.VIEW_PATH + "product_list.jsp";
	}
	
	
	 @RequestMapping("/view.do") 
	 public String view(Model model, int p_idx) {
	 
	 ProductVO vo = product_dao.selectOne(p_idx);
	 
	 //바인딩 
	 request.setAttribute("vo", vo);
	 
	 //포워딩 
	 return Common.detail.VIEW_PATH + "view.jsp";
	 
	 }
}
