package com.reposteria.controller;

import com.reposteria.service.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/producto")

public class ProductoController {
    
    @Autowired
    private ProductoService productoService;
    
    @GetMapping("/listado")//ejecuta lo de la plantilla y crea un url
    public String listado(Model model){
        
        var productos = productoService.getProductos(false); // trae toas las productos tanto activas como inactivas
        model.addAttribute("productos", productos);
        model.addAttribute("totalProductos",productos.size());
        
        return "/producto/listado"; //es un folder en templates que vamos a crear 
    }
}
