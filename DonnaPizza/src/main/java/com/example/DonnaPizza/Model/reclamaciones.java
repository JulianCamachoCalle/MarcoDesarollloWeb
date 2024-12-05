/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.DonnaPizza.Model;

import jakarta.persistence.Column;
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
@Table (name="reclamaciones")
public class reclamaciones {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long idReclamacion;
    
    private String nombre;
    private String domicilio;
    @Column(unique = true)
    private String dni;
    private String telefono;
    @Column(unique = true)
    private String correo;
    private String bien;
    private String monto;
    private String descripcion;
    private String tiporeclamo;
    private String detalle;
    private String pedido;







   
}