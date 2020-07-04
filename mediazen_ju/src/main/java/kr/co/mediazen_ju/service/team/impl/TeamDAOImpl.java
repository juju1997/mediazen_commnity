package kr.co.mediazen_ju.service.team.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import kr.co.mediazen_ju.service.domain.Team;
import kr.co.mediazen_ju.service.team.TeamDAO;

@Repository("teamDAOImpl")
public class TeamDAOImpl implements TeamDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	private void setSqlSession(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	
	public TeamDAOImpl(){
		super();
	}
	
	
	@Override	//팀 생성
	public void teamGeneration(Team team) throws Exception {
		sqlSession.insert("TeamMapper.teamGeneration",team);
	}

	@Override	//모든 팀 목록 호출
	public List<Team> teamList() throws Exception {
		List<Team> list = sqlSession.selectList("TeamMapper.teamList");
		return list;
	}

	@Override	//팀 상세 정보 호출 (Master가 있을 때)
	public Team getTeam(int teamNo) throws Exception {
		Team team = sqlSession.selectOne("TeamMapper.getTeam", teamNo);
		return team;
	}
	
	@Override	//팀 상세 정보 호출 (Master가 없을 때)
	public Team getTeamForNull(int teamNo) throws Exception {
		Team team = sqlSession.selectOne("TeamMapper.getTeamForNull", teamNo);
		return team;
	}

	@Override	//팀 삭제
	public void deleteTeam(int teamNo) throws Exception {
		sqlSession.delete("TeamMapper.deleteTeam", teamNo);
	}

}
