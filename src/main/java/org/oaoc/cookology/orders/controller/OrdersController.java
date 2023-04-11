package org.oaoc.cookology.orders.controller;

import org.oaoc.cookology.cart.model.service.CartService;
import org.oaoc.cookology.cart.model.vo.Cart;
import org.oaoc.cookology.orders.model.service.OrdersService;
import org.oaoc.cookology.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class OrdersController {

    @Autowired
    private CartService cartService;
    @Autowired
    private OrdersService ordersService;


    // 주문 페이지로 이동하기.
    @RequestMapping(value = "ordersPage.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView moveOrdersPage(@RequestParam(value = "product_seq_id", required=false) int[] product_seq_id,
                                      HttpSession session) {

        // 1. 현재 세션에 저장된 사용자 정보를 가져옴
        Users loginUser = (Users) session.getAttribute("loginUser");

        // 2. 로그인되어 있지 않은 경우, 로그인 페이지로 이동
        if (loginUser == null) {
            return new ModelAndView("redirect:/loginPage.do");
        }

        // 3. 선택한 상품의 정보를 가져옴
        ArrayList<Cart> cartList = cartService.getCartList(loginUser.getUser_email());
        ArrayList<Cart> selectedCartList = new ArrayList<Cart>();

        if (product_seq_id != null) {
            for (int i = 0; i < cartList.size(); i++) {
                for (int j = 0; j < product_seq_id.length; j++) {
                    if (cartList.get(i).getCart_seq_id() == product_seq_id[j]) {
                        selectedCartList.add(cartList.get(i));
                    }
                }
            }
        }

        // 4. 선택한 상품의 정보를 세션에 저장
        session.setAttribute("selectedCartList", selectedCartList);

        // 5. 결제 페이지로 이동
        ModelAndView mv = new ModelAndView("orders/orders");
        return mv;
    }

    // 배송조회 페이지로 이동
    @RequestMapping(value="trackingSearch.do", method={ RequestMethod.GET, RequestMethod.POST })
    public String moveLoginPage() {
        return "orders/trackingSearch";
    }


    // 배송조회 페이지로 이동
    @RequestMapping(value="trackingPage.do" , method={RequestMethod.GET , RequestMethod.POST })
    public String moveTrackingPage() {
        return "orders/tracking";
    }
}
