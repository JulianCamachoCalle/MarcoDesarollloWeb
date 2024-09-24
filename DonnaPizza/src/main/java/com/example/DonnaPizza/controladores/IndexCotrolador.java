package com.example.DonnaPizza.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexCotrolador {

    @GetMapping("/")
    public String index() {
        return "index";
    }
}
