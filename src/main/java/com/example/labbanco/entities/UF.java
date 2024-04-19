package com.example.labbanco.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "ufs")
public class UF {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_ufs")
    @SequenceGenerator(name = "seq_ufs", sequenceName = "SEQ_UFS", allocationSize = 1)
    @Column(name = "ufs_id")
    private Long id;

    @Column(name = "ufs_sigla")
    private String sigla;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ufs_reg_id")
    private Regiao regiao;
}
