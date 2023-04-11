package org.oaoc.cookology.cart.model.service;

import org.oaoc.cookology.cart.model.dao.CartDao;
import org.oaoc.cookology.cart.model.vo.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("cartService")
public class CartServiceImpl implements CartService {

    @Autowired
    CartDao cartDao;

    @Override
    public int addToCart(String user_email, int product_seq_id, int number) {
        return cartDao.addToCart(user_email, product_seq_id, number);
    }


    @Override
    public ArrayList<Cart> getCartList(String user_email) {
        List<Cart> list = cartDao.getCartList(user_email);
        return (ArrayList<Cart>) list;
    }

    @Override
    public int updateCartItem(int cart_seq_id, int number) {

        return cartDao.updateCartItem(cart_seq_id, number);
    }

    @Override
    public int removeCartItem(int cart_seq_id) {

        return cartDao.removeCartItem(cart_seq_id);
    }
}

