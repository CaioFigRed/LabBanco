package com.example.labbanco.repositories;

import com.example.labbanco.entities.Regiao;
import com.example.labbanco.entities.TipoBolsa;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TipoBolsaRepository extends JpaRepository<TipoBolsa, Long> {
    TipoBolsa findByNome(String tipoBolsa);
}
