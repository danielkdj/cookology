package org.oaoc.cookology.client.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.client.model.vo.Client;
import org.oaoc.cookology.common.SearchDate;


// 스프링에서는 모델의 서비스 클래스는 인터페이스로 만들도록 정해져 있음
public interface ClientService {	
	Client selectLogin(Client client);
	int selectDupCheckId(String business_number);
	ArrayList<Client> selectList();
	int insertClient(Client client);
	int updateClient(Client client);
	int deleteClient(String business_number);
	int updateLoginok(Client client);
	Client selectClient(String business_number);	
	
	// 검색을 위한 메소드
	ArrayList<Client> selectSearchUserEmail(String keyword);
	ArrayList<Client> selectSearchGender(String keyword);
	ArrayList<Client> selectSearchAge(int age);
	ArrayList<Client> selectSearchEnrollDate(SearchDate searchDate);
	ArrayList<Client> selectSearchLoginOK(String keyword);
}
