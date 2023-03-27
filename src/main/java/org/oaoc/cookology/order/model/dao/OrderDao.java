package org.oaoc.cookology.order.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.oaoc.cookology.order.model.vo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("orderDao") 
public class OrderDao {

	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Order> selectOrderList(String keyword) {
		List<Order> list = session.selectList("orderMapper.selectOrderList", keyword);
		return (ArrayList<Order>)list;
	}

	public Order selectOrder(String user_email) {
		return session.selectOne("orderMapper.selectOrder", user_email);
	}

}
