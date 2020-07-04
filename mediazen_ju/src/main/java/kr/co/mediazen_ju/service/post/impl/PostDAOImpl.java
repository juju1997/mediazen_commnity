package kr.co.mediazen_ju.service.post.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.co.mediazen_ju.service.post.PostDAO;

@Repository("postDAOImpl")
public class PostDAOImpl implements PostDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	private void setSqlSession(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public PostDAOImpl(){
		super();
	}
}
