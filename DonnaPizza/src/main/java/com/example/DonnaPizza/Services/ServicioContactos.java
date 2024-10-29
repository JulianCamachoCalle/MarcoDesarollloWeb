
package com.example.DonnaPizza.Services;

import com.example.DonnaPizza.Model.Contactos;
import com.example.DonnaPizza.Repository.ContactosDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServicioContactos {
   @Autowired 
    private ContactosDAO contactosdao;
   
   //Select
    public List<Contactos> getList() {
        return contactosdao.findAll();
    }
    
    //INSERT Y UPDATE
    public Contactos save(Contactos contactos) {
        return contactosdao.save(contactos);
    }
    
    //SELECT
    public Contactos get(Long id) {
        return contactosdao.findById(id).orElse(null);
    }
    
    //DELETE
    public void delete(Long id) {
       contactosdao.deleteById(id);
    }
    
    
}
