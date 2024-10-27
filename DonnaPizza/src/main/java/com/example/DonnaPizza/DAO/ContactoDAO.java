package com.example.DonnaPizza.DAO;

import com.example.DonnaPizza.Model.ContactoDp;
import java.util.ArrayList;
import java.util.List;


public class ContactoDAO {
    ArrayList<ContactoDp> listaCont=new ArrayList<>();
    public void registrarCont(ContactoDp objAE){
        listaCont.add(objAE);
    }
    public ArrayList<ContactoDp> getcontacto(){
        return listaCont;
    }

    public List<ContactoDp> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ContactoDp save(ContactoDp contacto) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public Object findById(Long id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
