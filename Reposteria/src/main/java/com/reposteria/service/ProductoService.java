package com.reposteria.service;

import com.reposteria.domain.Producto;
import java.util.List;

public interface ProductoService {
    
    //Se declara un metodo para obtener un ArrayList de Objetos
    // Los objetos viene de la tabla categoria, todos los registros 
    
    public List<Producto> getProductos(boolean activos);
    
    //Abajo se colocara los metodos para realizar el CRUD de productos.
    
}
