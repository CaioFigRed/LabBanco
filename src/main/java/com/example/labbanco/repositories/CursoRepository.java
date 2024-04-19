package com.example.labbanco.repositories;

import com.example.labbanco.entities.Bolsa;
import com.example.labbanco.entities.Curso;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CursoRepository extends JpaRepository<Curso, Long> {
    Curso findByNome(String nomeCursoBolsa);
}
