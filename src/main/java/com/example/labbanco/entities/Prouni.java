package com.example.labbanco.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Prouni {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String ANO_CONCESSAO_BOLSA;
    private String CODIGO_EMEC_IES_BOLSA;
    private String NOME_IES_BOLSA;
    private String TIPO_BOLSA;
    private String MODALIDADE_ENSINO_BOLSA;
    private String NOME_CURSO_BOLSA;
    private String NOME_TURNO_CURSO_BOLSA;
    private String CPF_BENEFICIARIO_BOLSA;
    private String SEXO_BENEFICIARIO_BOLSA;
    private String RACA_BENEFICIARIO_BOLSA;
    private String DT_NASCIMENTO_BENEFICIARIO_BOLSA;
    private String BENEFICIARIO_DEFICIENTE_FISICO;
    private String REGIAO_BENEFICIARIO_BOLSA;
    private String SIGLA_UF_BENEFICIARIO_BOLSA;
    private String MUNICIPIO_BENEFICIARIO_BOLSA;


}
