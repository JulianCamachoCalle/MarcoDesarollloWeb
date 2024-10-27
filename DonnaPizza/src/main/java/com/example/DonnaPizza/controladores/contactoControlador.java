
package com.example.DonnaPizza.controladores;

import com.example.DonnaPizza.Model.ContactoDp;
import com.example.DonnaPizza.Services.ServicioContacto;
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
public class contactoControlador {
    @Autowired
    ServicioContacto servicioContacto;
    @GetMapping("/listacontactos")
    public String CRUDContactos(Model model) {
        List<ContactoDp> lista = servicioContacto.getList();
        model.addAttribute("lista", lista);
        
        return "listacontactos";
    }
    
    @GetMapping("/listacontactos")
    public String formClientes(Model model) {
        model.addAttribute("contactos", new ContactoDp());
        return "listacontactos";
    }
    @PostMapping("/registrarContacto")
    public String grabarContactos(@ModelAttribute ContactoDp contactos, Model model) {
        try {
            servicioContacto.save(contactos);
            return "redirect:/listacontactos";
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("errorMessage", e.getMessage().toString());
            model.addAttribute("contactos", contactos);
            return "index";
        }
    }
    
    @GetMapping("/getEditcontactos/{codigocontactos}")
    public String editFormContactos(Model model, @PathVariable("codigocontactos") Long id) {
        ContactoDp contactos = servicioContacto.get(id);
        model.addAttribute("contactos", contactos);
        return "index";
    }
    
    public String deleteFormContactos(Model model, @RequestParam("id_contacto") Long id) {
        servicioContacto.delete(id);
        return "redirect:/listacontactos";
    }
    
}
