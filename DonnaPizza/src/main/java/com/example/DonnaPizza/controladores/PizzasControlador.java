package com.example.DonnaPizza.controladores;

import com.example.DonnaPizza.Model.Pizzas;
import com.example.DonnaPizza.Services.ServicioPizzas;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
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

    @GetMapping("/CRUDPizzas/{id}")
    public ResponseEntity<Pizzas> getPizzaById(@PathVariable Long id) {
        Pizzas pizza = servicioPizzas.getById(id);
        if (pizza != null) {
            return ResponseEntity.ok(pizza);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/CRUDPizzas")
    public ResponseEntity<Pizzas>
    crearPizzas(@RequestBody Pizzas pizza) {
        Pizzas pizzacreada = servicioPizzas.save(pizza);
        return ResponseEntity.status(HttpStatus.CREATED).body(pizzacreada);
    }

    @PutMapping("/CRUDPizzas/{id}")
    public ResponseEntity<Pizzas> actualizarPizza(@PathVariable Long id, @RequestBody Pizzas pizzaDetalles) {
        Pizzas pizzaExistente = servicioPizzas.getById(id);
        if (pizzaExistente != null) {
            pizzaExistente.setNombre(pizzaDetalles.getNombre());
            pizzaExistente.setDescripcion(pizzaDetalles.getDescripcion());
            pizzaExistente.setPrecio(pizzaDetalles.getPrecio());
            pizzaExistente.setDisponible(pizzaDetalles.getDisponible());

            Pizzas pizzaActualizada = servicioPizzas.save(pizzaExistente);
            return ResponseEntity.ok(pizzaActualizada);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/CRUDPizzas/{id}")
    public ResponseEntity<Void> eliminarPizza(@PathVariable Long id) {
        Pizzas pizzaExistente = servicioPizzas.getById(id);
        if (pizzaExistente != null) {
            servicioPizzas.deleteById(id);
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
