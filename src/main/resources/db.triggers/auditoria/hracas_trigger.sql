create or replace NONEDITIONABLE TRIGGER TG_AUD_H_RACAS
    AFTER DELETE OR UPDATE
    ON HRACAS
    FOR EACH ROW
DECLARE
usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HRACAS';
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

        IF :OLD.HRCS_ID <> :NEW.HRCS_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HRCS_ID',
                    operacao,
                    :OLD.HRCS_ID,
                    :NEW.HRCS_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HRCS_NOME <> :NEW.HRCS_NOME THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HRCS_NOME',
                    operacao,
                    :OLD.HRCS_NOME,
                    :NEW.HRCS_NOME,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HRCS_DAT_ENTRADA <> :NEW.HRCS_DAT_ENTRADA THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HRCS_DAT_ENTRADA',
                    operacao,
                    :OLD.HRCS_DAT_ENTRADA,
                    :NEW.HRCS_DAT_ENTRADA,
                    usuario_bd,
                    usuario_so
                );
END IF;
END IF;
END;