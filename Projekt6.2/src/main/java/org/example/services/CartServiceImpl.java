package org.example.services;

import org.example.dao.BookDAO;
import org.example.dao.CartDAO;
import org.example.dao.CategoryDAO;
import org.example.entity.Book;
import org.example.entity.Cart;
import org.example.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDAO cartDAO;

    @Override
    public List<Cart> getCarts() {
        return cartDAO.getCarts();
    }

    @Override
    public void saveCart(Cart cart) {
        cartDAO.saveCart(cart);
    }

    @Override
    public Cart getCart(int cartId) {
        return cartDAO.getCart(cartId);
    }

    @Override
    public void deleteCart(int cartId) {
        cartDAO.deleteCart(cartId);
    }
}
