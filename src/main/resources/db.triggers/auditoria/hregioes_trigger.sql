create or replace NONEDITIONABLE TRIGGER TG_AUD_H_REGIOES
    AFTER DELETE OR UPDATE
    ON HREGIOES
    FOR EACH ROW
DECLARE
usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HREGIOES';
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

        IF :OLD.HREG_ID <> :NEW.HREG_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HREG_ID',
                    operacao,
                    :OLD.HREG_ID,
                    :NEW.HREG_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HREG_NOME <> :NEW.HREG_NOME THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HREG_NOME',
                    operacao,
                    :OLD.HREG_NOME,
                    :NEW.HREG_NOME,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HREG_DAT_ENTRADA <> :NEW.HREG_DAT_ENTRADA THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HREG_DAT_ENTRADA',
                    operacao,
                    :OLD.HREG_DAT_ENTRADA,
                    :NEW.HREG_DAT_ENTRADA,
                    usuario_bd,
                    usuario_so
                );
END IF;
END IF;
END;