package com.kh.store;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;

@Controller
public class MyController {

	//현준
	// 주문 내역 상세 보기(미완)
	@RequestMapping("/detail.do")
	public String detail() {
		return Common.Store.VIEW_PATH + "orderlist_pay.jsp";
	}

	// 배송 완료 내역
	@RequestMapping("/fin.do")
	public String fin() {
		return Common.Store.VIEW_PATH + "orderlist_fin.jsp";
	}

	// 배송중 내역
	@RequestMapping("/ship.do")
	public String ship() {
		return Common.Store.VIEW_PATH + "orderlist_shipping.jsp";
	}

	// 배송 준비중 내역
	@RequestMapping("/ready.do")
	public String ready() {
		return Common.Store.VIEW_PATH + "orderlist_ready.jsp";
	}

	// 교환,환불 내역
	@RequestMapping("/refund.do")
	public String refund() {
		return Common.Store.VIEW_PATH + "orderlist_refund.jsp";
	}

	// 주소지 추가
	@RequestMapping("/addr_add.do")
	public String add() {
		return Common.Store.VIEW_PATH + ".jsp";
	}

	// 내 리뷰 페이지 이동
	@RequestMapping("/review_move.do")
	public String review_move() {
		return Common.Store.VIEW_PATH + ".jsp";
	}

	// 내 문의 페이지 이동
	@RequestMapping("/require_move.do")
	public String require_move() {
		return "redirect:inquire.do";
	}
}
