package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.InquireVO;

public class InquireDAO {

	SqlSession sqlSession;

	// setter
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체 게시글 조회
	public List<InquireVO> selectlist() {
		List<InquireVO> list = sqlSession.selectList("i.inquire_list");
		return list;
	}

	// 상세글 조회(글 하나 조회)
	public InquireVO selectOne(int i_idx) {
		InquireVO vo = sqlSession.selectOne("i.inquire_view", i_idx);
		return vo;
	}
	
	//문의글 수정
	public int inq_update(InquireVO vo) {
		int res = sqlSession.update("i.inquire_update", vo);
		return res;
	}
	
	//문의글 작성
	public int inq_insert(InquireVO vo) {
		int res = sqlSession.insert("i.inquire_insert",vo);
		return res;
	}

}
