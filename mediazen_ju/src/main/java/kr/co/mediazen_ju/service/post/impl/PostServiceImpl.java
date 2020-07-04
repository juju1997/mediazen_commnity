package kr.co.mediazen_ju.service.post.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.mediazen_ju.service.post.PostDAO;
import kr.co.mediazen_ju.service.post.PostService;

@Service("postServiceImpl")
public class PostServiceImpl implements PostService {
	
	@Autowired
	@Qualifier("postDAOImpl")
	private PostDAO postDAO;
	private void setPostDAO(PostDAO postDAO){
		this.postDAO = postDAO;
	}
	
}
