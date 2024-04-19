package com.example.labbanco.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "municipios")
public class Municipio {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_mun")
    @SequenceGenerator(name = "seq_mun", sequenceName = "SEQ_MUN", allocationSize = 1)
    @Column(name = "mun_id")
    private Long id;

    @Column(name = "mun_nome")
    private String nome;

    @ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.LAZY)
    @JoinColumn(name = "mun_ufs_id")
    private UF uf;

}
