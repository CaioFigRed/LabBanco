-- Comandos sql para a criação das tabelas de historiamento

CREATE TABLE HBENEFICIARIOS
(
    hbnf_id                NUMBER NOT NULL ,
    hbnf_cpf               CHAR (11) ,
    hbnf_dat_nasc           DATE ,
    hbnf_deficiente_fisico NUMBER ,
    hbnf_hsex_id           NUMBER NOT NULL ,
    hbnf_hrcs_id           NUMBER NOT NULL ,
    hbnf_hmun_id           NUMBER NOT NULL,
    hbnf_dat_entrada        DATE
) ;
COMMENT ON COLUMN HBENEFICIARIOS.hbnf_id
    IS
        'Armazena o valor historiado do identificador unico do beneficiario' ;
COMMENT ON COLUMN HBENEFICIARIOS.hbnf_cpf
    IS
        'Armazena o valor historiado do cpf do beneficiario' ;
COMMENT ON COLUMN HBENEFICIARIOS.hbnf_dat_nasc
    IS
        'Armazena a data historiada de nascimento do beneficiario' ;
COMMENT ON COLUMN HBENEFICIARIOS.hbnf_deficiente_fisico
    IS
        'Armazena o valor historiado se o beneficiario e deficiente fisico' ;
COMMENT ON COLUMN HBENEFICIARIOS.hbnf_hsex_id
    IS
        'Armazena o valor historiado do identificador do unico do hsexo do beneficiario' ;
COMMENT ON COLUMN HBENEFICIARIOS.hbnf_hrcs_id
    IS
        'Armazena o valor historiado do identificador unico da raca do beneficiario' ;
COMMENT ON COLUMN HBENEFICIARIOS.hbnf_hmun_id
    IS
        'Armazena o valor historiado do identificador unico do municipio onde o beneficiario mora' ;
COMMENT ON COLUMN HBENEFICIARIOS.hbnf_dat_entrada
    IS
        'Armazena o valor historiado da data de entrada da modificacao na tabela beneficiario' ;
ALTER TABLE HBENEFICIARIOS ADD CONSTRAINT HBNF_PK PRIMARY KEY ( hbnf_id, hbnf_dat_entrada ) ;



CREATE TABLE HBOLSAS
(
    hbol_id     NUMBER NOT NULL ,
    hbol_ano    NUMBER ,
    hbol_cur_id NUMBER NOT NULL ,
    hbol_hins_id NUMBER NOT NULL ,
    hbol_bnf_id NUMBER NOT NULL ,
    hbol_htip_id NUMBER NOT NULL,
    hbol_dat_entrada DATE
) ;
COMMENT ON COLUMN HBOLSAS.hbol_id
    IS
        'Armazena o valor historiado do identificador unico da bolsa' ;
COMMENT ON COLUMN HBOLSAS.hbol_ano
    IS
        'Armazena o valor historiado do ano que a bolsa foi concedida' ;
COMMENT ON COLUMN HBOLSAS.hbol_cur_id
    IS
        'Armazena o valor historiado do identificador unico do curso oferecido pela bolsa' ;
COMMENT ON COLUMN HBOLSAS.hbol_hins_id
    IS
        'Armazena o valor historiado do identificador unico da instituicao de ensino que ira ofertar a bolsa' ;
COMMENT ON COLUMN HBOLSAS.hbol_bnf_id
    IS
        'Armazena o valor historiado do identificador unico do beneficiario da bolsa' ;
COMMENT ON COLUMN HBOLSAS.hbol_htip_id
    IS
        'Armazena o o valor historiado do identificador unico do tipo de bolsa' ;
COMMENT ON COLUMN HBOLSAS.hbol_dat_entrada
    IS
        'Armazena o valor historiado da data de entrada da modificacao na tabela Hbolsas' ;
ALTER TABLE HBOLSAS ADD CONSTRAINT HBOL_PK PRIMARY KEY ( hbol_id, hbol_dat_entrada ) ;



CREATE TABLE HCURSOS
(
    hcur_id     NUMBER NOT NULL ,
    hcur_nome   VARCHAR2 (255) ,
    hcur_hmod_id NUMBER NOT NULL ,
    hcur_htur_id NUMBER NOT NULL,
    hcur_dat_entrada DATE
) ;
COMMENT ON COLUMN HCURSOS.hcur_id
    IS
        'Armazena o valor historiado do identificador unico do curso' ;
