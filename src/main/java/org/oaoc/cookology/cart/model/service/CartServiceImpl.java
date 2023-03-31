package org.oaoc.cookology.cart.model.service;

import org.oaoc.cookology.cart.model.dao.CartDao;
import org.oaoc.cookology.cart.model.vo.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("cartService")
public class CartServiceImpl implements CartService {

    @Override
    public int addToCart(String user_email, int product_seq_id, int number) {
        return 0;
    }

    @Override
    public ArrayList<Cart> getCartList(String user_email) {
        return null;
    }

    @Override
    public int updateCartItem(int cart_id, int number) {
        return 0;
    }

    @Override
    public int removeCartItem(int cart_id) {
        return 0;
    }
}

