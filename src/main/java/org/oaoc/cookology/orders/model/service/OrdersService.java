package org.oaoc.cookology.orders.model.service;

import org.oaoc.cookology.orders.model.vo.Orders;

public interface OrdersService {

	Orders selectOrder(String user_email);
}
