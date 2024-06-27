package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MdVO;

public class MdDAO {
	
	SqlSession sqlSession;
	
	public MdDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	public List<MdVO> selectList(){ 
	List<MdVO> list = sqlSession.selectList("m.md_list"); 
	return list; }
}