COMMENT ON COLUMN HCURSOS.hcur_nome
    IS
        'Armazena o valor historiado do nome do curso' ;
COMMENT ON COLUMN HCURSOS.hcur_hmod_id
    IS
        'Armazena o valor historiado do identificador unico da modalidade do curso' ;
COMMENT ON COLUMN HCURSOS.hcur_htur_id
    IS
        'Armazena o valor historiado do identificador unico do turno do curso' ;
COMMENT ON COLUMN HCURSOS.hcur_dat_entrada
    IS
        'Armazena o valor historiado da data de entrada da modificacao na tabela curso' ;
ALTER TABLE HCURSOS ADD CONSTRAINT HCUR_PK PRIMARY KEY ( hcur_id, hcur_dat_entrada ) ;



CREATE TABLE HINSTITUICOES_ENSINO
(
    hins_id   NUMBER NOT NULL ,
    hins_nome VARCHAR2 (255) NOT NULL,
    hins_dat_entrada DATE
) ;
COMMENT ON COLUMN HINSTITUICOES_ENSINO.hins_id
    IS
        'Armazena o valor historiado da instituicao de ensino' ;
COMMENT ON COLUMN HINSTITUICOES_ENSINO.hins_nome
    IS
        'Armazena o valor historiado do nome da instituicao de ensino' ;
COMMENT ON COLUMN HINSTITUICOES_ENSINO.hins_dat_entrada
    IS
        'Armazena o valor historiado da data de entrada da modificacao na tabela instituicao de ensino' ;
ALTER TABLE HINSTITUICOES_ENSINO ADD CONSTRAINT HINS_PK PRIMARY KEY ( hins_id, hins_dat_entrada ) ;



CREATE TABLE HMODALIDADES
(
    hmod_id NUMBER NOT NULL ,
    hmod_nome VARCHAR2 (50),
    hmod_dat_entrada DATE
) ;
COMMENT ON COLUMN HMODALIDADES.hmod_id
    IS
        'Armazena o valor historiado do identificador unico da modalidade do curso' ;
COMMENT ON COLUMN HMODALIDADES.hmod_nome
    IS
        'Armazena o valor historiado do nome da modalidade de curso' ;
COMMENT ON COLUMN HMODALIDADES.hmod_dat_entrada
    IS
        'Armazena o valor historiado da data de entrada da modificacao na tabela modalidades' ;
ALTER TABLE HMODALIDADES ADD CONSTRAINT HMOD_PK PRIMARY KEY ( hmod_id, hmod_dat_entrada ) ;



CREATE TABLE HMUNICIPIOS
(
    hmun_id     NUMBER NOT NULL ,
    hmun_nome   VARCHAR2 (255) ,
    hmun_ufs_id NUMBER NOT NULL,
    hmun_dat_entrada DATE
) ;
COMMENT ON COLUMN HMUNICIPIOS.hmun_id
    IS
        'Armazena o valor historiado do identificador unico do municipio' ;
COMMENT ON COLUMN HMUNICIPIOS.hmun_nome
    IS
        'Armazena o valor historiado do nome do municipio' ;
COMMENT ON COLUMN HMUNICIPIOS.hmun_ufs_id
    IS
        'Armazena o valor historiado do identificador unico da uf a qual o municipio pertence' ;
COMMENT ON COLUMN HMUNICIPIOS.hmun_dat_entrada
    IS
        'Armazena o valor historiado da data de entrada da modificacao na tabela municipios' ;
ALTER TABLE HMUNICIPIOS ADD CONSTRAINT HMUN_PK PRIMARY KEY ( hmun_id, hmun_dat_entrada ) ;



CREATE TABLE HRACAS
(
    hrcs_id NUMBER NOT NULL ,
    hrcs_nome VARCHAR2 (10),
    hrcs_dat_entrada DATE
) ;
COMMENT ON COLUMN HRACAS.hrcs_id
    IS
        'Armazena o valor historiado do identificador unico de racas' ;
COMMENT ON COLUMN HRACAS.hrcs_nome
    IS
        'Armazena o valor historiado do nome da raca cadastrada' ;
COMMENT ON COLUMN HRACAS.hrcs_dat_entrada
    IS
        'Armazena o valor historiado da data de entrada da modificacao na tabela racas' ;
ALTER TABLE HRACAS ADD CONSTRAINT HRCS_PK PRIMARY KEY ( hrcs_id, hrcs_dat_entrada ) ;



