package kr.co.mediazen_ju.web.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.mediazen_ju.service.domain.User;
import kr.co.mediazen_ju.service.user.UserService;

@RestController
@RequestMapping("/user/rest/*")
public class UserRestController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	//ID생성 시 ID중복 검사를 한다.
	@ResponseBody
	@RequestMapping(value = "checkDuplication.do", method = RequestMethod.GET)
	public String checkDuplication(@RequestParam("userId") String userId) throws Exception{
		String result = "false";
		User user = userService.getUser(userId);
		//만약 화면에서 입력한 값이 DB에 존재하지 않으면 true
		// return true = "사용가능", return false = "사용불가능"
		if(user==null){
			result = "true";
		}
		return result;
	}
	
	//회원정보를 조회한다. (관리자)
	@ResponseBody
	@RequestMapping(value = "getUser.do", method = RequestMethod.GET)
	public User getUser(@RequestParam("userId") String userId) throws Exception {
		User user = userService.getUser(userId);
		System.out.println(user);
		return user;
	}
}
