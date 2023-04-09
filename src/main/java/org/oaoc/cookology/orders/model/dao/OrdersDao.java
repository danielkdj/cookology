package org.oaoc.cookology.orders.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.oaoc.cookology.order.model.vo.Order;
import org.oaoc.cookology.orders.model.vo.Orders;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("orderDao")
public class OrdersDao {


	@Autowired
	private SqlSessionTemplate session;

	private Logger logger = LoggerFactory.getLogger(OrdersDao.class);


	public ArrayList<Orders> selectOrdersList(String keyword) {
		List<Orders> list = session.selectList("ordersMapper.selectOrdersList", keyword);
		return (ArrayList<Orders>)list;
	}

	public Orders selectOrders(String user_email) {

		return session.selectOne("ordersMapper.selectOrders", user_email);
	}

	/* ------------------------------------------------------------------------------------------------------------ */

	//merchant order list 조회
	public ArrayList<Orders> selectAll() {
		System.out.println("list 값 출력 Dao : 3");
		System.out.println("list 값 출력 4 " + session.selectList("ordersMapper.selectAll"));
		List<Orders> list = session.selectList("ordersMapper.selectAll");
		return (ArrayList<Orders>)list;
	}





	public Orders selectOrder(String user_email) {
		return session.selectOne("orderMapper.selectOrder", user_email);
	}



}
