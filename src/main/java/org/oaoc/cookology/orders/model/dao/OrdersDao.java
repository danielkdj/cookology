package org.oaoc.cookology.orders.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.oaoc.cookology.orders.model.vo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository("ordersDao")
public class OrdersDao {


	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Orders> selectOrderList(String keyword) {
		List<Orders> list = session.selectList("orderMapper.selectOrderList", keyword);
		return (ArrayList<Orders>)list;
	}

	public Orders selectOrder(String user_email) {
		return session.selectOne("orderMapper.selectOrder", user_email);
	}

}
