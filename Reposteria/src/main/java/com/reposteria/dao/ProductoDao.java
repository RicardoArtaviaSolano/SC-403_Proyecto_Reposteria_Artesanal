
package com.reposteria.dao;

import com.reposteria.domain.Producto;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ProductoDao extends JpaRepository <Producto, Long>{
        
}
