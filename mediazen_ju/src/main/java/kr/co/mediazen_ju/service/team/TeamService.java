package kr.co.mediazen_ju.service.team;

import java.util.List;

import kr.co.mediazen_ju.service.domain.Team;

public interface TeamService {

	//팀 생성
	public void teamGeneration(Team team) throws Exception;
		
	//모든 팀 목록 호출
	public List<Team> teamList() throws Exception;
		
	//팀 상세 정보 호출 (Master가 있을 때)
	public Team getTeam(int teamNo) throws Exception;
		
	//팀 상세 정보 호출 (Master가 없을 때)
	public Team getTeamForNull(int teamNo) throws Exception;
		
	//팀 삭제
	public void deleteTeam(int teamNo) throws Exception;
}
