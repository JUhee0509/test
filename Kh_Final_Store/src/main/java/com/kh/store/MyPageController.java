package com.kh.store;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.CartDAO;
import dao.ConsumerDAO;
import dao.OrderdetailDAO;
import dao.ProductDAO;
import vo.ConsumerVO;
@Controller
public class MyPageController {
	//현준. myinfo
	ConsumerDAO consumer_dao;
	
	OrderdetailDAO orderdetail_dao;
	
	ProductDAO product_dao;
	
	CartDAO cart_dao;
	
	// 생성자
	public void setConsumer_dao(ConsumerDAO consumer_dao) {
		this.consumer_dao = consumer_dao;
	}
	
	public void setOrderdetail_dao(OrderdetailDAO orderdetail_dao) {
		this.orderdetail_dao = orderdetail_dao;
	}
	
	public void setCart_dao(CartDAO cart_dao) {
		this.cart_dao = cart_dao;
	}
	
	public void setProduct_dao(ProductDAO product_dao) {
		this.product_dao = product_dao;
	}
	
	
	//마이페이지 출력 매핑 변경했습니다.
	@RequestMapping("/mylist.do")
	public String list(Model model) {
		List<ConsumerVO> list = consumer_dao.selectList();
		model.addAttribute("list", list);
		return Common.Store.VIEW_PATH + "mypage.jsp";
	}
	
	
	
	 
}
