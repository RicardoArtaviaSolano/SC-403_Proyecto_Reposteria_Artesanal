
package com.reposteria.service.impl;

import com.reposteria.dao.ProductoDao;
import com.reposteria.domain.Producto;
import com.reposteria.service.ProductoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductoServiceImpl implements ProductoService{
    
    
    //La anotacion autowired crea un unico objeto mientras se ejecuta la aplicacion
    @Autowired
    private ProductoDao productoDao;
    
    @Override
    public List<Producto> getProductos(boolean activos){
    
        var lista=productoDao.findAll();//encontrar todos los datos de la lista
        
        if (activos){
            lista.removeIf(e-> !e.isActivo());
        }
        
        return lista;
    }
}
