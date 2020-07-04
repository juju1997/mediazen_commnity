package kr.co.mediazen_ju.service.domain;

import java.sql.Date;

public class Comment {
	
	//댓글 식별자
	private int commentNo;
	//댓글에 해당하는 게시글 번호
	private int commentPostNo;
	//댓글 작성자 ID
	private String commentUserId;
	//댓글 작성자 이름
	private String commentUserName;
	//댓글 내용
	private String commentContent;
	//댓글 작성 날짜
	private Date commentDate;
	//댓글 상태 (1:정상, 2:삭제)
	private int commentStatus;
	
	public Comment(){
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getCommentPostNo() {
		return commentPostNo;
	}

	public void setCommentPostNo(int commentPostNo) {
		this.commentPostNo = commentPostNo;
	}

	public String getCommentUserId() {
		return commentUserId;
	}

	public void setCommentUserId(String commentUserId) {
		this.commentUserId = commentUserId;
	}

	public String getCommentUserName() {
		return commentUserName;
	}

	public void setCommentUserName(String commentUserName) {
		this.commentUserName = commentUserName;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public int getCommentStatus() {
		return commentStatus;
	}

	public void setCommentStatus(int commentStatus) {
		this.commentStatus = commentStatus;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", commentPostNo=" + commentPostNo + ", commentUserId="
				+ commentUserId + ", commentUserName=" + commentUserName + ", commentContent=" + commentContent
				+ ", commentDate=" + commentDate + ", commentStatus=" + commentStatus + "]";
	}
	
	
}
