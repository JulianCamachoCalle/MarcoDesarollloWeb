/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.example.DonnaPizza.Services;


import com.example.DonnaPizza.Model.sugerencias;
import com.example.DonnaPizza.Repository.sugerenciasDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServicioSugerencias {
    @Autowired
    private sugerenciasDAO sugerenciasDao;
    
//Select
    public List<sugerencias> getList() {
        return sugerenciasDao.findAll();
    }
    
    //INSERT Y UPDATE
    public sugerencias save(sugerencias sugerencia) {
        return sugerenciasDao.save(sugerencia);
    }
    
    //SELECT
    public sugerencias get(Long id) {
        return sugerenciasDao.findById(id).orElse(null);
    }
    
    //DELETE
    public void delete(Long id) {
        sugerenciasDao.deleteById(id);
    }
    
    
    
    
}
