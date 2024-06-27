package common;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import dao.ProductDAO;
import vo.ProductVO;

public class Common {

	// SHOP과 관련된 경로(product)
	public static class Visit_shop {
		public static final String VIEW_PATH = "/WEB-INF/views/shop/";
	}

	//board 경로
	
	public static class Visit_board {
		public static final String VIEW_PATH = "/WEB-INF/views/board/";
	}
	
	// faq과 관련된 경로
	public static class Visit_faq {
		public static final String VIEW_PATH = "/WEB-INF/views/board/faq/";
	}

	// 공지와 관련된 경로
	public static class Visit_notice {
		public static final String VIEW_PATH = "/WEB-INF/views/board/notice/";
	}

	// 문의 관련된 경로
	public static class Visit_inquire {
		public static final String VIEW_PATH = "/WEB-INF/views/board/inquire/";
	}

	// 현준님 마이페이지 주소
	public static class Store {
		public static final String VIEW_PATH = "/WEB-INF/views/mypage/";

	}

	// 준희님
	//메인페이지
	public static class main {
		public static final String VIEW_PATH = "/WEB-INF/views/main/";
	}
	//메뉴
	public static class index {
		public static final String VIEW_PATH = "/WEB-INF/views/index/";
	}
	public static class detail{
		public static final String VIEW_PATH = "/WEB-INF/views/detail/";
	}
	//홍경님
	public static class Login {
		public static final String VIEW_PATH = "/WEB-INF/views/login/";

	}

}
