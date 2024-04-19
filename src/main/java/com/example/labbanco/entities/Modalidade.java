package com.example.labbanco.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "modalidades")
public class Modalidade {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_mod")
    @SequenceGenerator(name = "seq_mod", sequenceName = "SEQ_MOD", allocationSize = 1)
    @Column(name = "mod_id")
    private Long id;

    @Column(name = "mod_nome")
    private String nome;
}