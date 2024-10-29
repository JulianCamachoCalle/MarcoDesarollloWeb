package com.example.DonnaPizza.controladores;

import com.example.DonnaPizza.Model.Cliente;
import com.example.DonnaPizza.Services.ServicioCliente;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ClienteControlador {

    @Autowired
    ServicioCliente servicioCliente;

    @GetMapping("/CRUDClientes")
    public String CRUDClientes(Model model) {
        List<Cliente> lista = servicioCliente.getList();
        model.addAttribute("lista", lista);
        return "CRUDClientes";
    }

    @GetMapping("/formClientes")
    public String formClientes(Model model) {
        model.addAttribute("clientes", new Cliente());
        return "formClientes";
    }

    @PostMapping("/registrarClientes")
    public String grabarClientes(@ModelAttribute Cliente clientes, Model model) {
        try {
            servicioCliente.save(clientes);
            return "redirect:/CRUDClientes";
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("errorMessage", e.getMessage());
            model.addAttribute("clientes", clientes);
            return "formClientes";
        }
    }

    @GetMapping("/getEdit/{codigoclientes}")
    public String editFormClientes(Model model, @PathVariable("codigoclientes") Long id) {
        Cliente clientes = servicioCliente.get(id);
        model.addAttribute("clientes", clientes);
        return "formClientes";
    }

    @PostMapping("/actualizarCliente")
    public String actualizarCliente(@ModelAttribute Cliente cliente, Model model) {
        try {
            Cliente clienteExistente = servicioCliente.get(cliente.getId_cliente());
            if (clienteExistente != null) {
                clienteExistente.setNombre(cliente.getNombre());
                clienteExistente.setApellido(cliente.getApellido());
                clienteExistente.setEmail(cliente.getEmail());
                clienteExistente.setTelefono(cliente.getTelefono());
                clienteExistente.setDireccion(cliente.getDireccion());
                servicioCliente.save(clienteExistente);
            }
            return "redirect:/CRUDClientes";
        } catch (DataIntegrityViolationException e) {
            model.addAttribute("errorMessage", e.getMessage());
            model.addAttribute("clientes", cliente);
            return "formClientes";
        }
    }

    @GetMapping("/delete/{id}")
    public String deleteFormClientes(@PathVariable("id") Long id) {
        servicioCliente.delete(id);
        return "redirect:/CRUDClientes";
    }
}
