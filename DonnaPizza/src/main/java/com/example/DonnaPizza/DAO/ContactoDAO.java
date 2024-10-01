package com.example.DonaPizza.DAO;

import com.example.DonaPizza.javaentity.ContactoDp;
import java.util.ArrayList;


public class ContactoDAO {
    ArrayList<ContactoDp> listaCont=new ArrayList<>();
    public void registrarCont(ContactoDp objAE){
        listaCont.add(objAE);
    }
    public ArrayList<ContactoDp> getcontacto(){
        return listaCont;
    }
}
