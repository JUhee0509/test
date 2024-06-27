package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ConsumerVO;

public class ConsumerDAO {
	SqlSession sqlSession;
	public ConsumerDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//마이페이지 정보 조회
	public List<ConsumerVO> selectList(){
		List<ConsumerVO> list = sqlSession.selectList("c.mypage_list");
		return list;
	}
	
	//아이디 중복 확인 메서드
	public ConsumerVO selectOne(String c_id) {
			ConsumerVO vo = sqlSession.selectOne("c.check_id", c_id);
			return vo;
		}
		
	//회원가입 정보 저장 메서드
		public int insert(ConsumerVO vo) {
			int res = sqlSession.insert("c.insert_user", vo);
			return res;
		}
		
		 
}
