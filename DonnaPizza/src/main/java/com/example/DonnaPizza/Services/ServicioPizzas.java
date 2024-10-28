package com.example.DonnaPizza.Services;

import com.example.DonnaPizza.Model.Pizzas;
import com.example.DonnaPizza.Repository.PizzasDAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServicioPizzas {

    @Autowired
    private PizzasDAO pizzasDao;

    // Obtener todas las pizzas
    public List<Pizzas> getList() {
        return pizzasDao.findAll();
    }

    // Guardar o actualizar una pizza
    public Pizzas save(Pizzas pizzas) {
        return pizzasDao.save(pizzas);
    }

    // Obtener una pizza por ID
    public Pizzas getById(Long id) {
        return pizzasDao.findById(id).orElse(null);
    }

    // Eliminar una pizza por ID
    public void deleteById(Long id) {
        pizzasDao.deleteById(id);
    }
}
