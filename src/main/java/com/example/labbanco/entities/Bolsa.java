package com.example.labbanco.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "bolsas")
public class Bolsa {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_bol")
    @SequenceGenerator(name = "seq_bol", sequenceName = "LAB_BANCO.SEQ_BOL", allocationSize = 1)
    @Column(name = "bol_id")
    private Long id;

    @Column(name = "bol_ano")
    private Long ano;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bol_cur_id")
    private Curso curso;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bol_ins_id")
    private InstituicaoEnsino instituicaoEnsino;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinColumn(name = "bol_bnf_id")
    private Beneficiario beneficiario;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bol_tip_id")
    private TipoBolsa tipoBolsa;
}
