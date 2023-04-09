package org.oaoc.cookology.cart.model.service;

import org.oaoc.cookology.cart.model.vo.Cart;

import java.util.ArrayList;
import java.util.List;

public interface CartService {

    int addToCart(String userEmail, int productSeqId, int number);
    ArrayList<Cart> getCartList(String userEmail);
    int updateCartItem(int cart_seq_id, int number);
    int removeCartItem(int cart_seq_id);
}

