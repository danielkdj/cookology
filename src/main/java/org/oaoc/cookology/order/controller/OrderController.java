package org.oaoc.cookology.order.controller;

import org.oaoc.cookology.order.model.service.OrderService;
import org.oaoc.cookology.order.model.vo.Order;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {

	private static final Logger logger = 
			LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderrService;

	// 주문 페이지 내보내기용 메소드
	@RequestMapping(value="orderPage.do", method={ RequestMethod.GET, RequestMethod.POST })
	public ModelAndView selectOrdeMethod(
			@RequestParam("user_email") String user_email, ModelAndView mv) {

		Order order = orderrService.selectOrder(user_email);
		
		if(user_email != null) {
			mv.addObject("user_email", user_email);
			mv.setViewName("order");
		}else {
			mv.addObject("message", user_email + "님의 상품 주문 정보가 없습니다!");
			mv.setViewName("common/error");
		}
		
		return mv;
	}


}
