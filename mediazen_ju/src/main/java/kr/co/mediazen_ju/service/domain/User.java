package kr.co.mediazen_ju.service.domain;

import java.sql.Date;

public class User {
	
	//사용자 ID
	private String userId;
	//팀 식별자
	private int userTeamNo;
	//정보 찾기용 식별코드
	private int findCode;
	//휴대폰 번호
	private int phone;
	//비밀번호
	private String password;
	//이름
	private String name;
	//성별(1:남자, 2:여자)
	private int gender;
	//생일
	private Date birth;
	//사용자 권한(1:일반회원, 2:관리자)
	private int role;
	//삭제현황(1:정상, 2:삭제)
	private int deleteStatuts;
	//프로필 사진 파일명
	private String profileFileName;
	//자기소개
	private String selfIntroduction;
	//입사일
	private Date joinDate;
	
	public User(){
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getUserTeamNo() {
		return userTeamNo;
	}

	public void setUserTeamNo(int userTeamNo) {
		this.userTeamNo = userTeamNo;
	}

	public int getFindCode() {
		return findCode;
	}

	public void setFindCode(int findCode) {
		this.findCode = findCode;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public int getDeleteStatuts() {
		return deleteStatuts;
	}

	public void setDeleteStatuts(int deleteStatuts) {
		this.deleteStatuts = deleteStatuts;
	}

	public String getProfileFileName() {
		return profileFileName;
	}

	public void setProfileFileName(String profileFileName) {
		this.profileFileName = profileFileName;
	}

	public String getSelfIntroduction() {
		return selfIntroduction;
	}

	public void setSelfIntroduction(String selfIntroduction) {
		this.selfIntroduction = selfIntroduction;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userTeamNo=" + userTeamNo + ", findCode=" + findCode + ", phone=" + phone
				+ ", password=" + password + ", name=" + name + ", gender=" + gender + ", birth=" + birth + ", role="
				+ role + ", deleteStatuts=" + deleteStatuts + ", profileFileName=" + profileFileName
				+ ", selfIntroduction=" + selfIntroduction + ", joinDate=" + joinDate + "]";
	}
	
	
	
	
}
