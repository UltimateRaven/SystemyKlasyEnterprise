package org.example.controller;

import org.example.entity.Author;
import org.example.services.AuthorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/author")
public class AuthorController {

    private AuthorService authorService;

    @Autowired
    public void setAuthorService(AuthorService authorService) {
        this.authorService = authorService;
    }

    @GetMapping("/list")
    public String list(Model model) {
        List<Author> authors = authorService.getAuthor();
        model.addAttribute("authors", authors);
        return "authors/list";
    }

    @GetMapping("/add")
    public String add(Model model){
        Author author = new Author();
        model.addAttribute("authors", author);
        return "authors/add";
    }

    @PostMapping("/add")
    public String add(@ModelAttribute("author") Author author){
        authorService.saveAuthor(author);
        return "redirect:/author/list";
    }
}
