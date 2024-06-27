package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestMapping;

import vo.ProductVO;

public class ProductDAO {

	SqlSession sqlSession;

	// setter
	public ProductDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체목록 조회
	public List<ProductVO> selectlist() {
		List<ProductVO> list = sqlSession.selectList("pd.product_list");
		return list;
	}

	// 분류 기준 조회
	public List<String> v_select(String st) {
		List<String> list = sqlSession.selectOne("pd.prod_view", st);
		return list;
	}
	public ProductVO selectOne(int p_idx) {
		ProductVO vo = sqlSession.selectOne("pd.pro_view", p_idx);
		return vo;
	}
}
