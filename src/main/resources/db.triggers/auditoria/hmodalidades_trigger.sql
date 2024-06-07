create or replace NONEDITIONABLE TRIGGER TG_AUD_H_MODALIDADES
    AFTER DELETE OR UPDATE
    ON HMODALIDADES
    FOR EACH ROW
DECLARE
usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HMODALIDADES';
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

        IF :OLD.HMOD_ID <> :NEW.HMOD_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HMOD_ID',
                    operacao,
                    :OLD.HMOD_ID,
                    :NEW.HMOD_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HMOD_NOME <> :NEW.HMOD_NOME THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HMOD_NOME',
                    operacao,
                    :OLD.HMOD_NOME,
                    :NEW.HMOD_NOME,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HMOD_DAT_ENTRADA <> :NEW.HMOD_DAT_ENTRADA THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HMOD_DAT_ENTRADA',
                    operacao,
                    :OLD.HMOD_DAT_ENTRADA,
                    :NEW.HMOD_DAT_ENTRADA,
                    usuario_bd,
                    usuario_so
                );
END IF;
END IF;
END;