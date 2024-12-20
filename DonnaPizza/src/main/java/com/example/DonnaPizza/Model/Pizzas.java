
package com.example.DonnaPizza.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity

@Table (name = "pizzas")
public class Pizzas {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id_pizza;
    
    private String nombre;
    private String descripcion;
    private Long precio;
    private String disponible;
}
