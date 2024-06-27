package com.kh.store;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.NoticeDAO;
import vo.NoticeVO;

@Controller
public class NoticeController {

	//지현. 공지사항
	@Autowired
	HttpServletRequest request;

	NoticeDAO notice_dao;

	// setter
	public void setNotice_dao(NoticeDAO notice_dao) {
		this.notice_dao = notice_dao;
	}

	// 공지사항 첫 페이지 전체 목록 출력
	@RequestMapping("/notice.do")
	public String notice_list(Model model) {
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		list = notice_dao.selectlist();
		model.addAttribute("list", list);
		return Common.Visit_notice.VIEW_PATH + "notice.jsp";
	}

	// 공지사항 상세보기
	@RequestMapping("/notice_view.do")
	public String notice_view(int idx, Model model) {
		NoticeVO vo = notice_dao.selectOne(idx);
		model.addAttribute("vo", vo);
		return Common.Visit_notice.VIEW_PATH + "notice_view.jsp";
	}
	
	//board 메뉴 이동. 추후 수정예정
	@RequestMapping("/board.do")
	public String board() {
		return Common.Visit_board.VIEW_PATH+"board.jsp";
	}
}
