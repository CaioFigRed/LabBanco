package com.example.labbanco.controllers;

import com.example.labbanco.repositories.PdaProuniRepository;
import com.example.labbanco.services.MigrationService;
import com.example.labbanco.services.ProuniService;
import jakarta.annotation.PostConstruct;
import org.springframework.stereotype.Controller;

@Controller
public class MigrationController {

    private final MigrationService migrationService;
    private final ProuniService prouniService;
    private final PdaProuniRepository pdaProuniRepository;

    public MigrationController(MigrationService migrationService, ProuniService prouniService, PdaProuniRepository pdaProuniRepository) {
        this.migrationService = migrationService;
        this.prouniService = prouniService;
        this.pdaProuniRepository = pdaProuniRepository;
    }

    @PostConstruct
    public void migrateData() {
        prouniService.distribuiDados();
    }

}
