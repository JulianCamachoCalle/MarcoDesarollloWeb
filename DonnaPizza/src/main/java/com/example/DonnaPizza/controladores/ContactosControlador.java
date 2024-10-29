
package com.example.DonnaPizza.controladores;

import com.example.DonnaPizza.Model.Contactos;
import com.example.DonnaPizza.Services.ServicioContactos;
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
public class ContactosControlador {
    @Autowired
    ServicioContactos serviciocontactos;
    
    @GetMapping("/listacontactos")
    public String CRUDcontactos(Model model) {
        List<Contactos> lista = serviciocontactos.getList();
        model.addAttribute("lista", lista);
        
        return "listacontactos";
    }
    
    @GetMapping("/formcontactos")
    public String formcontactos(Model model) {
        model.addAttribute("contactos", new Contactos());
        return "formcontactos";
    }
    
    @PostMapping("/registrarcontactos")
    public String grabarContactos(@ModelAttribute Contactos contactos, Model model) {
        try {
            serviciocontactos.save(contactos);
            return "redirect:/listacontactos";
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("errorMessage", e.getMessage().toString());
            model.addAttribute("contactos", contactos);
            return "formcontactos";
        }
    }
       @GetMapping("/getEditcontactos/{id_contactos}")
    public String editFormsugerencias(Model model, @PathVariable("id_contactos") Long id) {
        Contactos contactos = serviciocontactos.get(id);
        model.addAttribute("contactos", contactos);
        return "formcontactos";
    }
    @GetMapping("/deletecontactos/{id_contactos}")
    public String deleteFormsugerencias(Model model, @RequestParam("id_contactos") Long id) {
        serviciocontactos.delete(id);
        return "redirect:/listacontactos";
    }
}
