package kr.co.mediazen_ju.service.comment.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.apache.ibatis.session.SqlSession;

import kr.co.mediazen_ju.service.comment.CommentDAO;

@Repository("commentDAOImpl")
public class CommentDAOImpl implements CommentDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	private void setSqlSession(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public CommentDAOImpl(){
		super();
	}
}