CREATE TABLE HREGIOES
(
    hreg_id NUMBER NOT NULL ,
    hreg_nome VARCHAR2 (12),
    hreg_dat_entrada DATE
) ;
COMMENT ON COLUMN HREGIOES.hreg_id
    IS
        'Armazena o valor historiado do identificador unico de regioes' ;
COMMENT ON COLUMN HREGIOES.hreg_nome
    IS
        'Armazena o valor historiado do nome da regiao armazenada' ;
COMMENT ON COLUMN HREGIOES.hreg_dat_entrada
    IS
        'Armazena o valor historiado da data de entrada da modificacao na tabela regioes' ;
ALTER TABLE HREGIOES ADD CONSTRAINT HREG_PK PRIMARY KEY ( hreg_id, hreg_dat_entrada ) ;



CREATE TABLE HSEXOS
(
    hsex_id NUMBER NOT NULL ,
    hsex_letra CHAR (2) NOT NULL,
    hsex_dat_entrada DATE
) ;
COMMENT ON COLUMN HSEXOS.hsex_id
    IS
        'Armazena o valor historiado do identifcador unico de sexos' ;
COMMENT ON COLUMN HSEXOS.hsex_letra
    IS
        'Armazena o valor historiado da letra que identifica o sexo' ;
COMMENT ON COLUMN HSEXOS.hsex_dat_entrada
    IS
        'Armazena o valor historiado da data de entrada da modificacao na tabela sexos' ;
ALTER TABLE HSEXOS ADD CONSTRAINT HSEX_PK PRIMARY KEY ( hsex_id, hsex_dat_entrada ) ;



CREATE TABLE HTIPOS_BOLSA
(
    htip_id NUMBER NOT NULL ,
    htip_nome VARCHAR2 (50),
    htip_dat_entrada DATE
) ;
COMMENT ON COLUMN HTIPOS_BOLSA.htip_id
    IS
        'Armazena o valor historiado do identificador unico de tipos de bolsas' ;
COMMENT ON COLUMN HTIPOS_BOLSA.htip_nome
    IS
        'Armazena o valor historiado do nome do tipo de bolsa cadastrado' ;
COMMENT ON COLUMN HTIPOS_BOLSA.htip_dat_entrada
    IS
        'Armazena o valor historiado da data de entrada da modificacao na tabela tipos_bolsa' ;
ALTER TABLE HTIPOS_BOLSA ADD CONSTRAINT HTIP_BOLSAS_PK PRIMARY KEY ( htip_id, htip_dat_entrada ) ;

CREATE TABLE HTURNOS_CURSO
(
    htur_id   NUMBER NOT NULL ,
    htur_nome VARCHAR2 (50),
    htur_dat_entrada DATE
) ;
COMMENT ON COLUMN HTURNOS_CURSO.htur_id
    IS
        'Armazena o valor historiado do identificador unico do turno de curso' ;
COMMENT ON COLUMN HTURNOS_CURSO.htur_nome
    IS
        'Armazena o valor historiado do nome do turno de curso' ;
COMMENT ON COLUMN HTURNOS_CURSO.htur_dat_entrada
    IS
        'Armazena o valor historiado da data de entrada da modificacao na tabela turnos_curso' ;
ALTER TABLE HTURNOS_CURSO ADD CONSTRAINT HTUR_PK PRIMARY KEY ( htur_id, htur_dat_entrada ) ;



CREATE TABLE HUFS
(
    hufs_id     NUMBER NOT NULL ,
    hufs_sigla  CHAR (2) ,
    hufs_reg_id NUMBER NOT NULL,
    hufs_dat_entrada DATE
) ;
COMMENT ON COLUMN HUFS.hufs_id
    IS
        'Armazena o valor historiado do identificador unico da uf' ;
COMMENT ON COLUMN HUFS.hufs_sigla
    IS
        'Armazena o valor historiado da sigla da uf' ;
COMMENT ON COLUMN HUFS.hufs_reg_id
    IS
        'Armazena o valor historiado do identifcador unico da regiao a qual a uf pertence' ;
COMMENT ON COLUMN HUFS.hufs_dat_entrada
    IS
        'Armazena o valor historiado da data de entrada da modificacao na tabela ufs' ;
ALTER TABLE HUFS ADD CONSTRAINT HUFS_PK PRIMARY KEY ( hufs_id, hufs_dat_entrada ) ;