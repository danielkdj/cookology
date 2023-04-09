package org.oaoc.cookology.orders.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.order.model.vo.Order;
import org.oaoc.cookology.orders.model.vo.Orders;
import org.oaoc.cookology.product.model.vo.Product;

public interface OrdersService {

	Orders selectOrders(String user_email);

	
	

	ArrayList<Orders> selectAll();
	
}
