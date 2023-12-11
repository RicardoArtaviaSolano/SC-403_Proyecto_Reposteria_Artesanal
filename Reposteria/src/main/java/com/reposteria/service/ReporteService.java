package com.reposteria.service;

import java.io.IOException;
import java.util.Map;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;


public interface ReporteService {
    
    public ResponseEntity<Resource>
            generarReporte(
            String reporte,//El nombre del archivo llamado .jasper
                    Map<String,Object>parametros, //Los parametros del reporte
                    String tipo)throws IOException; //El tipo de reporte csv, pdf, excel o txt
}
