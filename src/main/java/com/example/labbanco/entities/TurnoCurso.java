package com.example.labbanco.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "turnos_curso")
public class TurnoCurso {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_tur")
    @SequenceGenerator(name = "seq_tur", sequenceName = "SEQ_TUR", allocationSize = 1)
    @Column(name = "tur_id")
    private Long id;

    @Column(name = "tur_nome")
    private String nome;
}