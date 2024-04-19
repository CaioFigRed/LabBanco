package com.example.labbanco.repositories;

import com.example.labbanco.entities.Bolsa;
import com.example.labbanco.entities.Modalidade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ModalidadeRepository extends JpaRepository<Modalidade, Long> {
    Modalidade findByNome(String modalidadeEnsinoBolsa);
}
