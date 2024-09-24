package com.example.DonnaPizza.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ControladorPrincipal {

    @GetMapping("/index")
    public String index(Model model) {
        return "index";
    }

    @GetMapping("/carta")
    public String carta(Model model) {
        return "carta";
    }

    @GetMapping("/membresia")
    public String membresia(Model model) {
        return "membresia";
    }

    @GetMapping("/locales")
    public String locales(Model model) {
        return "locales";
    }

    @GetMapping("/login")
    public String login(Model model) {
        return "login";
    }
    
    @GetMapping("/sugerencias")
    public String sugerencias(Model model) {
        return "sugerencias";
    }
    
    @GetMapping("/reclamaciones")
    public String reclamaciones(Model model) {
        return "reclamaciones";
    }
}
