package org.oaoc.cookology.users.controller;

import org.oaoc.cookology.orders.model.vo.Orders;
import org.oaoc.cookology.recipe.model.vo.Recipe;
import org.oaoc.cookology.users.model.service.UsersService;
import org.oaoc.cookology.users.model.vo.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

@Controller
public class UsersController {
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

	@Autowired
	private UsersService usersService;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private JavaMailSender mailSender;

//======================================================================================================================

	//1. 회원가입
	//회원가입 페이지로 이동하기(완료)
	@RequestMapping("usersSignUpPage.do")
	public String moveUsersSignUpPage() {
		return "users/usersSignUpPage";
	}


	//ajax 통신 아이디 중복확인 요청처리용(완료)
	@RequestMapping(value="uIdCheck.do", method ={RequestMethod.POST, RequestMethod.GET})
	public void selectDupCheckId(@RequestParam("user_email")String user_email, HttpServletResponse response) throws IOException {
		logger.info("user_email" + user_email);
		int idCount = usersService.selectDupCheckId(user_email);

		String result = null;
		if(idCount == 0){
			result = "ok";
		}else{
			result = "duple";
		}

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.append(result);
		out.flush();
		out.close();
	}


	//회원가입 요청처리용(완료)
	@RequestMapping(value = "usersSignUp.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String insertUsers(Users users, Model model){
		logger.info("Users" + users);

		users.setUser_password(bCryptPasswordEncoder.encode(users.getUser_password()));
		logger.info("after encode", users.getUser_password());
		logger.info("length" + users.getUser_password().length());

		if (usersService.insertUsers(users) > 0) {
			return "common/main";
		} else {
			model.addAttribute("회원가입에 실패했습니다.");
			return "common/error";
		}
	}

//======================================================================================================================

	//2. 로그인, 로그아웃
	//로그인 페이지 내보내기용 메소드(완료)
	@RequestMapping(value = "loginPage.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String moveULoginPage() {
		return "users/loginPage";
	}


	//로그인 처리용(완료)
	@RequestMapping(value = "userslogin.do", method ={RequestMethod.POST, RequestMethod.GET})
	public String selectUsersLogin(Users users, HttpSession session, SessionStatus status, Model model) {
		logger.info("users" + users);

		Users loginUsers = usersService.selectUsersLogin(users);

		if (loginUsers != null && this.bCryptPasswordEncoder.matches(users.getUser_password(), loginUsers.getUser_password())) {
			session.setAttribute("loginUsers", loginUsers);
			status.setComplete();
			return "common/main";
		} else {
			model.addAttribute("아이디 또는 비밀번호 재확인 후 로그인해 주시기 바랍니다" +
					"\n로그인 제한여부에 대해서는 관리자에게 문의 부탁드립니다.");
			return "common/error";
		}
	}


	//로그아웃 처리용(완료)
	@RequestMapping("userslogout.do")
	public String userslogout(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		logger.info("session" + session);

		if (session != null) {
			session.invalidate();
			return "common/main";
		} else {
			return "redirect:/loggout";
		}
	}

//======================================================================================================================

	//3. 마이페이지
	//마이페이지 이동처리용(완료)
	@RequestMapping(value = "uMypage.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView moveUMyPage(@RequestParam("user_email") String user_email, ModelAndView modelAndView) {
		logger.info("user_email", user_email);
		Users users = usersService.selectUsers(user_email);

		if (user_email != null) {
			modelAndView.addObject("users", users);
			modelAndView.setViewName("users/usersMypage_InfoForm");
		} else {
			modelAndView.addObject(user_email + "해당 이메일을 가진 회원정보를 찾을 수 없습니다.");
			modelAndView.setViewName("common/error");
		}
		return modelAndView;
	}


	//마이페이지 개인정보 수정하기(아이디, 비밀번호 찾기 후 바로 수정)
	@RequestMapping(value = "usersMypage_InfoForm.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView moveMyPage(@RequestParam("User_password") String user_password, Users users, Model model) {
		logger.info("users", users);

		user_password = users.getUser_password().trim();
		if (user_password != null && user_password.length() > 0) {
			if (!this.bCryptPasswordEncoder.matches(user_password, users.getUser_password())) {
				users.setUser_password(this.bCryptPasswordEncoder.encode((user_password)));
			} else {
				users.setUser_password(user_password);
			}

			if (usersService.updateUsers(users) > 0) {
				return new ModelAndView("redirect:/users/usersMyPage_Info.do?user_email=" + users.getUser_email());
			} else {
				model.addAttribute(users.getUser_email() + "해당 이메일은 회원정보 수정이 불가능합니다.");
				return new ModelAndView("users/error");
			}
		}
		return null;
	}

	//My레시피 이동처리용
	@RequestMapping(value = "uMyRecipe.do")
	public String moveUsersMypage_MyRecipe(){
		return "users/usersMypage_MyRecipe";
	}

