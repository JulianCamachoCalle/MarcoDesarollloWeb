package com.example.DonnaPizza.controladores;

import com.example.DonnaPizza.Model.ContactoDp;
import com.example.DonnaPizza.DAO.ContactoDAO;
import com.example.DonnaPizza.DAO.sugerenciasDAO;
import com.example.DonnaPizza.Model.sugerencias;
import jakarta.servlet.http.HttpServletRequest;
import java.time.LocalDate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.validation.annotation.Validated;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    ContactoDAO objCont = new ContactoDAO();

    @GetMapping({"/contacto"})
    public String contacto(Model model) {
        return "contactopizza";
    }

    @PostMapping("/registrar")
    public String registarContacto(@Validated ContactoDp contacto) {
        if (contacto != null) {
            objCont.registrarCont(contacto);
        }
        return "contactopizza";
    }

    @GetMapping("/listacontacto")
    public String getLista(Model model) {
        List<ContactoDp> listCont = new ArrayList<>();
        listCont = objCont.getcontacto();
        model.addAttribute("listaA", listCont);
        return "listacontactos";
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

    //registro
    @RequestMapping("/dataFormRegistro")
    public String dataFormRegistro(@RequestParam("nombre") String nombre,
            @RequestParam("apellidos") String apellidos,
            @RequestParam("correo") String correo,
            @RequestParam("numero") String numero,
            @RequestParam("cumpleanos") LocalDate cumpleanos,
            @RequestParam("contrasena") String contrasena,
            Model model
    ) {
        model.addAttribute("nombre", nombre);
        model.addAttribute("apellidos", apellidos);
        model.addAttribute("correo", correo);
        model.addAttribute("numero", numero);
        model.addAttribute("cumpleanos", cumpleanos);
        model.addAttribute("contrasena", contrasena);
        return "usuario";
    }

    @GetMapping("/changeLanguage")
    public String changeLanguage(@RequestParam("lang") String lang, HttpServletRequest request) {
        request.getSession().setAttribute("org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE", new Locale(lang));
        return "redirect:" + request.getHeader("Referer");
    }

    sugerenciasDAO objSug = new sugerenciasDAO();

    @GetMapping("/sugerencias")
    public String sugerencias(Model model) {
        return "sugerencias";
    }

    @PostMapping("/registrarsugerencia")
    public String registarSugerencia(@Validated sugerencias sugerencia) {
        if (sugerencia != null) {
            objSug.registrarSug(sugerencia);
        }
        return "sugerencias";
    }

    @GetMapping("/listasugerencias")
    public String getListaSugerencias(Model model) {
        List<sugerencias> listSug = new ArrayList<>();
        listSug = objSug.getsugerencias();
        model.addAttribute("listaA", listSug);
        return "listasugerencias";
    }

    @GetMapping("/reclamaciones")
    public String reclamaciones(Model model) {
        return "reclamaciones";
    }
}
