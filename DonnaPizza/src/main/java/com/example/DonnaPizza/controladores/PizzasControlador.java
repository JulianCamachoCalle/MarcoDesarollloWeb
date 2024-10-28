package com.example.DonnaPizza.controladores;

import com.example.DonnaPizza.Model.Pizzas;
import com.example.DonnaPizza.Services.ServicioPizzas;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class PizzasControlador {

    @Autowired
    ServicioPizzas servicioPizzas;

    @GetMapping({"/CRUDPizzas"})
    public String CRUDPizzas(Model model) {
        return "CRUDPizzas";
    }

    @GetMapping("/getListPizzasJSON")
    public ResponseEntity<List<Pizzas>> listarPizzasJSON() {
        List<Pizzas> lista = servicioPizzas.getList();
        return ResponseEntity.ok(lista);
    }
}
