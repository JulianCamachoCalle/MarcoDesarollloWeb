/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.DonnaPizza.controladores;

import com.example.DonnaPizza.Model.reclamaciones;
import com.example.DonnaPizza.Model.reclamaciones;
import com.example.DonnaPizza.Services.ServicioReclamaciones;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReclamacionesControlador {
    @Autowired
    ServicioReclamaciones ServicioReclamaciones;
    
     
    @GetMapping("/registrarreclamacion")
    public String formreclamaciones(Model model) {
        model.addAttribute("reclamaciones", new reclamaciones());
        return "reclamacion-form";
    }

    @PostMapping("/registrarreclamacion")
    public String grabarReclamacion(@ModelAttribute reclamaciones reclamacion, Model model) {
        try {
            ServicioReclamaciones.save(reclamacion);
            return "redirect:/reclamaciones";
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("errorMessage", e.getMessage().toString());
            model.addAttribute("reclamaciones", reclamacion);
            return "reclamaciones";
        }

    }
}
