package dao;


import org.apache.ibatis.session.SqlSession;




public class OrderdetailDAO {
	SqlSession sqlSession;
	public OrderdetailDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
}
