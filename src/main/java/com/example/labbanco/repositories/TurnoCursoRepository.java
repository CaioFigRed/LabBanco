package com.example.labbanco.repositories;

import com.example.labbanco.entities.TipoBolsa;
import com.example.labbanco.entities.TurnoCurso;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TurnoCursoRepository extends JpaRepository<TurnoCurso, Long> {
    TurnoCurso findByNome(String nomeTurnoCursoBolsa);
}
