package org.oaoc.cookology.order.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.order.model.vo.Order;

public interface OrderService {

	Order selectOrder(String user_email);
}
