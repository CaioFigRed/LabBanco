package com.example.labbanco.repositories;

import com.example.labbanco.entities.Bolsa;
import com.example.labbanco.entities.UF;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UFRepository extends JpaRepository<UF, Long> {
    UF findBySigla(String siglaUfBeneficiarioBolsa);
}
