package org.oaoc.cookology.cart.model.service;

import org.oaoc.cookology.cart.model.vo.Cart;

import java.util.ArrayList;
import java.util.List;

public interface CartService {

    int addToCart(String user_email, int product_seq_id, int number);
    ArrayList<Cart> getCartList(String user_email);
    int updateCartItem(int cart_id, int number);
    int removeCartItem(int cart_id);
    }

