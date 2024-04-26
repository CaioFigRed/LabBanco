package com.example.labbanco.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "beneficiarios")
public class Beneficiario {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_bnf")
    @SequenceGenerator(name = "seq_bnf", sequenceName = "SEQ_BNF", allocationSize = 1)
    @Column(name = "bnf_id")
    private Long id;

    @Column(name = "bnf_cpf")
    private String cpf;

    @Column(name = "bnf_dat_nasc")
    private Date dataNascimento;

    @Column(name = "bnf_deficiente_fisico")
    private Boolean deficienteFisico;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bnf_sex_id")
    private Sexo sexo;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bnf_rcs_id")
    private Raca raca;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bnf_mun_id")
    private Municipio municipio;
}
