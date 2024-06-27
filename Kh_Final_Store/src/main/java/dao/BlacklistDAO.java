package dao;

import org.apache.ibatis.session.SqlSession;

public class BlacklistDAO {
	SqlSession sqlSession;
	public BlacklistDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
