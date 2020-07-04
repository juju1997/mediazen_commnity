package kr.co.mediazen_ju.web.user;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.fdl.property.EgovPropertyService;
import kr.co.mediazen_ju.common.Page;
import kr.co.mediazen_ju.common.Search;
import kr.co.mediazen_ju.service.domain.Team;
import kr.co.mediazen_ju.service.domain.User;
import kr.co.mediazen_ju.service.team.TeamService;
import kr.co.mediazen_ju.service.user.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("teamServiceImpl")
	private TeamService teamService;
	
	public UserController(){
		System.out.println(this.getClass());
	}
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	//메인으로 간다.
	@RequestMapping(value = "goMain.do")
	public String goMain(HttpSession session, HttpServletRequest request) throws Exception{
		session = request.getSession(false);
		//세션이 존재하지 않는다면 로그인 화면 호출
		if(session.getAttribute("user") == null){
			return "user/login";
		//세션이 존재한다면 main 화면 호출
		}else{
			return "forward:/user/main.do";
		}
	}
	//로그인 한다.
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user,HttpSession session, Model model) throws Exception {
		User dbUser = userService.getUser(user.getUserId());
		//DB에 해당 회원ID가 존재한다면,
		if(!(dbUser==null)){
			//DB에서 불러온 해당 회원ID의 비밀번호가 입력된 비밀번호와 동일하다면 main 화면 호출
			if(dbUser.getPassword().equals(user.getPassword())){
				session.setAttribute("user", dbUser);
				return "forward:/user/main.do";
			}
		}
		//로그인 정보가 틀렸다면 loin 화면 호출
		return "user/login";
	}
	
	//로그아웃 한다.
	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session) throws Exception {
		//세션 삭제
		session.invalidate();
		return "redirect:/user/goMain.do";
	}
	
	//아이디를 찾는다. (Navigation용 ID찾기 화면 호출)
	@RequestMapping(value = "findIDGet.do", method = RequestMethod.GET)
	public String findIDGet() throws Exception {
		return "user/findID";
	}
	//아이디를 찾는다.
	@RequestMapping(value = "findIDPost.do", method = RequestMethod.POST)
	public String findIDPost(@ModelAttribute("user") User user, Model model) throws Exception {
		String id = userService.findID(user);
		//찾고자 하는 ID가 존재한다면 ID찾기 결과창 호출
		if(!(id==null||id=="")){
			model.addAttribute("id", id);
			return "user/findIDResult";
		//찾고자 하는 ID가 존재하지 않는다면 ID찾기 화면 호출
		}else{
			return "user/findID";
		}
	}
	
	//비밀번호를 찾는다. (Navigation용 비밀번호 찾기 화면 호출)
	@RequestMapping(value = "findPasswordGet.do", method = RequestMethod.GET)
	public String findPasswordGet() throws Exception {
		return "user/findPassword";
	}
	//비밀번호를 찾는다.
	@RequestMapping(value = "findPasswordPost.do", method = RequestMethod.POST)
	public String findPasswordPost(@ModelAttribute("user") User user, Model model) throws Exception {
		User findUser = userService.findPassword(user);
		//찾고자하는 회원의 정보가 DB에 있을때 비밀번호 변경 화면 호출
		if(findUser!=null){
			model.addAttribute("id", findUser.getUserId());
			return "user/changePassword";
		}
		//찾고자하는 회원의 정보가 DB에 없을때 비밀번호 찾기 화면 호출
		return "user/findPassword";
	}
	
	//비밀번호를 변경한다. (변경 후 로그인 화면 호출)
	@RequestMapping(value = "changePassword.do", method = RequestMethod.POST)
	public String changePassword(@ModelAttribute("user") User user) throws Exception {
		userService.changePassword(user);
		return "redirect:/user/goMain.do";
	}
	
	//회원 생성 창으로 Navigation
	@RequestMapping(value = "createUserGet.do")
	public String createUserGet(HttpSession session, HttpServletRequest request, Model model) throws Exception {
		session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		if(!(user == null)){
			if(user.getRole() == 2){
				//팀 생성시 팀목록을 호출하여 display해준다.
				List<Team> teamList = teamService.teamList();
				model.addAttribute("teamList", teamList);
				return "user/createUser";
			}
		}
		return "forward:/user/main.do";
	}
	
	//회원가입 한다.
	@RequestMapping(value = "createUserPost.do", method = RequestMethod.POST)
	public String createUserPost(@ModelAttribute("user") User user) throws Exception {
		String uuid = String.format("%040d", new BigInteger(UUID.randomUUID().toString().replace("-", ""), 16));
		try{
			int code = Integer.parseInt(uuid.substring(0, 11));
			user.setFindCode(code);
		}catch(Exception e){
			int code = Integer.parseInt(uuid.substring(0,8));
			user.setFindCode(code);
		}
		System.out.println(user);
		userService.createUser(user);
		return "redirect:/user/goMain.do";
	}
	
	//회원 List를 확인한다.
	@RequestMapping(value = "userList.do")
	public String userList(@ModelAttribute("search") Search search, Model model) throws Exception {
		int pageUnit = propertiesService.getInt("pageUnit");
		int pageSize = propertiesService.getInt("pageSize");
		if(search.getCurrentPage()==0){
			search.setCurrentPage(1);
		}
		System.out.println(search.getSearchCondition());
		System.out.println(search.getSearchKeyword());
		search.setPageSize(pageSize);
		Map<String, Object> map = userService.userList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "user/userList";
	}
	
	//메인으로 페이지를 로드한다.
	@RequestMapping(value = "main.do")
	public String main() throws Exception{
		return "main/main";
	}
	
}
