package org.oaoc.cookology.users.controller;

import org.oaoc.cookology.client.model.service.ClientService;
import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.common.Searchs;
import org.oaoc.cookology.users.model.service.UsersService;
import org.oaoc.cookology.users.model.vo.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

@Controller
public class UsersController {
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
// Fields 
	@Autowired
	private UsersService usersService;
	@Autowired
	private ClientService clientService;
//	@Autowired
//	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
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
/*	@RequestMapping("moveup.do")
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
	}*/


	// 일반회원 로그인 처리용 메소드 : command 객체 사용
	//input 태그의 name 과 vo 객체의 필드명이 같으면 됨
	@RequestMapping(value="ulogin.do", method=RequestMethod.POST)
	public String loginMethod(Users users,
							  HttpSession session, SessionStatus status,
							  Model model) {
		logger.info("login.do : " + users);

		try {
			// Pass it to the service model and get the result
			Users loginUser = usersService.selectLogin(users);
			logger.info("loginUser" + loginUser);
			// Compare the provided password with the stored password
			if(loginUser != null /*&& users.getUser_password().equals(loginUser.getUser_password())*/) {
				session.setAttribute("loginUser", loginUser);
				status.setComplete(); //login request successful, 200 sent
				return "common/main";
			} else {
				model.addAttribute("message",
						"Login failed: Please check your ID or password.<br>"
								+ "Or ask your admin if you're a login-restricted member.");
				return "common/error";
			}
		} catch (Exception e) {
			logger.error("Error in loginMethod: ", e);
			model.addAttribute("message",
					"An error occurred during the login process. Please try again later.");
			return "common/error";
		}
	}

	// 가맹점주 로그인 처리용 메소드 : command 객체 사용
	//input 태그의 name 과 vo 객체의 필드명이 같으면 됨
	/*@RequestMapping(value="clogin.do", method=RequestMethod.POST)
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

	}*/

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

}








