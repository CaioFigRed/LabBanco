package com.example.labbanco.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "tipos_bolsa")
public class TipoBolsa {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_tip")
    @SequenceGenerator(name = "seq_tip", sequenceName = "SEQ_TIP", allocationSize = 1)
    @Column(name = "tip_id")
    private Long id;

    @Column(name = "tip_nome")
    private String nome;
}
