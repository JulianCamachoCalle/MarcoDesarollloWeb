package com.example.DonnaPizza.controladores;

import com.example.DonnaPizza.DAO.sugerenciasDAO;
import com.example.DonnaPizza.Model.sugerencias;
import com.example.DonnaPizza.Model.usuario;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.validation.annotation.Validated;
import java.util.ArrayList;
import java.util.List;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ControladorPrincipal {
    
    @GetMapping("/")
    public String index() {
        return "index";
    }
    
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
    
    //registro
    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("usuario", new usuario());
        return "login";
    }
    
    @PostMapping("/dataFormRegistro")
    public String dataFormRegistro(
            @ModelAttribute usuario usuario, Model model) {
        model.addAttribute("usuario", usuario);
        return "usuario";
    }
    
    sugerenciasDAO objSug=new sugerenciasDAO();
    @GetMapping("/sugerencias")
    public String sugerencias(Model model) {
        return "sugerencias";
    }
    @PostMapping("/registrarsugerencia")
    public String registarSugerencia(@Validated sugerencias sugerencia){
        if(sugerencia!=null){ 
            objSug.registrarSug(sugerencia);
        }
        return "sugerencias";
    }
    @GetMapping("/listasugerencias")
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
