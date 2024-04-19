package com.example.labbanco.repositories;

import com.example.labbanco.PdaProuni2018;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PdaProuniRepository extends JpaRepository<PdaProuni2018, Long> {


}
