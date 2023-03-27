package org.oaoc.cookology.client.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.client.model.dao.ClientDao;
import org.oaoc.cookology.client.model.vo.Client;
import org.oaoc.cookology.common.SearchDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

// 스프링에서는 서비스 모델 클래스는 서비스 인터페이스를 상속받아서
// 만들도록 되어 있음

@Service("clientService")
public class ClientServiceImpl implements ClientService {
	
	// DAO 와 연결처리
	@Autowired  // 자동 DI 처리됨 : 자동 객체 생성됨
	ClientDao clientDao;

	@Override
	public Client selectLogin(Client client) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectDupCheckId(String business_number) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Client> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertClient(Client client) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateClient(Client client) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteClient(String business_number) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateLoginok(Client client) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Client selectClient(String business_number) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Client> selectSearchUserEmail(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Client> selectSearchGender(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Client> selectSearchAge(int age) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Client> selectSearchEnrollDate(SearchDate searchDate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Client> selectSearchLoginOK(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
}
