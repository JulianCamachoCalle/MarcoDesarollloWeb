package com.example.DonnaPizza.Services;

import com.example.DonnaPizza.Model.User;
import com.example.DonnaPizza.webConfiguraciones.UserRegistrationDTO;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface ServicioUser extends UserDetailsService {

    User save(UserRegistrationDTO registrationDTO);
}
