package kr.co.mediazen_ju.service.domain;

public class Team {
	
	//팀 식별자
	private int teamNo;
	//팀장 ID
	private String master;
	//팀장 이름
	private String masterName;
	//팀 이름
	private String teamName;
	//팀 소개
	private String teamIntroduction;
	//팀 대표 사진
	private String teamProfileName;
	
	public Team(){
	}

	public int getTeamNo() {
		return teamNo;
	}

	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}

	public String getMaster() {
		return master;
	}

	public void setMaster(String master) {
		this.master = master;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getTeamIntroduction() {
		return teamIntroduction;
	}

	public void setTeamIntroduction(String teamIntroduction) {
		this.teamIntroduction = teamIntroduction;
	}

	public String getTeamProfileName() {
		return teamProfileName;
	}

	public void setTeamProfileName(String teamProfileName) {
		this.teamProfileName = teamProfileName;
	}

	public String getMasterName() {
		return masterName;
	}

	public void setMasterName(String masterName) {
		this.masterName = masterName;
	}

	@Override
	public String toString() {
		return "Team [teamNo=" + teamNo + ", master=" + master + ", masterName=" + masterName + ", teamName=" + teamName
				+ ", teamIntroduction=" + teamIntroduction + ", teamProfileName=" + teamProfileName + "]";
	}

	
	
	
	
}
