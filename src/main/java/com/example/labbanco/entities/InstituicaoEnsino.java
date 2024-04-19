package com.example.labbanco.entities;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "instituicoes_ensino")
public class InstituicaoEnsino {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_ins")
    @SequenceGenerator(name = "seq_ins", sequenceName = "SEQ_INS", allocationSize = 1)
    @Column(name = "ins_id")
    private Long id;

    @Column(name = "ins_nome")
    private String nome;

}
