package org.oaoc.cookology.users.controller;


import org.oaoc.cookology.cart.model.service.CartService;
import org.oaoc.cookology.users.model.service.UsersService;
import org.oaoc.cookology.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class UsersController {
	
// Fields
	@Autowired
	private UsersService usersService;
	@Autowired
	private CartService cartService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
// Method

	// 로그인 페이지 내보내기용
	@RequestMapping(value="loginPage.do", method={ RequestMethod.GET, RequestMethod.POST })
	public String moveLoginPage() {
		return "users/loginPage";
	}
	//회원가입 페이지 내보내기용
	@RequestMapping("enrollPage.do")
	public String moveEnrollPage() {
		return "users/enrollPage";
	}

	//결제 페이지 내보내기용
	@RequestMapping(value="orderPage.do", method={ RequestMethod.GET, RequestMethod.POST })
	public String moveOrderPage() {
	return "order/order";
}

	//장바구니 페이지 내보내기용 메소드
	@RequestMapping(value="cartListPage.do", method={ RequestMethod.GET, RequestMethod.POST })
	public String moveCartListPage() {
		return "order/cartList";
	}


	//로그인 처리용 메소드 : command 객체 사용
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginMethod(Users users, HttpSession session, SessionStatus status,
							  Model model) {

		//암호화 처리된 패스워드 일치 조회
		Users loginUsers = usersService.selectUsers(
				users.getUser_email());

		//암호화된 패스워드와 전송온 글자타입 패스워드를 비교
		if(loginUsers != null &&
				this.bcryptPasswordEncoder.matches(
						users.getUser_pwd(),
						loginUsers.getUser_pwd())) {
			session.setAttribute("loginUsers", loginUsers);
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
	@RequestMapping(value="idchk.do", method=RequestMethod.POST)
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
	@RequestMapping(value="enroll.do", method=RequestMethod.POST)
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


	/* ----------------------------------------------------------------------------- */
}








