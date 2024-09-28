package com.example.DonnaPizza.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.DonnaPiza.DAO.sugerenciasDAO;
import com.example.DonnaPiza.Entity.sugerencias;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.validation.annotation.Validated;
import java.util.ArrayList;
import java.util.List;

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
    sugerenciasDAO objSug=new sugerenciasDAO();
    @GetMapping("/sugerencias")
    public String sugerencias(Model model) {
        return "sugerencias";
    }
    @PostMapping("/registrar")
    public String registarSugerencia(@Validated sugerencias sugerencia){
        if(sugerencia!=null){ 
            objSug.registrarSug(sugerencia);
        }
        return "sugerencias";
    }
    @GetMapping("/lista")
    public String getLista(Model model){
        List<sugerencias> listSug= new ArrayList<>();
        listSug=objSug.getsugerencias();
        model.addAttribute("listaA", listSug);
        return "listasugerencias";
    }
    
    @GetMapping("/reclamaciones")
    public String reclamaciones(Model model) {
        return "reclamaciones";
    }
}
