package kr.co.mediazen_ju.web.comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mediazen_ju.service.comment.CommentService;

@Controller
@RequestMapping("/comment/*")
public class CommentController {
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	public CommentController(){
		System.out.println(this.getClass());
	}
}
