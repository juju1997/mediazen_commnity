package kr.co.mediazen_ju.service.comment.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.mediazen_ju.service.comment.CommentDAO;
import kr.co.mediazen_ju.service.comment.CommentService;

@Service("commentServiceImpl")
public class CommentServiceImpl implements CommentService{

	@Autowired
	@Qualifier("commentDAOImpl")
	private CommentDAO commentDAO;
	private void setCommentDAO(CommentDAO commentDAO){
		this.commentDAO = commentDAO;
	}
	
}
