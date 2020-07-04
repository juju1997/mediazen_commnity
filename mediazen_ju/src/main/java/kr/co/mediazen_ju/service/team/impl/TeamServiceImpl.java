package kr.co.mediazen_ju.service.team.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.mediazen_ju.service.domain.Team;
import kr.co.mediazen_ju.service.team.TeamDAO;
import kr.co.mediazen_ju.service.team.TeamService;

@Service("teamServiceImpl")
public class TeamServiceImpl implements TeamService{

	@Autowired
	@Qualifier("teamDAOImpl")
	private TeamDAO teamDAO;
	private void setTeamDAO(TeamDAO teamDAO){
		this.teamDAO = teamDAO;
	}
	
	@Override	//팀 생성
	public void teamGeneration(Team team) throws Exception {
		teamDAO.teamGeneration(team);
	}
	
	@Override	//모든 팀 목록 호출
	public List<Team> teamList() throws Exception {
		List<Team> list = teamDAO.teamList();
		return list;
	}
	
	@Override	//팀 상세 정보 호출 (Master가 있을 때)
	public Team getTeam(int teamNo) throws Exception {
		Team team = teamDAO.getTeam(teamNo);
		return team;
	}
	
	@Override	//팀 상세 정보 호출 (Master가 없을 때)
	public Team getTeamForNull(int teamNo) throws Exception {
		Team team = teamDAO.getTeamForNull(teamNo);
		return team;
	}
	
	@Override	//팀 삭제
	public void deleteTeam(int teamNo) throws Exception {
		teamDAO.deleteTeam(teamNo);
	}
}
