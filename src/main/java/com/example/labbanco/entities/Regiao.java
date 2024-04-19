package com.example.labbanco.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "regioes")
public class Regiao {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_reg")
    @SequenceGenerator(name = "seq_reg", sequenceName = "SEQ_REG", allocationSize = 1)
    @Column(name = "reg_id")
    private Long id;

    @Column(name = "reg_nome")
    private String nome;
}
