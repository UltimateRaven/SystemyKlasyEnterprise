package org.example.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class HomeController {
    @GetMapping("/")
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String indexPage(ModelMap model) {
        model.addAttribute("message", "Access for everybody");
        return "index";
    }

    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {
        model.addAttribute("message", "Admin Page...");
        return "admin";
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String userPage(ModelMap model) {
        model.addAttribute("message", "User page...");
        return "user";
    }
}
