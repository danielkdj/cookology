package org.oaoc.cookology.orders.model.service;

import org.oaoc.cookology.orders.model.dao.OrdersDao;
import org.oaoc.cookology.orders.model.vo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("ordersService")
public class OrdersServiceImpl implements OrdersService {


	@Autowired
	OrdersDao ordersdao;

	@Override
	public Orders selectOrder(String user_email) {
		return ordersdao.selectOrder(user_email);
	}

}
