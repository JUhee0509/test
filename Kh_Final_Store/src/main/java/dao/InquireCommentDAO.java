package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.InquirecommentVO;

public class InquireCommentDAO {
	
	SqlSession sqlSession;
	
	// setter
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//문의 댓글 조회
	public List<InquirecommentVO> selectlist(){
		List<InquirecommentVO> list = sqlSession.selectList("ic.ic_select");
		return list;
	}

	
}
