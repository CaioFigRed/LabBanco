package com.example.labbanco.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "racas")
public class Raca {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_rcs")
    @SequenceGenerator(name = "seq_rcs", sequenceName = "SEQ_RCS", allocationSize = 1)
    @Column(name = "rcs_id")
    private Long id;

    @Column(name = "rcs_nome")
    private String nome;
}
