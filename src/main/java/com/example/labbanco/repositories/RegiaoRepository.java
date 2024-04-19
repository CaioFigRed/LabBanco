package com.example.labbanco.repositories;

import com.example.labbanco.entities.Municipio;
import com.example.labbanco.entities.Regiao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RegiaoRepository extends JpaRepository<Regiao, Long> {
    Regiao findByNome(String regiaoBeneficiarioBolsa);
}
