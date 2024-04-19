package com.example.labbanco.repositories;

import com.example.labbanco.entities.Prouni;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProuniRepository extends JpaRepository<Prouni, Long> {
}
