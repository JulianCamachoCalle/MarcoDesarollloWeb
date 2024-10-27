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
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="contacto")
public class ContactoDp {
    @Id
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private Long id_contactos ;
    
    private String nombre;
    private String email;
    private String telefono;
    
    
    
    
}

