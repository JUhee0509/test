package dao;

import org.apache.ibatis.session.SqlSession;

public class PickDAO {
	SqlSession sqlSession;
	public PickDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
