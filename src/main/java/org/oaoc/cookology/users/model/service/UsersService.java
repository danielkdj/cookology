package org.oaoc.cookology.users.model.service;

import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.common.Searchs;
import org.oaoc.cookology.orders.model.vo.Orders;
import org.oaoc.cookology.recipe.model.vo.Recipe;
import org.oaoc.cookology.users.model.vo.Users;

import java.util.ArrayList;

public interface UsersService{

	//======================================================================================================================
	//1. 회원가입
	int insertUsers(Users users);							//회원가입 시 작성한 정보 저장용
	int selectDupCheckId(String user_email);				//아이디 중복검사용

//======================================================================================================================

	//2. 마이페이지
	Users selectUsers(String user_email);					//마이페이지의 보여줄 회원정보 조회하기
	int updateUsers(Users users);							//마이페이지 개인정보 수정용
	ArrayList<Recipe> selectSearchMyRecipe(Users users);	//My레시피에서 키워드 입력 시 해당 레시피 조회용
	ArrayList<Orders> selectSearchMyOrder(String user_email); 	//My결제내역에서 키워드 입력 시 해당 주문내역 조회용
	int deleteUsers(String user_email);						//회원탈퇴 시 회원삭제용

//======================================================================================================================

	//3. 아이디, 비밀번호 찾기
	String selectfindUsersId(Users users);					//전화번호로 아이디 찾기
	Users selectfindUsersPassword(Users users);			//전화번호로 비밀번호 존재여부 찾기
	int deleteUsersPassword(String user_password);			//비밀번호 재설정 시 기존 비밀번호 삭제용
	int updateUsersPassword(String user_password);			//비밀번호 찾기에서 회원정보가 존재한다면 재설정용

//======================================================================================================================

	//4. 로그인
	Users selectUsersLogin(Users users);					//로그인 시 ID가 맞는지 (확인)처리용

//======================================================================================================================

	//5. 관리자용
	ArrayList<Users> selectList();							//모든 회원정보 조회용
	int updateLoginOK(Users users);							//회원 로그인 권한 제어용
	int updateAdminOK(Users users);							//관리자 권한제어용
	ArrayList<Users> selectSearchUser_email(Searchs searchs);		//ID 회원조회용
	ArrayList<Users> selectSearchEnrollDate(SearchDate searchDate);	//가입날짜 회원조회용
	ArrayList<Users> selectSearchLoginOK(Searchs searchs);	//로그인 가능여부 회원조회용
	ArrayList<Users> selectSearchAdminOK(Searchs searchs);	//관리자 권한여부로 회원조회용
}