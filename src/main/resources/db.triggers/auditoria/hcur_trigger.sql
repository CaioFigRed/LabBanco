create or replace NONEDITIONABLE TRIGGER TG_AUD_H_CURSOS
    AFTER DELETE OR UPDATE
    ON HCURSOS
    FOR EACH ROW
DECLARE
usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HCURSOS';
    operacao    CHAR(1);
BEGIN
    IF DELETING THEN
        operacao := 'D';
        LAB_AUDITORIA.proc_insert_aud(
                :OLD.ROWID,
                SYSDATE,
                nome_tabela,
                NULL,
                operacao,
                NULL,
                NULL,
                usuario_bd,
                usuario_so
            );
ELSE
        operacao := 'U';

        IF :OLD.HCUR_ID <> :NEW.HCUR_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HCUR_ID',
                    operacao,
                    :OLD.HCUR_ID,
                    :NEW.HCUR_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HCUR_NOME <> :NEW.HCUR_NOME THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HCUR_NOME',
                    operacao,
                    :OLD.HCUR_NOME,
                    :NEW.HCUR_NOME,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HCUR_HMOD_ID <> :NEW.HCUR_HMOD_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HCUR_HMOD_ID',
                    operacao,
                    :OLD.HCUR_HMOD_ID,
                    :NEW.HCUR_HMOD_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HCUR_HTUR_ID <> :NEW.HCUR_HTUR_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HCUR_HTUR_ID',
                    operacao,
                    :OLD.HCUR_HTUR_ID,
                    :NEW.HCUR_HTUR_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HCUR_DAT_ENTRADA <> :NEW.HCUR_DAT_ENTRADA THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HCUR_DAT_ENTRADA',
                    operacao,
                    :OLD.HCUR_DAT_ENTRADA,
                    :NEW.HCUR_DAT_ENTRADA,
                    usuario_bd,
                    usuario_so
                );
END IF;
END IF;
END;