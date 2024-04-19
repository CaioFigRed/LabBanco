package com.example.labbanco.repositories;

import com.example.labbanco.entities.Sexo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SexoRepository extends JpaRepository<Sexo, Long> {
    Sexo findByLetra(String sexoBeneficiarioBolsa);
}
