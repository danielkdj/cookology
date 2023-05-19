package org.oaoc.cookology.users.controller;

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

import javax.mail.*;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

@Controller
public class UsersController {

    @Autowired
    private UsersService usersService;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    private JavaMailSender mailSender;


    @RequestMapping("usersSignUpPage.do")
    public String moveUsersSignUppage(){
        return "users/usersSignUppage";
    }


    @RequestMapping(value = "uIdCheck.do", method = RequestMethod.POST)
    @ResponseBody
    public void selectDupCheckID(Users users, HttpServletResponse response, HttpSession session)throws IOException {
        int idCount = usersService.selectDupCheckID(users.getUser_email());

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


    //회원가입 요청처리용
    @RequestMapping(value = "usersSignUp.do", method = RequestMethod.POST)
    public String insertUsers(Users users, Model model){

        users.setUser_password(bCryptPasswordEncoder.encode(users.getUser_password()));

        if(users.getUser_allergy() == null){
            users.setUser_allergy(" ");
        }else {

        }
        if(usersService.insertUsers(users) > 0){
            return "common/main";
        }else{
            model.addAttribute("회원가입에 실패했습니다.");
            return "common/error";
        }
    }


    //로그인 페이지 이동용
    @RequestMapping(value = "loginPage.do", method = RequestMethod.GET)
    public String moveULoginPage(){return "users/loginPage";
    }


    //로그인 처리용
    @RequestMapping(value = "useresLogin.do", method = RequestMethod.POST)
    public String selsectUsersLogin(Users users, HttpSession session, SessionStatus status, Model model){

        Users loginUsers = usersService.selectUsers(users.getUser_email());

        if(loginUsers != null && this.bCryptPasswordEncoder.matches(users.getUser_password(), loginUsers.getUser_password())){
            session.setAttribute("loginUsers", loginUsers);
            status.setComplete();
            return "common/main";
        }else{
            model.addAttribute("아이디 또는 비밀번호를 재확인 하고 로그인 해주시기 바랍니다." );
            return "common/error";
        }
    }


    //로그아웃 처리용
    @RequestMapping("usersLoggout.do")
    public String usersLogout(HttpServletRequest requset, Model model){
        HttpSession session = requset.getSession(false);

        if(session != null){
            session.invalidate();
            return "common/main";
        }else{
            return "redirect:/loggout";
        }
    }


    //마이페이지 이동처리용
    @RequestMapping(value = "/uMypage_InfoForm.do", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView moveUMypage(@RequestParam("user_email")String user_email, ModelAndView modelAndView){
        Users users = usersService.selectUsers(user_email);

        if(user_email != null){
            modelAndView.addObject("users", users);
            modelAndView.setViewName("users/usersMypage_InfoForm");
        }else{
            modelAndView.addObject(user_email + "해당 이메일을 가진 해당정보를 찾을 수 없습니다.");
            modelAndView.setViewName("common/error");
        }
        return modelAndView;
    }


    //마이페이지 개인정보 수정처리용
    @RequestMapping(value = "usersMypage_InfoForm.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String moveMypage_InfoForm(Users users, Model model){

        if(users.getUser_password().trim() != null && users.getUser_password().trim().length() > 0){
            if(!this.bCryptPasswordEncoder.matches(users.getUser_password().trim(), users.getUser_password())){
                users.setUser_password(this.bCryptPasswordEncoder.encode((users.getUser_password().trim())));
            }else{
                users.setUser_password(users.getUser_password());
            }

            if(usersService.updateUsers(users) > 0){
                return "common/main";
            }else{
                model.addAttribute(users.getUser_email() + "해당 이메일은 회원정보 수정이 불가능합니다.");
                return  "users/main";
            }
        }else{
            users.setUser_password(usersService.selectUsers(users.getUser_email()).getUser_password());
            if(usersService.updateUsers(users) > 0){
                return "common.main";
            }else{
                model.addAttribute(users.getUser_email() + "해당 이메일은 회원정보 수정이 불가능합니다.");
                return "users/error";
            }
        }
    }


    //My레시피 이동처리용
    @RequestMapping(value = "uMypage_MyRecipe.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String moveUsersMypage_MyRecipe(){return "users/usersMypage_MyRecipe";}


    //My주문내역 이동처리용
    @RequestMapping(value = "uMypage_MyOrder.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String moveUsersMypage_MyOrder(){return "users/usersMypage_MyOrder";}


    //회원탈퇴 이동처리용
    @RequestMapping(value = "uMypage_DeleteForm.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String moveUsersMypage_DeleteForm(){return "users/usersMypage_DeleteForm";}


    //회원 틸퇴용
    @RequestMapping(value = "usersMypage_DeleteForm.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String deleteUsers(Users users, Model model){
        int result = usersService.deleteUsers(users);

        if(result > 0){
            return "redirect:usersLoggout.do";
        }else{
            model.addAttribute(users.getUser_email() + "을 ID를 가진 회원의 정보삭제를 실패했습니다.");
            return "common/error";
        }
    }


    //아이디찾기 이동처리용
    @RequestMapping(value = "uFindUsers_ID.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String moveFindUsers(){
        return "users/usersFind_ID";
    }


    //아이디찾기
    @RequestMapping(value = "usersFInd_ID.do", method = {RequestMethod.POST, RequestMethod.GET})
    public String selectUsersID(Users users, Model model)throws IOException{
        Users user_email = usersService.selectFindUsersID(users);

        if(user_email != null){
            model.addAttribute("users", users);
            return  "users/usersFind_ID";
        }else{
            model.addAttribute("입력한 정보에 해당하는 사용자가 존재하지 않습니다.");
            return "common/error";
        }
    }
    /* 이메일 인증 */
    @RequestMapping(value = "mailCheck.do", method = RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception {

        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;

        /* 이메일 보내기 */
        String setFrom = "itsyksj@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = "cookology를 방문해주셔서 감사합니다." + "<br><br>" +
                "인증 번호는 " + checkNum + "입니다." + "<br>"
                + "전송된 인증번호를 입력해 회원가입하여 주세요.";

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
}