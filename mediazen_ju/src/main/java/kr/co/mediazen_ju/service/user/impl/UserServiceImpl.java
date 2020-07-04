package kr.co.mediazen_ju.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.mediazen_ju.common.Search;
import kr.co.mediazen_ju.service.domain.User;
import kr.co.mediazen_ju.service.user.UserDAO;
import kr.co.mediazen_ju.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	@Autowired
	@Qualifier("userDAOImpl")
	private UserDAO userDAO;
	private void setUserDAO(UserDAO userDAO){
		this.userDAO = userDAO;
	}
	
	public UserServiceImpl(){
	}
	
	@Override	//회원의 상세정보를 호출한다.
	public User getUser(String userId) throws Exception {
		User user = userDAO.getUser(userId);
		return user;
	}

	@Override	//회원의 ID만 호출한다.
	public String findID(User user) throws Exception {
		String id = userDAO.findID(user);
		return id;
	}

	@Override	//회원의 비밀번호를 호출한다. (호출 후 display 금지, 바로 changePassword 로)
	public User findPassword(User user) throws Exception {
		User findUser = userDAO.findPassword(user);
		return findUser;
	}

	@Override	//비밀번호를 변경한다.
	public void changePassword(User user) throws Exception {
		userDAO.changePassword(user);
	}

	@Override	//모든 회원 ID, 이름, 회원 팀 식별자 를 가져온다 (teamList를 위함)
	public List<User> getUserListForTeam() throws Exception {
		List<User> list = userDAO.getUserListForTeam();
		return list;
	}

	@Override	//해당 팀에 속하는 회원의 정보를 가져온다.
	public List<User> getUserListForGetTeam(int teamNo) throws Exception {
		List<User> list = userDAO.getUserListForGetTeam(teamNo);
		return list;
	}

	@Override	//회원가입 한다.
	public void createUser(User user) throws Exception {
		userDAO.createUser(user);
	}

	@Override
	public Map<String, Object> userList(Search search) throws Exception {
		List<User> list = userDAO.userList(search);
		int totalCount = userDAO.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("totalCount", totalCount);
		return map;
	}
}
