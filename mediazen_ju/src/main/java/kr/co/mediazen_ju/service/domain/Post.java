package kr.co.mediazen_ju.service.domain;

import java.sql.Date;

public class Post {
	
	//게시글 식별자
	private int postNo;
	//게시글 작성자 ID
	private String postUserId;
	//게시글 작성자 이름
	private String userName;
	//게시글 작성 카테고리 번호(1:일반게시판, 2:사진게시판)
	private int postCategoryNo;
	//게시글 제목
	private String postTitle;
	//게시글 내용
	private String postContent;
	//게시글 작성 날짜
	private Date postDate;
	//첨부된 파일 이름
	private String uploadFileName;
	//게시글 상태(1:정상, 2:삭제)
	private int viewStatus;
	//작성된 댓글 개수
	private int commentCount;
	
	public Post(){
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getPostUserId() {
		return postUserId;
	}

	public void setPostUserId(String postUserId) {
		this.postUserId = postUserId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getPostCategoryNo() {
		return postCategoryNo;
	}

	public void setPostCategoryNo(int postCategoryNo) {
		this.postCategoryNo = postCategoryNo;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public int getViewStatus() {
		return viewStatus;
	}

	public void setViewStatus(int viewStatus) {
		this.viewStatus = viewStatus;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	@Override
	public String toString() {
		return "Comment [postNo=" + postNo + ", postUserId=" + postUserId + ", userName=" + userName
				+ ", postCategoryNo=" + postCategoryNo + ", postTitle=" + postTitle + ", postContent=" + postContent
				+ ", postDate=" + postDate + ", uploadFileName=" + uploadFileName + ", viewStatus=" + viewStatus
				+ ", commentCount=" + commentCount + "]";
	}
}
