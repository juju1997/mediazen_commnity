package kr.co.mediazen_ju.web.post;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.rte.fdl.property.EgovPropertyService;
import kr.co.mediazen_ju.service.post.PostService;


@Controller
@RequestMapping("/post/*")
public class PostController {
	
	@Autowired
	@Qualifier("postServiceImpl")
	private PostService postService;
	
	public PostController(){
		System.out.println(this.getClass());
	}
}
