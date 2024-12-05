package com.example.DonnaPizza.config;

import com.example.DonnaPizza.Services.ServicioUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.session.HttpSessionEventPublisher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private ServicioUser servicioUser;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
        auth.setUserDetailsService(servicioUser);
        auth.setPasswordEncoder(passwordEncoder());
        return auth;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http.csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/", "/index", 
                                "/sugerencias", 
                                "/login", 
                                "/register", 
                                "/css/**", 
                                "/js/**", 
                                "/img/**", 
                                "/img.pizzas/**",
                                "/carta",
                                "/client",
                                "/menu",
                                "/changeLanguage",
                                "/especificaciones",
                                "/formClientes",
                                "/formPizzas",
                                "/formcontactos",
                                "/formclient",
                                "/locales",
                                "/membresia",
                                "/reclamaciones",
                                "/pizzas/**",
                                "/register/**"
                        
                        
                        ).permitAll()
                        .requestMatchers("/admin/**").hasRole("ADMIN")
                        .requestMatchers("/menu/**").hasAnyRole("USER", "ADMIN")
                        .requestMatchers("/cart/**").hasAnyRole("USER", "ADMIN")
                        .anyRequest().authenticated()
                )
                .formLogin(form -> form
                        .loginPage("/login")
                        .defaultSuccessUrl("/menu", true)
                        .permitAll())
                .logout(logout ->
                        logout.logoutUrl("/logout")
                        .logoutSuccessUrl("/index")
                        .permitAll())
                .sessionManagement(session -> session
                        .invalidSessionUrl("/login")
                        .maximumSessions(1)
                        .expiredUrl("/login?expired")
                        .maxSessionsPreventsLogin(false))
                .sessionManagement(session -> session
                        .sessionFixation().migrateSession()
                        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
                        .invalidSessionUrl("/login")
                        .maximumSessions(1)
                        .expiredUrl("/login?expired"))
                .build();
    }

    @Bean
    public HttpSessionEventPublisher httpSessionEventPublisher() {
        return new HttpSessionEventPublisher();
    }
}
    

