package org.oaoc.cookology.cart.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.oaoc.cookology.cart.model.vo.Cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

    @Repository("cartDao")
    public class CartDao {

        @Autowired
        private SqlSession sqlSession;

        // 카트에 상품 추가
        public int addToCart(String user_email, int product_seq_id, int number) {
            Cart cart = new Cart();
            cart.setUser_email(user_email);
            cart.setProduct_seq_id(product_seq_id);
            cart.setNumber(number);
            return sqlSession.insert("cartMapper.addToCart", cart);
        }

        // 카트 목록 조회
        public List<Cart> getCartList(String user_email) {
            return sqlSession.selectList("cartMapper.getCartList", user_email);
        }

        // 카트 상품 개수 수정
        public int updateCartItem(int cart_seq_id, int number) {
            Cart cart = new Cart();
            cart.setCart_seq_id(cart_seq_id);
            cart.setNumber(number);
            return sqlSession.update("cartMapper.updateCartItem", cart);
        }

        // 카트에서 상품 삭제
        public int removeCartItem(int cart_seq_id) {
            return sqlSession.delete("cartMapper.removeCartItem", cart_seq_id);
        }
    }