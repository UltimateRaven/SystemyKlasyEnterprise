package org.example.dao;


import org.example.entity.Cart;

import java.util.List;

public interface CartDAO {
    List<Cart> getCarts();
    void saveCart(Cart cart);
    Cart getCart(int cartId);
    void deleteCart(int cartId);
}
