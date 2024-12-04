package com.example.DonnaPizza.controladores;

import com.example.DonnaPizza.Services.ServicioUserImpl;
import com.example.DonnaPizza.webConfiguraciones.UserRegistrationDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/register")
public class RegisterControlador {

    @Autowired
    private ServicioUserImpl servicioUser;

    @ModelAttribute("user")
    public UserRegistrationDTO userRegistrationDTO() {
        return new UserRegistrationDTO();
    }

    @PostMapping
    public String registerUserAccount(@ModelAttribute("user")UserRegistrationDTO registrationDTO) {
        servicioUser.save(registrationDTO);
        return "redirect:/login?success";
    }
}
