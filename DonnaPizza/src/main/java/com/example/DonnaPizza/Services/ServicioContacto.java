
package com.example.DonnaPizza.Services;

import com.example.DonnaPizza.Model.ContactoDp;
import com.example.DonnaPizza.Repository.ContactoDAO;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ServicioContacto {
  
@Autowired
private ContactoDAO contactoDao;
//Select
    public List<ContactoDp> getList() {
        return contactoDao.findAll();
    }
    
    //INSERT Y UPDATE
    public ContactoDp save(ContactoDp contacto) {
        return contactoDao.save(contacto);
    }
    
    //SELECT
    public ContactoDp get(Long id) {
        return contactoDao.findById(id).orElse(null);
    }
    
    //DELETE
    public void delete(Long id) {
        contactoDao.deleteById(id);
    }
    
}
