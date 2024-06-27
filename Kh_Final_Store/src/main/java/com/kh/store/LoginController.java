package com.kh.store;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.Common;
import dao.ConsumerDAO;
import service.MailSendService;
import vo.ConsumerVO;

@Controller
public class LoginController {

	// 홍경
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	//고객 DAO생성자,이메일 생성자
	ConsumerDAO consumer_dao;
	MailSendService mss;
	
	public LoginController(ConsumerDAO consumer_dao, MailSendService mss) {
		this.consumer_dao = consumer_dao;
		this.mss = mss;
	}
	//--------------------------홈페이지 메인 페이지
	@RequestMapping("login_success_mainGO.do")
	public String StoreMain() {
		return Common.main.VIEW_PATH + "product_list.jsp";
	}
	
	//--------------------------로그인 메인 페이지
	@RequestMapping("/login_main.do")
	public String Main() {
		return Common.Login.VIEW_PATH + "login.jsp";
	}

	//--------------------------로그인을 위한 페이지
	@RequestMapping("/login_form.do")
	public String LoginForm() {
		return Common.Login.VIEW_PATH + "login.jsp";
	}
	
	@RequestMapping(value = "/login.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String Login(String c_id, String pwd) {
		ConsumerVO storeUser = consumer_dao.selectOne(c_id);
		
		String resultStr = "";
		String result = "";
		
		//로그인 아이디가 없을 때
		if(storeUser == null) {
			result = "no_id";
			resultStr = String.format("[{'result':'%s'}]", result);
			return resultStr;
		}
		
		//비밀번호가 일치하지 않을때
		if(!storeUser.getPwd().equals(pwd)) {
			result = "no_pwd";
			resultStr = String.format("[{'result':'%s','c_id':'%s'}]", result, c_id);
			return resultStr;
		}
		
		session = request.getSession();
		session.setAttribute("storeUser", storeUser);
		
		//로그인 성공했을 때
		result = "success";
		resultStr = String.format("[{'result':'%s'}]", result);
		return resultStr;
	}

	//--------------------------회원가입을 위한 페이지
	@RequestMapping("/member_join_form.do")
	public String MemberJoinForm() {
		return Common.Login.VIEW_PATH + "join.jsp";
	}

	//--------------------------아이디 중복체크 메서드
	@RequestMapping("/duplicate_checkID.do")
	@ResponseBody
	public String MemberJoinCheckID(String c_id) {
		ConsumerVO vo = new ConsumerVO();
		vo.setC_id(c_id);
		System.out.println(c_id);

		ConsumerVO userID_Check = consumer_dao.selectOne(c_id);
		System.out.println("userID_Check = " + userID_Check);
		// 입력한 id가 사용 가능할 때
		if (userID_Check == null) {
			return "[{'param':'sucess'}]";
		} else {
			return "[{'param':'fail'}]";
		}

	}

	//-----------------------이메일 인증번호 메서드
	@RequestMapping("/mailCheck.do")
	@ResponseBody
	public String emailCheck(String email) {
		System.out.println("인증요청 받음 : " + email );
		String res = mss.joinEmail(email);
		return res;
	}
	
	//----------------------회원가입 전제정보 저장 메서드
	//produces="application/json;charset=UTF-8"
	//매핑 앞에 value값을 넣어주고 위의 코드를 추가해 줘야 
	//json으로 넘어올 때 한글 오류가 안난다.
	@RequestMapping(value="/join_insert.do",  produces="application/json;charset=UTF-8")
	@ResponseBody
	public String joinResult(ConsumerVO vo) {
		System.out.println("con : "+vo.getC_id());
		int res = consumer_dao.insert(vo);
		
		System.out.println("res = " + res);
		System.out.println("회원가입 이메일= " + vo.getEmail());
		
		String resultStr = "";
		String result = "fail";
		
		System.out.println("name=" + vo.getName());
		
		if(res == 1) {
			result = "success";
		}
		resultStr = 
			String.format("[{'result':'%s','name':'%s'}]", result, vo.getName());
		return resultStr;
	}
}

















