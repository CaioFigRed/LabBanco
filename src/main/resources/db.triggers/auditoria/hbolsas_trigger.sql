create or replace NONEDITIONABLE TRIGGER TG_AUD_H_BOLSAS
    AFTER DELETE OR UPDATE
    ON HBOLSAS
    FOR EACH ROW
DECLARE
    usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HBOLSAS';
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

        IF :OLD.HBOL_ID <> :NEW.HBOL_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBOL_ID',
                    operacao,
                    :OLD.HBOL_ID,
                    :NEW.HBOL_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HBOL_ANO <> :NEW.HBOL_ANO THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBOL_ANO',
                    operacao,
                    :OLD.HBOL_ANO,
                    :NEW.HBOL_ANO,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HBOL_CUR_ID <> :NEW.HBOL_CUR_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBOL_CUR_ID',
                    operacao,
                    :OLD.HBOL_CUR_ID,
                    :NEW.HBOL_CUR_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HBOL_HINS_ID <> :NEW.HBOL_HINS_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBOL_HINS_ID',
                    operacao,
                    :OLD.HBOL_HINS_ID,
                    :NEW.HBOL_HINS_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HBOL_BNF_ID <> :NEW.HBOL_BNF_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBOL_BNF_ID',
                    operacao,
                    :OLD.HBOL_BNF_ID,
                    :NEW.HBOL_BNF_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HBOL_HTIP_ID <> :NEW.HBOL_HTIP_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBOL_HTIP_ID',
                    operacao,
                    :OLD.HBOL_HTIP_ID,
                    :NEW.HBOL_HTIP_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HBOL_DAT_ENTRADA <> :NEW.HBOL_DAT_ENTRADA THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBOL_DAT_ENTRADA',
                    operacao,
                    :OLD.HBOL_DAT_ENTRADA,
                    :NEW.HBOL_DAT_ENTRADA,
                    usuario_bd,
                    usuario_so
                );
END IF;

END IF;
END;