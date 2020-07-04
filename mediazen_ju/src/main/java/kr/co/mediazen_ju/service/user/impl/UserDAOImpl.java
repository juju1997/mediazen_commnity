package kr.co.mediazen_ju.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.mediazen_ju.common.Search;
import kr.co.mediazen_ju.service.domain.User;
import kr.co.mediazen_ju.service.user.UserDAO;

@Repository("userDAOImpl")
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	private void setSqlSession(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	
	public UserDAOImpl(){
		super();
	}

	@Override	//회원의 상세정보를 호출한다.
	public User getUser(String userId) throws Exception {
		User user = sqlSession.selectOne("UserMapper.getUser",userId);
		return user;
	}

	@Override	//회원의 ID만 호출한다.
	public String findID(User user) throws Exception {
		String id = sqlSession.selectOne("UserMapper.findID", user);
		return id;
	}


	@Override	//회원의 비밀번호를 호출한다. (호출 후 display 금지, 바로 changePassword 로)
	public User findPassword(User user) throws Exception {
		User findUser = sqlSession.selectOne("UserMapper.findPassword", user);
		return findUser;
	}

	@Override	//비밀번호를 변경한다.
	public void changePassword(User user) throws Exception {
		sqlSession.update("UserMapper.changePassword", user);
	}

	@Override	//모든 회원 ID, 이름, 회원 팀 식별자 를 가져온다 (teamList 를 위함)
	public List<User> getUserListForTeam() throws Exception {
		List<User> list = sqlSession.selectList("UserMapper.getUserListForTeam");
		return list;
	}

	@Override	//해당 팀에 속하는 회원의 정보를 가져온다.
	public List<User> getUserListForGetTeam(int teamNo) throws Exception {
		List<User> list = sqlSession.selectList("UserMapper.getUserListForGetTeam", teamNo);
		return list;
	}

	@Override	//회원가입 한다.
	public void createUser(User user) throws Exception {
		sqlSession.insert("UserMapper.createUser", user);
	}


	@Override	//회원목록을 조회한다.
	public List<User> userList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.userList", search);
	}


	@Override	//회원의 총 수를 조회한다.
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}
}
