package dao;

import org.apache.ibatis.session.SqlSession;

public class ReviewDAO {
	SqlSession sqlSession;
	public ReviewDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
