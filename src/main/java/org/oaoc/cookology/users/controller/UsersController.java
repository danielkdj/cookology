package org.oaoc.cookology.users.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.oaoc.cookology.client.model.service.ClientService;
import org.oaoc.cookology.client.model.vo.Client;
import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.common.Searchs;
import org.oaoc.cookology.users.model.service.UsersService;
import org.oaoc.cookology.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsersController {
	
// Fields 
	@Autowired
	private UsersService usersService;
	@Autowired
	private ClientService clientService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
// Method 
	//로그인 페이지 내보내기용 메소드
	@RequestMapping(value="loginPage.do", method={ RequestMethod.GET, RequestMethod.POST })
	public String moveLoginPage() {
		return "users/loginPage";
	}  
	
	//회원가입 페이지 내보내기용
	@RequestMapping("enrollPage.do")
	public String moveEnrollPage() {
		return "users/enrollPage";
	}
	
	//회원정보 수정페이지 내보내기용
	@RequestMapping("moveup.do")
	public String moveUpdatePage(
			@RequestParam("userid") String userid, 
			Model model) {
		Users users = usersService.selectUsers(userid);
		
		if(users != null) {
			model.addAttribute("users", users);
			return "users/updatePage";
		}else {
			model.addAttribute("message", 
					userid + " : 회원 조회 실패!");
			return "common/error";
		}
	}
	
	
	// 일반회원 로그인 처리용 메소드 : command 객체 사용
	//input 태그의 name 과 vo 객체의 필드명이 같으면 됨
	@RequestMapping(value="ulogin.do", method=RequestMethod.POST)
	public String usersLoginMethod(Users users, 
			HttpSession session, SessionStatus status, 
			Model model) {
	
		//암호화 처리된 패스워드 일치 조회는 select 해 온 값으로 비교함
		//전달온 회원 아이디로 먼저 정보조회함
		Users loginusers = usersService.selectUsers(
										users.getUser_email());
		
		//암호화된 패스워드와 전송온 글자타입 패스워드를 비교함
		//matches(글자타입패스워드, 암호화된패스워드)
		if(loginusers != null && 
				this.bcryptPasswordEncoder.matches(
						users.getUser_pwd(), 
						loginusers.getUser_pwd())) {
			session.setAttribute("loginusers", loginusers);
			status.setComplete();  //로그인 요청 성공, 200 전송함
			return "common/main";	
		}else {
			model.addAttribute("message", 
					"로그인 실패 : 아이디나 암호 확인하세요.<br>"
					+ "또는 로그인 제한된 회원인지 관리자에게 문의하세요.");
			return "common/error";	
		}
			
	}
	
	// 가맹점주 로그인 처리용 메소드 : command 객체 사용
	//input 태그의 name 과 vo 객체의 필드명이 같으면 됨
	@RequestMapping(value="clogin.do", method=RequestMethod.POST)
	public String clientLoginMethod(Client client, 
			HttpSession session, SessionStatus status, 
			Model model) {
	
		//암호화 처리된 패스워드 일치 조회는 select 해 온 값으로 비교함
		//전달온 회원 아이디로 먼저 정보조회함
		Client loginclient = clientService.selectClient(
				client.getBusiness_number());
		
		//암호화된 패스워드와 전송온 글자타입 패스워드를 비교함
		//matches(글자타입패스워드, 암호화된패스워드)
		if(loginclient != null && 
				this.bcryptPasswordEncoder.matches(
						client.getClient_password(), 
						loginclient.getClient_password())) {
			session.setAttribute("loginclient", loginclient);
			status.setComplete();  //로그인 요청 성공, 200 전송함
			return "common/main";	
		}else {
			model.addAttribute("message", 
					"로그인 실패 : 아이디나 암호 확인하세요.<br>"
					+ "또는 로그인 제한된 회원인지 관리자에게 문의하세요.");
			return "common/error";	
		}
			
	}
	
	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, 
			Model model) {	
		
		HttpSession session = request.getSession(false);
	
		if(session != null) {
			session.invalidate();
			return "common/main";
		}else { 
			model.addAttribute("message", 
					"로그인 세션이 존재하지 않습니다");
			return "common/error";
		}
	}
	
	//ajax 통신으로 아이디 중복확인 요청 처리용 메소드
	@RequestMapping(value="idchk.do", method= { RequestMethod.GET , RequestMethod.POST })
	public void dupCheckIdMethod(
			@RequestParam("user_email") String user_email, 
			HttpServletResponse response) throws IOException {
		int idCount = usersService.selectDupCheckId(user_email);
		
		String returnStr = null;
		if(idCount == 0) {
			returnStr = "ok";
		}else {
			returnStr = "duple";
		}
		
		//response 를 이용해서 클라이언트와 출력스트림을 연결하고 값 보냄
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(returnStr);
		out.flush();
		out.close();
	}
	
	//회원가입 요청 처리용 메소드
	@RequestMapping(value="enroll.do", method= { RequestMethod.GET , RequestMethod.POST })
	public String usersInsertMethod(
			Users users, Model model) {
			
		//패스워드 암호화 처리
		users.setUser_pwd(
				bcryptPasswordEncoder.encode(
						users.getUser_pwd()));
	
		if(usersService.insertUsers(users) > 0) {
			//회원 가입 성공
			return "common/main";
		}else {
			//회원 가입 실패
			model.addAttribute("message", "회원 가입 실패!");
			return "common/error";
		}
	}
	
	//마이페이지 클릭시 내 정보 보기 요청 처리용 메소드
	//리턴 타입은 String, ModelAndView 를 사용할 수 있음
	@RequestMapping(value="myinfo.do" , method= { RequestMethod.GET , RequestMethod.POST })
	public ModelAndView usersDetailMethod(
			@RequestParam("user_email") String user_email,
			ModelAndView mv) {
		//서비스로 아이디 전달하고, 해당 회원정보 받기
		Users users = usersService.selectUsers(user_email);
		
		if(users != null) {
			mv.addObject("users", users);
			//Model 또는 ModelAndView 에 저장하는 것은
			//request.setAttribute("users", users); 과 같음
			mv.setViewName("users/myinfoPage");
		}else {
			mv.addObject("message", user_email + " : 회원 정보 조회 실패!");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	//회원 탈퇴(삭제) 요청 처리용
	@RequestMapping(value="mdel.do" , method= { RequestMethod.GET , RequestMethod.POST })
	public String usersDeleteMethod(
			@RequestParam("user_email") String user_email, 
			Model model) {
	
		
		if(usersService.deleteUsers(user_email) > 0) {
			//회원 탈퇴 성공시, 자동 로그아웃 처리해야 함
			//컨트롤러 메소드에서 다른 [컨트롤러] 메소드 호출할 수 있음
			return "redirect:logout.do";
		}else {
			model.addAttribute("message", user_email + " : 회원 삭제 실패!");
			return "common/error";
		}
	}
	
	//회원정보 수정 처리용 : 수정 성공시 myinfoPage.jsp 로 이동함
	@RequestMapping(value="mupdate.do", method= { RequestMethod.GET , RequestMethod.POST })
	public String usersUpdateMethod(Users users,
			Model model, 
			@RequestParam("origin_userpwd") String originUserpwd) {
				
		//새로운 암호가 전송이 왔다면, 패스워드 암호화 처리함
		String userpwd = users.getUser_pwd().trim();
		if(userpwd != null && userpwd.length() > 0) {
			//암호화된 기존의 패스워드와 새로운 패스워드를 
			//비교해서 다른 값이면
			if(!this.bcryptPasswordEncoder.matches(
					userpwd, originUserpwd)) {
				//users 에 새로운 패스워드를 암호화해서 기록함
				users.setUser_pwd(
					this.bcryptPasswordEncoder.encode(userpwd));
			}			
		}else {
			//새로운 패스워드 값이 없다면, users 에 원래 패스워드 기록
			users.setUser_pwd(originUserpwd);
		}
				
		if(usersService.updateUsers(users) > 0) {
			//수정이 성공했다면, 컨트롤러의 메소드를 직접 호출함
			//필요시, 값을 전달할 수도 있음 : 쿼리스트링 사용함
			//?이름=값&이름=값
			return "redirect:myinfo.do?userid=" 
							+ users.getUser_email();
		}else {
			model.addAttribute("message", 
				users.getUser_email() + " : 회원 정보 수정 실패!");
			return "common/error";
		}
	}
	
	//회원관리용 회원전체목록 조회 처리용
	@RequestMapping(value="ulist.do" , method= { RequestMethod.GET , RequestMethod.POST })
	public String usersListViewMethod(Model model) {
		ArrayList<Users> list = usersService.selectList();
		
		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "users/usersListView";
		}else {
			model.addAttribute("message", 
					"회원 정보가 존재하지 않습니다.");
			return "common/error";
		}
	}
	
	//관리자 기능 : 회원 로그인 제한/가능 처리용 메소드
	@RequestMapping(value="loginok.do" , method= { RequestMethod.GET , RequestMethod.POST })
	public String changeLoginOKMethod(Users users, 
			Model model) {

		if(usersService.updateLoginok(users) > 0) {
			return "redirect:ulist.do";
		}else {
			model.addAttribute("message", 
					"로그인 제한/허용 처리 오류 발생!");
			return "common/error";
		}
	}
	
	//회원 검색 처리용
	@RequestMapping(value="usearch.do", method= { RequestMethod.GET , RequestMethod.POST })
	public String usersSearchMethod(
			HttpServletRequest request, Model model) {
		//전송온 값 꺼내기
		String action = request.getParameter("action");
		String keyword = null, beginDate = null, endDate = null;
		
		if(action.equals("enroll")) {
			beginDate = request.getParameter("begin");
			endDate = request.getParameter("end");
		}else {
			keyword = request.getParameter("keyword");
		}
		
		//서비스 메소드가 리턴하는 값을 받을 리스트 준비
		ArrayList<Users> list = null;
		Searchs searchs = new Searchs();
		
		switch(action) {
		case "id":		searchs.setKeyword(keyword);
					list = usersService.selectSearchUser_email(searchs);
					break;
		case "enroll":	list = usersService.selectSearchEnrollDate(
							new SearchDate(Date.valueOf(beginDate), 
										  Date.valueOf(endDate)));
					break;
		case "login":	searchs.setKeyword(keyword);
					list = usersService.selectSearchLoginOK(searchs);
					break;
		}  //switch
		
		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "users/usersListView";
		}else {
			model.addAttribute("message", 
					action + " 검색에 대한 결과가 존재하지 않습니다.");
			return "common/error";
		}
	}
}








