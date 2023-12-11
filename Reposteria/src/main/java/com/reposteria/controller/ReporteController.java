
package com.reposteria.controller;

import com.reposteria.service.ReporteService;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/reportes")
public class ReporteController {
    
    @Autowired
    ReporteService reporteService;
    
    @GetMapping("/principal") //Mostrar solo el html
    public String principal(Model model){
        return"/reportes/principal";
    }
    
    @GetMapping("/Usuarios")
    public ResponseEntity<Resource> usuarios (@RequestParam String tipo)throws IOException{
        return reporteService.generarReporte("usuarios", null, tipo);
    }
    
       @GetMapping("/venta")
    public ResponseEntity<Resource> ventas (@RequestParam String tipo)throws IOException{
        return reporteService.generarReporte("venta", null, tipo);
    }
    
    @GetMapping("/Producto")
    public ResponseEntity<Resource> producto (@RequestParam String tipo)throws IOException{
        return reporteService.generarReporte("Producto", null, tipo);
    }
    
    @GetMapping("/Factura")
    public ResponseEntity<Resource> factura (@RequestParam String tipo)throws IOException{
        return reporteService.generarReporte("Factura", null, tipo);
    }
}

