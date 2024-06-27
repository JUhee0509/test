package dao;

import org.apache.ibatis.session.SqlSession;

public class AdministratorDAO {
	SqlSession sqlSession;
	public AdministratorDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
