package com.example.labbanco.repositories;

import com.example.labbanco.entities.Raca;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RacaRepository extends JpaRepository<Raca, Long> {


    Raca findByNome(String racaBeneficiarioBolsa);
}
