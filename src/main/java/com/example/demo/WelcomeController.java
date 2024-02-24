package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

@Controller
public class WelcomeController {

    @GetMapping("/")
    public String welcome(Model model) 
    {
        model.addAttribute("message", "Welcome to COMP367");
        return "welcome";
    }
}