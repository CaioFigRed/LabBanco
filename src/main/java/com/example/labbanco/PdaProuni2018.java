package com.example.labbanco;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "PDA_PROUNI_2018")
public class PdaProuni2018 {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Long id;

    @Column(name = "CPF_BENEFICIARIO_BOLSA", length = 255)
    private String cpfBeneficiarioBolsa;

    @Column(name = "ANO_CONCESSAO_BOLSA")
    private Long anoConcessaoBolsa;  // Alterei para Integer, pois parece ser um ano.

    @Column(name = "CODIGO_EMEC_IES_BOLSA")
    private Long codigoEmecIesBolsa;

    @Column(name = "NOME_IES_BOLSA", length = 255)
    private String nomeIesBolsa;

    @Column(name = "TIPO_BOLSA", length = 50)
    private String tipoBolsa;  // Ajustei o tamanho máximo para 50 caracteres.

    @Column(name = "MODALIDADE_ENSINO_BOLSA", length = 50)
    private String modalidadeEnsinoBolsa;  // Ajustei o tamanho máximo para 50 caracteres.

    @Column(name = "NOME_CURSO_BOLSA", length = 255)
    private String nomeCursoBolsa;

    @Column(name = "NOME_TURNO_CURSO_BOLSA", length = 50)
    private String nomeTurnoCursoBolsa;  // Ajustei o tamanho máximo para 50 caracteres.

    @Column(name = "SEXO_BENEFICIARIO_BOLSA", length = 10)
    private String sexoBeneficiarioBolsa;  // Ajustei o tamanho máximo para 10 caracteres.

    @Column(name = "RACA_BENEFICIARIO_BOLSA", length = 50)
    private String racaBeneficiarioBolsa;  // Ajustei o tamanho máximo para 50 caracteres.

    @Column(name = "DT_NASCIMENTO_BENEFICIARIO", length = 10)
    private String dtNascimentoBeneficiario;  // Ajustei o tamanho máximo para 10 caracteres.

    @Column(name = "BENEFICIARIO_DEFICIENTE_FISICO", length = 1)
    private String beneficiarioDeficienteFisico;  // Ajustei o tamanho máximo para 1 caractere.

    @Column(name = "REGIAO_BENEFICIARIO_BOLSA", length = 50)
    private String regiaoBeneficiarioBolsa;  // Ajustei o tamanho máximo para 50 caracteres.

    @Column(name = "SIGLA_UF_BENEFICIARIO_BOLSA", length = 2)
    private String siglaUfBeneficiarioBolsa;  // Ajustei o tamanho máximo para 2 caracteres.

    @Column(name = "MUNICIPIO_BENEFICIARIO_BOLSA", length = 100)
    private String municipioBeneficiarioBolsa;  // Ajustei o tamanho máximo para 100 caracteres.
}
