package org.oaoc.cookology.order.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.order.model.dao.OrderDao;
import org.oaoc.cookology.order.model.vo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("orderService")
public class OrderServiceImpl implements OrderService {


	@Autowired
	OrderDao orderdao;

	@Override
	public Order selectOrder(String user_email) {
		return orderdao.selectOrder(user_email);
	}

}
