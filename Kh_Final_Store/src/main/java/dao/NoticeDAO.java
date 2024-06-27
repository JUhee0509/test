package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.NoticeVO;

public class NoticeDAO {

	SqlSession sqlSession;

	// setter
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체글 조회
	public List<NoticeVO> selectlist() {
		List<NoticeVO> list = sqlSession.selectList("n.notice_list");
		return list;
	}

	// 상세글 조회
	public NoticeVO selectOne(int idx) {
		System.out.println("dao : "+idx);
		NoticeVO vo = sqlSession.selectOne("n.notice_one", idx);
		return vo;
	}

}
