package kr.co.mediazen_ju.service.user;

import java.util.List;

import kr.co.mediazen_ju.common.Search;
import kr.co.mediazen_ju.service.domain.User;

public interface UserDAO {
	
	//회원의 상세정보를 호출한다.
	public User getUser(String userId) throws Exception;
	
	//회원의 ID만 호출한다.
	public String findID(User user) throws Exception;
	
	//회원의 비밀번호를 호출한다. (호출 후 display 금지, 바로 changePassword 로)
	public User findPassword(User user) throws Exception;
	
	//비밀번호를 변경한다.
	public void changePassword(User user) throws Exception;
	
	//모든 회원 ID, 이름, 회원 팀 식별자 를 가져온다 (teamList를 위함)
	public List<User> getUserListForTeam() throws Exception;
	
	//해당 팀에 속하는 회원의 정보를 가져온다.
	public List<User> getUserListForGetTeam(int teamNo) throws Exception;
	
	//회원가입 한다.
	public void createUser(User user) throws Exception;
	
	//회원 목록을 조회한다.
	public List<User> userList(Search search) throws Exception;
	
	//회원의 총 수량을 조회한다.
	public int getTotalCount(Search search) throws Exception;
}
