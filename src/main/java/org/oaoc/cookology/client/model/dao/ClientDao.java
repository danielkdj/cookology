package org.oaoc.cookology.client.model.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.oaoc.cookology.client.model.vo.Client;
import org.oaoc.cookology.common.SearchDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("clientDao") 
public class ClientDao {

	private SqlSessionTemplate session;  
	
	
	public Client selectLogin(Client client) {
		return session.selectOne("clientMapper.selectLogin", client);
	}

	
	public int selectDupCheckId(String business_number) {
		return session.selectOne("clientMapper.selectDupCheckId", business_number);
	}

	
	public ArrayList<Client> selectList() {
		List<Client> clientList = session.selectList("clientMapper.selectList");
        return new ArrayList<Client>(clientList);
	}

	
	public int insertClient(Client client) {
		return session.insert("clientMapper.insertClient", client);
	}

	
	public int updateClient(Client client) {
		return session.update("clientMapper.updateClient", client);
	}

	
	public int deleteClient(String business_number) {
		return session.delete("clientMapper.deleteClient", business_number);
	}

	
	public int updateLoginok(Client client) {
		return session.update("clientMapper.updateLoginok", client);
	}

	
	public Client selectClient(String business_number) {
		return session.selectOne("clientMapper.selectClient", business_number);
	}

	
	
	
	public ArrayList<Client> selectSearchUserEmail(String keyword) {
		List<Client> list = session.selectList("clientMapper.selectSearchClientEmail", keyword);
		return new ArrayList<Client>(list);
	}

	
	public ArrayList<Client> selectSearchGender(String keyword) {
		List<Client> list = session.selectList("clientMapper.selectSearchGender", keyword);
		return new ArrayList<Client>(list);
	}

	
	public ArrayList<Client> selectSearchAge(int age) {
		List<Client> list = session.selectList("clientMapper.selectSearchAge", age);
		return new ArrayList<Client>(list);
	}


	public ArrayList<Client> selectSearchEnrollDate(SearchDate searchDate) {
		List<Client> list = session.selectList("clientMapper.selectSearchEnrollDate", searchDate);
		return new ArrayList<Client>(list);
	}

	
	public ArrayList<Client> selectSearchLoginOK(String keyword) {
		List<Client> list = session.selectList("clientMapper.selectSearchLoginOK", keyword);
		return new ArrayList<Client>(list);
	}
	
}
