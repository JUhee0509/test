package com.kh.store;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.Pro_viewDAO;
import dao.ProductDAO;
import vo.ProductVO;

@Controller
public class ShopController {
	//지현 . SHOP
	// 컨트롤러 생성시 어노테이션 필수로 추가
	// service없다면 dao 참조, service 있다면 dao를 가지고 있는 service참조

	@Autowired
	ServletContext app;

	@Autowired
	HttpServletRequest request;


	Pro_viewDAO p_view_dao;

	ProductDAO product_dao;

	public ShopController(ProductDAO product_dao) {
		this.product_dao = product_dao;
	}
	
	

	public void setP_view_dao(Pro_viewDAO p_view_dao) {
		this.p_view_dao = p_view_dao;
	}

	// shop 페이지의 전체목록 출력
	@RequestMapping("/shop_list.do" )
	public String list(Model model) {

		List<ProductVO> list = product_dao.selectlist();
		model.addAttribute("list", list);

//		String[] arr = {"brand", "scent", "price", "volume"};
//		
//		for(int i=0;i<arr.length;i++) {
//			List<String> v_list = prod_dao.v_select(arr[i]);
//			model.addAttribute("arr[i]", v_list);
//		}

		return Common.Visit_shop.VIEW_PATH + "shop_list.jsp";
	}

	// 나중에 지울것. shop페이지로 이동
	@RequestMapping("/main.do")
	public String main() {
		return "redirect:list.do";
	}

}