	//My레시피 검색용(수정필요) = 안함
	@RequestMapping(value = "usersMypage_MyRecipe.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String usersRecipeSerch(Users users, Model model) {
		ArrayList<Recipe> list = usersService.selectSearchMyRecipe(users);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "users/userMypage_MyRecipe";
		} else {
			model.addAttribute("사용자의 레시피를 조회할 수 없습니다.");
			return "users/usersMyPage_InfoForm";
		}
	}


	//My주문내역 이동처리용(수정필요) = 안함
	@RequestMapping(value = "uMyOrder.do")
	public String moveUserMypage_MyOrder_MyRecipe(){
		return "users/usersMypage_MyRecipe";
	}


	//주문내역 검색용(수정필요) = 안함
	@RequestMapping(value = "userMypage_MyOrder.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String selectSearchMyOrder(@RequestParam("user_email") String user_email, Model model) {
		ArrayList<Orders> list = usersService.selectSearchMyOrder(user_email);

		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "users/userMypage_MyOrder";
		} else {
			model.addAttribute(user_email + "을 사용자의 주문내역를 조회할 수 없습니다.");
			return "users/usersMyPage_InfoForm";
		}
	}


	//회원탈퇴 이동처리용(완료)
	@RequestMapping(value = "uDeleteForm.do")
	public String moveUsersMypage_DeleteForm(){
		return "users/usersMypage_DeleteForm";
	}

	//회원 탈퇴용
	@RequestMapping(value="usersMypage_DeleteForm.do", method ={RequestMethod.POST, RequestMethod.GET})
	public String deleteUsers(@RequestParam("users_email")String users_email,
							  @RequestParam("users_password")String user_password, Model model, Users users){
		logger.info("users_email", users_email);

		if(usersService.deleteUsers(users_email) > 0){
			Users user = usersService.selectUsers(users_email);
			if(user != null && this.bCryptPasswordEncoder.matches(users.getUser_password(), user.getUser_password())){
				return "redirect:logout.do";
			}else{
				model.addAttribute(users_email +  "을 ID를 가진 회원의 정보삭제를 실패하였습니다.");
				return "common/error";
			}
		}
		model.addAttribute(users_email +  "을 ID를 가진 회원의 정보삭제를 실패하였습니다.");
		return "common/error";
	}

//======================================================================================================================

	//4. 아이디, 비밀번호 찾기
	//users 페이지로 이동(완료)
	@RequestMapping(value="ufindUsers.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String moveFindUsers(){
		return "users/usersFind_ID";
	}

	//users ID 찾기(완료)
	@RequestMapping(value="userFind_ID.do",method={RequestMethod.POST, RequestMethod.GET})
	public String findUsersId(Users users, Model model) throws IOException{
		String users_email = usersService.selectfindUsersId(users);

		if(users != null){
			model.addAttribute("user_email", users_email);
			return "users/usersFind_ID";
		}else{
			model.addAttribute("회원의 ID를 찾을 수 없습니다.");
			return "common/error";
		}
	}


	//users PWD 이동용
	@RequestMapping(value = "userFind_PWD.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String moveFindUsersPwd(){
		return "users/usersFind_PWD";
	}

	//users 비밀번호 찾기 인증번호 받기 =이메일 인증
	@RequestMapping(value = "mailCheck1.do", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String mailCheckGET(@RequestParam("users_email") String users_email) throws Exception {
		logger.info("이메일 데이터 전송 확인");
		logger.info("인증번호 : " + users_email);

		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		logger.info("인증번호 : " + checkNum);

		String setFrom = "itsyksj@naver.com";
		String toMail = users_email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "cookology에서 보내는 인증메일입니다." + "<br><br>" +
				"본인의 인증번호는 " + checkNum + "입니다." + "<br>" +
				"해당 인증번호를 인증번호 확인란에 기입하여 주시기 바랍니다.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);
		return num;
	}




//======================================================================================================================

	//5. 관리자용
	//모든 회원정보 조회용
	@RequestMapping(value = "userslist.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String selectList(Model model){
		ArrayList<Users> list = usersService.selectList();

		if(list != null && list.size() > 0) {
			model.addAttribute("모든 회원정보 조회", list);
			return "users/userListView";
		}else{
			model.addAttribute("회원의 정보가 존재하지 않습니다.");
			return "users/userListView";
		}
	}


	//회원 로그인 권한 제어용
	@RequestMapping("loginOk.do")
	public String updateLoginOK(Users users, Model model){
		logger.info("users" + users);

		if(usersService.updateLoginOK(users) > 0){
			return "redirect:userslist.do";
		}else{
			model.addAttribute("로그인 권한 제어기능 부분에서 문제가 발생했습니다.");
			return "common/error";
		}
	}


	//관리자 권한제어용
	@RequestMapping("adminOk.do")
	public String updateAdminOK(Users users, Model model){
		logger.info("관리자 권한 조회중 : " + users.getUser_email() + users.getIs_admin());

		if(usersService.updateAdminOK(users) > 0){
			return "redirect:userslist.do";
		}else{
			model.addAttribute("관리자 권한 제어기능 부분에서 문제가 발생했습니다.");
			return "common/error";
		}
	}


	//ID 회원조회용
//    @RequestMapping(value="selectSearchUser_email.do", method = RequestMethod.POST)
//    public String selectSearchUser_email(@RequestParam("keyword")String keyword, Model model){
//        ArrayList<Users> list = usersService.selectSearchUser_email(keyword);
//        if(list != null && list.size() > 0){
//            model.addAttribute("list", list);
//            return "users/usersListView";
//        }else{
//            model.addAttribute( keyword + "라는 ID를 가진 회원은 존재하지 않습니다.");
//            return "users/usersListView";
//        }
//    }


	//가입날짜 회원조회용
	//로그인 가능여부 회원조회용
	//관리자 권한여부로 회원조회용

//    @RequestMapping(value="usersSearch.do", method=RequestMethod.POST)
//    public String usersSearch(HttpServletRequest request, Model model) {
//        String action = request.getParameter("action");
//        String keyword = null;  beginDate = null, endDate = null;
//    }

}