package com.example.labbanco.repositories;

import com.example.labbanco.entities.Bolsa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BolsaRepository extends JpaRepository<Bolsa, Long> {
}
