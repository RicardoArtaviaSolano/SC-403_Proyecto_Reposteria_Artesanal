package com.reposteria.service;

import com.reposteria.domain.Producto;
import java.util.List;


public interface ProductoService {
    
    //Se declara un metodo par aobtener un ArrayList de Objetos Producto
    //Los objetos vienen de la tabla producto, todos los resgistros
    
    public List<Producto> getProductos(boolean activos);
    //Abajo se colocara los metodos para realizar el CRUD de productos

}
