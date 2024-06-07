create or replace NONEDITIONABLE TRIGGER TG_AUD_H_TIPOS_BOLSA
    AFTER DELETE OR UPDATE
    ON HTIPOS_BOLSA
    FOR EACH ROW
DECLARE
    usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HTIPOS_BOLSA';
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

        IF :OLD.HTIP_ID <> :NEW.HTIP_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HTIP_ID',
                    operacao,
                    :OLD.HTIP_ID,
                    :NEW.HTIP_ID,
                    usuario_bd,
                    usuario_so
                );
        END IF;
        IF :OLD.HTIP_NOME <> :NEW.HTIP_NOME THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HTIP_NOME',
                    operacao,
                    :OLD.HTIP_NOME,
                    :NEW.HTIP_NOME,
                    usuario_bd,
                    usuario_so
                );
        END IF;

        IF :OLD.HTIP_DAT_ENTRADA <> :NEW.HTIP_DAT_ENTRADA THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HTIP_DAT_ENTRADA',
                    operacao,
                    :OLD.HTIP_DAT_ENTRADA,
                    :NEW.HTIP_DAT_ENTRADA,
                    usuario_bd,
                    usuario_so
                );
        END IF;
    END IF;
END;