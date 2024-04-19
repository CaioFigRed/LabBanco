package com.example.labbanco.repositories;

import com.example.labbanco.entities.Modalidade;
import com.example.labbanco.entities.Municipio;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MunicipioRepository extends JpaRepository<Municipio, Long> {
    Municipio findByNome(String municipioBeneficiarioBolsa);
}
