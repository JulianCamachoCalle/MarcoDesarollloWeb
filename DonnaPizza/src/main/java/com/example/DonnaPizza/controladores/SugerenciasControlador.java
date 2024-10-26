/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.DonnaPizza.controladores;

import com.example.DonnaPizza.Model.sugerencias;
import com.example.DonnaPizza.Services.ServicioSugerencias;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SugerenciasControlador {
    @Autowired
    ServicioSugerencias servicioSugerencias;
    
    @GetMapping("/listasugerencias")
    public String CRUDsugerencias(Model model) {
        List<sugerencias> lista = servicioSugerencias.getList();
        model.addAttribute("lista", lista);
        
        return "listasugerencias";
    }
    
    @GetMapping("/sugerencias")
    public String formsugerencias(Model model) {
        model.addAttribute("sugerencias", new sugerencias());
        return "sugerencias";
    }
    
    @PostMapping("/registrarsugerencia")
    public String grabarClientes(@ModelAttribute sugerencias sugerencia, Model model) {
        try {
            servicioSugerencias.save(sugerencia);
            return "redirect:/listasugerencias";
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("errorMessage", e.getMessage().toString());
            model.addAttribute("sugerencias", sugerencia);
            return "sugerencias";
        }
    }
       @GetMapping("/getEdit/{cod_suge}")
    public String editFormsugerencias(Model model, @PathVariable("cod_suge") Long id) {
        sugerencias sugerencia = servicioSugerencias.get(id);
        model.addAttribute("sugerencias", sugerencia);
        return "sugerencias";
    }
    
    public String deleteFormsugerencias(Model model, @RequestParam("id") Long id) {
        servicioSugerencias.delete(id);
        return "redirect:/listasugerencias";
    }
    
    
    
    
    
}
