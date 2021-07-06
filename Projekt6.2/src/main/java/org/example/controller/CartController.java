package org.example.controller;

import org.example.entity.Book;
import org.example.entity.Cart;
import org.example.services.BookService;

import org.example.services.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    private CartService cartService;
    private BookService bookService;

    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @Autowired
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    @GetMapping("/cart")
    public String cart(Model model) {
        List<Cart> carts = cartService.getCarts();
        model.addAttribute("cart", carts);
        return "cart";
    }
}
