package dao;

import org.apache.ibatis.session.SqlSession;

public class AddrDAO {
	SqlSession sqlSession;
	public AddrDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
