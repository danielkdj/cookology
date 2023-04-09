package org.oaoc.cookology.orders.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.order.model.vo.Order;
import org.oaoc.cookology.orders.model.dao.OrdersDao;
import org.oaoc.cookology.orders.model.vo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("orderService")
public class OrdersServiceImpl implements OrdersService {

	
	@Autowired
	OrdersDao ordersdao;

	@Override
	public Orders selectOrders(String user_email) {

		return ordersdao.selectOrders(user_email);
	}
	public OrdersServiceImpl() {
		super();
	}

	@Override
	public ArrayList<Orders> selectAll() {
		return ordersdao.selectAll();

	}



	

}
