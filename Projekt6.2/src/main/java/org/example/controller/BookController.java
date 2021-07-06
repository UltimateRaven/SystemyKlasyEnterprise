package org.example.controller;

import org.example.entity.Book;
import org.example.entity.Cart;
import org.example.services.AuthorService;
import org.example.services.BookService;
import org.example.services.CartService;
import org.example.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {

    private BookService bookService;
    private CategoryService categoryService;
    private AuthorService authorService;
    private CartService cartService;

    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @Autowired
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Autowired
    public void setAuthorService(AuthorService authorService) {
        this.authorService = authorService;
    }

    @Autowired
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<Book> books = bookService.getBooks();
        model.addAttribute("books", books);
        return "books/list";
    }

    @GetMapping("/add")
    public String add(Model model){
        Book book = new Book();
        model.addAttribute("book", book);
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("authors", authorService.getAuthor());
        return "books/add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("book") Book book){
        bookService.saveBook(book);
        return "redirect:/books/list";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("bookId") int bookId) {
        bookService.deleteBook(bookId);
        return "redirect:/books/list";
    }

    @GetMapping("/edit")
    public String edit(@RequestParam("bookId") int bookId, Model model) {
        Book book = bookService.getBook(bookId);
        model.addAttribute("book", book);
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("authors", authorService.getAuthor());
        return "books/add";
    }

    @GetMapping("/addToCart")
    public String addToCart(@RequestParam("bookId") int bookId, Model model) {
        Book book = bookService.getBook(bookId);
        return "redirect:/books/list";
    }

}
