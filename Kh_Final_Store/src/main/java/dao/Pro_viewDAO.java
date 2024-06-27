package dao;

import org.apache.ibatis.session.SqlSession;

public class Pro_viewDAO {
	// 삭제바람
	SqlSession sqlSession;

	// setter
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

}
