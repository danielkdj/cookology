package org.oaoc.cookology.cart.controller;

import org.oaoc.cookology.cart.model.service.CartService;
import org.oaoc.cookology.cart.model.vo.Cart;
import org.oaoc.cookology.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class CartController {

    @Autowired
    private CartService cartService;

    // 상품을 장바구니에 추가하기
    @RequestMapping(value="cartInsert.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView  addToCart(@RequestParam("product_seq_id") int product_seq_id
            , @RequestParam("number") int number , HttpSession session) {
        // 1. 현재 세션에 저장된 사용자 정보를 가져옴
        Users loginUser = (Users) session.getAttribute("loginUser");

        // 2. 로그인되어 있지 않은 경우, 로그인 페이지로 이동
        if (loginUser == null) {
            return new ModelAndView("redirect:/users/loginPage.do");
        }

        // 3. 로그인 되어있을 경우 상품을 장바구니에 추가함
        cartService.addToCart(loginUser.getUser_email(), product_seq_id, number);

        // 4. 상품 추가 후 팝업창을 띄워 유저가 선택하도록 함
        ModelAndView mv = new ModelAndView("common/alert");
        mv.addObject("message", "장바구니 페이지로 이동하시겠습니까?");
        mv.addObject("url", "/cartList.do"); // Yes 버튼 클릭 시 이동할 URL
        mv.addObject("urlName", "장바구니"); // Yes 버튼에 표시될 이름
        mv.addObject("url2", "javascript:history.back()"); // No 버튼 클릭 시 이동할 URL
        mv.addObject("urlName2", "계속 쇼핑"); // No 버튼에 표시될 이름
        return mv;
    }

    // 장바구니 페이지로 이동하기
    @RequestMapping(value="cartList.do" , method={ RequestMethod.GET , RequestMethod.POST })
    public ModelAndView moveCartListPage(HttpSession session) {

        // 1. 로그인된 사용자인지 체크 : 현재 세션에 저장된 사용자 정보를 가져옴
        Users loginUser = (Users) session.getAttribute("loginUser");

        // 2. 로그인되어 있지 않은 경우, 로그인 페이지로 이동
        if (loginUser == null) {
            return new ModelAndView("redirect:/users/loginPage.do");
        }

    // 3. 로그인된 사용자의 장바구니 목록을 가져오기 : 사용자의 이메일로 장바구니 목록을 가져옴
        ArrayList<Cart> cartList = cartService.getCartList(loginUser.getUser_email());

        // 4. 장바구니에 상품이 있는지 체크
        if (cartList != null && !cartList.isEmpty()) {
            ModelAndView mv = new ModelAndView("order/cartList");
            // 5. 상품이 존재하면 모델에 추가하고 장바구니 페이지 반환
            mv.addObject("cartList", cartList);
            return mv;
        } else {
            // 6. 상품이 없으면 오류 메시지를 표시하고 홈페이지로 리다이렉트
            ModelAndView mv = new ModelAndView("common/alert");
            mv.addObject("message", "장바구니에 상품이 존재하지 않습니다!");
            mv.addObject("url", "/"); // 홈페이지로 이동할 URL
            mv.addObject("urlName", "홈으로"); // 버튼에 표시될 이름
            return mv;
        }
    }

    // 장바구니에 등록된 상품 갯수 수정하기
    @RequestMapping(value="updateCartItem.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView updateCartItem(@RequestParam("cart_id") int cart_id
                                     , @RequestParam("number") int number, HttpSession session) {
        cartService.updateCartItem(cart_id, number);

        // 4. 메시지를 표시하고 장바구니 페이지로 리다이렉트함
        ModelAndView mv = new ModelAndView("common/alert");
        mv.addObject("message", "상품 수량이 변경되었습니다.");
        mv.addObject("url", "/cartList.do");
        mv.addObject("urlName", "장바구니");
        return mv;
    }

    // 장바구니에 등록된 상품 삭제하기
    @RequestMapping(value="removeCartItem.do", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView removeCartItem(@RequestParam("cart_id") int cart_id, HttpSession session) {

        // 3. 장바구니에 있는 상품을 제거함
        cartService.removeCartItem(cart_id);
        // 4. 메시지를 표시하고 장바구니 페이지로 리다이렉트함
        ModelAndView mv = new ModelAndView("common/alert");
        mv.addObject("message", "상품이 장바구니에서 삭제되었습니다.");
        mv.addObject("url", "/cartList.do");
        mv.addObject("urlName", "장바구니");
        return mv;
    }

    // 주문 페이지로 이동하기.
    @RequestMapping(value = "orderPage.do", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView moveOrderPage(@RequestParam(value = "product_seq_id", required=false) int[] product_seq_id,
                                      HttpSession session) {

        // 1. 현재 세션에 저장된 사용자 정보를 가져옴
        Users loginUser = (Users) session.getAttribute("loginUser");

        // 2. 로그인되어 있지 않은 경우, 로그인 페이지로 이동
        if (loginUser == null) {
            return new ModelAndView("redirect:/users/loginPage.do");
        }

        // 3. 선택한 상품의 정보를 가져옴
        ArrayList<Cart> cartList = cartService.getCartList(loginUser.getUser_email());
        ArrayList<Cart> selectedCartList = new ArrayList<Cart>();

        if(product_seq_id != null) {
            for (int i = 0; i < cartList.size(); i++) {
                for (int j = 0; j < product_seq_id.length; j++) {
                    if (cartList.get(i).getCart_id() == product_seq_id[j]) {
                        selectedCartList.add(cartList.get(i));
                    }
                }
            }
        }

        // 4. 선택한 상품의 정보를 세션에 저장
        session.setAttribute("selectedCartList", selectedCartList);

        // 5. 결제 페이지로 이동
        ModelAndView mv = new ModelAndView("order/order");
        return mv;
    }
}

