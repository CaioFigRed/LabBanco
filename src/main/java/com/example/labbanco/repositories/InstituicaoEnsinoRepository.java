package com.example.labbanco.repositories;

import com.example.labbanco.entities.Bolsa;
import com.example.labbanco.entities.InstituicaoEnsino;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InstituicaoEnsinoRepository extends JpaRepository<InstituicaoEnsino, Long> {
    InstituicaoEnsino findByNome(String nomeIesBolsa);
}
