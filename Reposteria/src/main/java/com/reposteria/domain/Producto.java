
package com.reposteria.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name = "Productos")
public class Producto implements Serializable{
    
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="ProductoID")
    private long ProductoID;
    private String Nombre;
    private String Descripcion;
    private int Precio;
    private int Stock;
    private String Categoria;
    private String Imagen;
    private boolean activo;

    public Producto() {
    }

    public Producto(long ProductoID, String Nombre, String Descripcion, int Precio, int Stock, String Categoria, String Imagen, boolean activo) {
        this.ProductoID = ProductoID;
        this.Nombre = Nombre;
        this.Descripcion = Descripcion;
        this.Precio = Precio;
        this.Stock = Stock;
        this.Categoria = Categoria;
        this.Imagen = Imagen;
        this.activo = activo;
    }


}
