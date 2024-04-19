package com.example.labbanco.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "cursos")
public class Curso {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_cur")
    @SequenceGenerator(name = "seq_cur", sequenceName = "SEQ_CUR", allocationSize = 1)
    @Column(name = "cur_id")
    private Long id;

    @Column(name = "cur_nome")
    private String nome;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cur_mod_id")
    private Modalidade modalidade;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cur_tur_id")
    private TurnoCurso turnoCurso;
}
