package com.kh.store;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.InquireDAO;
import vo.InquireVO;

@Controller
public class InquireController {

	//지현
	InquireDAO inq_dao;

	// setter
	public void setInq_dao(InquireDAO inq_dao) {
		this.inq_dao = inq_dao;
	}

	// 전체글 조회
	@RequestMapping("/inquire.do")
	public String selectlist(Model model) {
		List<InquireVO> list = new ArrayList<InquireVO>();
		list = inq_dao.selectlist();
		model.addAttribute("list", list);
		return Common.Visit_inquire.VIEW_PATH + "inquire.jsp";
	}

	// 상세보기
	@RequestMapping("/inquire_view.do")
	public String inqurie_view(int i_idx, Model model) {
		InquireVO vo = inq_dao.selectOne(i_idx);
		model.addAttribute("vo", vo);
		return Common.Visit_inquire.VIEW_PATH + "inquire_view.jsp";
	}

	// 문의글 작성 jsp 이동
	@RequestMapping("/inquire_write.do")
	public String inquire_write() {
		return Common.Visit_inquire.VIEW_PATH + "inquire_write.jsp";
	}

	// 문의글 작성(DB등록)
	@RequestMapping("/inq.do")
	public String inquire_fin(InquireVO vo) {
		inq_dao.inq_insert(vo);
		return "redirect:inquire.do";
	}

	// 문의글 수정(답변완료 후에는 막아놓기)
	@RequestMapping("/inq_modify.do")
	public String inq_modify(int i_idx, Model model) {
		InquireVO vo = inq_dao.selectOne(i_idx);
		model.addAttribute("vo", vo);
		return Common.Visit_inquire.VIEW_PATH + "inq_modify.jsp";
	}

	// 문의글 수정
	@RequestMapping("/inq_modify_fin")
	public String inq_modify_fin(InquireVO vo) {
		inq_dao.inq_update(vo);
		return "redirect:inquire.do";
	}

}
