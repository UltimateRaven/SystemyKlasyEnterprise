package org.example.services;



import org.example.entity.Cart;
import org.example.entity.Category;

import java.util.List;


public interface CartService {
    List<Cart> getCarts();
    void saveCart(Cart cart);
    Cart getCart(int cartId);
    void deleteCart(int cartId);

}
