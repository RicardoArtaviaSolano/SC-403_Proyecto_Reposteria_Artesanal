
package com.reposteria.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity

@Table(name="producto")
//Serializacion va almacenar datos de la bd
public class Producto implements Serializable{
    
    private static final long serialVersionUID = 1L; //Para poder hacer el cilo de la sumatoria de la categorio (AUTO_INCREMENT)
    
    @Id //Id es la llave de la tabla producto
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ProductoID")
    private long ProductoID;
    private String Nombre;
    private String Descripcion;
    private int Precio;
    private int Stock;
    private String Imagen;
    private boolean activo;

    public Producto() {
    }


    public Producto(String Descripcion, boolean activo) {
        this.Descripcion = Descripcion;
        this.activo = activo;
    }
    
}
