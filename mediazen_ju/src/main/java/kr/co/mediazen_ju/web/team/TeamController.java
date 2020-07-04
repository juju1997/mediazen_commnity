package kr.co.mediazen_ju.web.team;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.mediazen_ju.service.domain.Team;
import kr.co.mediazen_ju.service.domain.User;
import kr.co.mediazen_ju.service.team.TeamService;
import kr.co.mediazen_ju.service.user.UserService;

@Controller
@RequestMapping("/team/*")
public class TeamController {
	
	@Autowired
	@Qualifier("teamServiceImpl")
	private TeamService teamService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public TeamController(){
		System.out.println(this.getClass());
	}
	
	//팀 목록을 확인한다.
	@RequestMapping(value = "teamList.do")
	public String teamManagementMain(Model model, HttpSession session) throws Exception{
		User user = (User)session.getAttribute("user");
		//Session이 있고, 권한이 관리자라면 팀 목록을 출력한다
		if(!(user==null)){
			if(user.getRole()==2){
				List<User> userList = userService.getUserListForTeam();
				List<Team> teamList = teamService.teamList();
				model.addAttribute("teamList", teamList);
				model.addAttribute("userList", userList);
				return "team/teamList";
			}else{	//관리자 권한이 아니라면 Main으로 리턴
				return "forward:/user/goMain.do";
			}
		}else{	//Session이 비어있다면 Main으로 리턴
			return "forward:/user/goMain.do";
		}
	}
	
	//팀 생성창으로 이동
	@RequestMapping(value = "teamGenerationGet.do", method = RequestMethod.GET)
	public String teamGenerationGet(HttpSession session) throws Exception {
		User user = (User)session.getAttribute("user");
		//Session이 있고, 권한이 관리자라면 팀 생성창을 호출한다
		if(!(user==null)){
			if(user.getRole()==2){
				return "team/teamGeneration";
			}else{	//관리자 권한이 아니라면 Main으로 리턴
				return "forward:/user/goMain.do";
			}
		}else{	//Session이 비어있다면 Main으로 리턴
			return "forward:/user/goMain.do";
		}
	}
	//팀을 생성한다.
	@RequestMapping(value = "teamGenerationPost.do", method = RequestMethod.POST)
	public String teamGenerationPost(@ModelAttribute("team") Team team) throws Exception {
		teamService.teamGeneration(team);
		return "forward:/team/teamList.do";
	}
	
	//팀을 조회한다
	@RequestMapping(value = "getTeam.do", method=RequestMethod.POST)
	public String getTeam(@ModelAttribute("Team") Team team, Model model) throws Exception {
		Team selectTeam = teamService.getTeam(team.getTeamNo());
		//만약 호출된 팀의 Master가 비어있다면 getTeamForNull 호출
		if(selectTeam == null){
			selectTeam = teamService.getTeamForNull(team.getTeamNo());
		}
		List<User> selectUser = userService.getUserListForGetTeam(team.getTeamNo());
		model.addAttribute("user", selectUser);
		model.addAttribute("team", selectTeam);
		return "team/getTeam";
	}
	
	//팀을 삭제한다
	@RequestMapping(value = "deleteTeam.do", method=RequestMethod.POST)
	public String deleteTeam(@ModelAttribute("Team") Team team, Model model) throws Exception {
		teamService.deleteTeam(team.getTeamNo());
		return "forward:/team/teamList.do";
	}
}
