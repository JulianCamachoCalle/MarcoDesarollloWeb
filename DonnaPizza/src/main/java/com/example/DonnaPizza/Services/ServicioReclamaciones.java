/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.DonnaPizza.Services;

import com.example.DonnaPizza.Model.reclamaciones;
import com.example.DonnaPizza.Repository.reclamacionesDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServicioReclamaciones {
    @Autowired
    private reclamacionesDAO reclamacionesDAO;
    
//Select
    public List<reclamaciones> getList() {
        return reclamacionesDAO.findAll();
    }
    
    //INSERT Y UPDATE
    public reclamaciones save(reclamaciones reclamacion) {
        return reclamacionesDAO.save(reclamacion);
    }
    
    //SELECT
    public reclamaciones get(Long id) {
        return reclamacionesDAO.findById(id).orElse(null);
    }
    
    //DELETE
    public void delete(Long id) {
        reclamacionesDAO.deleteById(id);
    }
    
    
    
    
}