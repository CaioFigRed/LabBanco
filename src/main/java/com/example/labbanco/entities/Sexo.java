package com.example.labbanco.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "sexos")
public class Sexo {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_sex")
    @SequenceGenerator(name = "seq_sex", sequenceName = "SEQ_SEX", allocationSize = 1)
    @Column(name = "sex_id")
    private Long id;

    @Column(name = "sex_letra")
    private String letra;
}
