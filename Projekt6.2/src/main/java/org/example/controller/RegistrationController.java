package org.example.controller;

import org.example.entity.Authority;
import org.example.entity.User;
import org.example.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class RegistrationController {
    private final UserService userService;

    @Autowired
    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping(value = {"/register"})
    public String registerForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String saveUser(@ModelAttribute("user") User user, Model model) {
        String info = info(user);
        if (!info.isEmpty()) {
            model.addAttribute("info", info);
            return "register";
        }
        user.getAuthorities().add(new Authority(user, "ROLE_USER"));
        userService.saveUser(user);
        return "redirect:/login";
    }

    @GetMapping(value = {"/adminregister"})
    public String registerForm2(Model model) {
        model.addAttribute("user", new User());
        return "adminregister";
    }

    @PostMapping("/adminregister")
    public String saveAdmin(@ModelAttribute("user") User user, Model model) {
        String info = info(user);
        if (!info.isEmpty()) {
            model.addAttribute("info", info);
            return "adminregister";
        }
        user.getAuthorities().add(new Authority(user, "ROLE_USER"));
        user.getAuthorities().add(new Authority(user, "ROLE_ADMIN"));
        userService.saveUser(user);
        return "redirect:/login";
    }

    private String info(User user) {
        if (userService.getUser(user.getUsername()) != null) {
            return "użytkownik o takiej nazwie istnieje";
        } else if (user.getUsername().isEmpty() || user.getPassword().isEmpty()) {
            return "wypełnij wszystkie pola";
        }
        return "";
    }

    @RequestMapping("/success")
    public void loginPageRedirect(HttpServletRequest request, HttpServletResponse response, Authentication authResult) throws ServletException, IOException {
        String role =  authResult.getAuthorities().toString();
        System.out.println("ROLEEEE "+ role);
        if(role.contains("ROLE_ADMIN")){
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/admin"));
        }
        else if(role.contains("ROLE_USER")) {
            response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/user"));
        }
    }

}
