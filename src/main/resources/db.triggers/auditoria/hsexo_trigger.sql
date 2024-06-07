create or replace NONEDITIONABLE TRIGGER TG_AUD_H_SEXOS
    AFTER DELETE OR UPDATE
    ON HSEXOS
    FOR EACH ROW
DECLARE
    usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HINSTITUICOES_ENSINO';
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

        IF :OLD.HSEX_ID <> :NEW.HSEX_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HSEX_ID',
                    operacao,
                    :OLD.HSEX_ID,
                    :NEW.HSEX_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HSEX_LETRA <> :NEW.HSEX_LETRA THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HSEX_LETRA',
                    operacao,
                    :OLD.HSEX_LETRA,
                    :NEW.HSEX_LETRA,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HSEX_DAT_ENTRADA <> :NEW.HSEX_DAT_ENTRADA THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HSEX_DAT_ENTRADA',
                    operacao,
                    :OLD.HSEX_DAT_ENTRADA,
                    :NEW.HSEX_DAT_ENTRADA,
                    usuario_bd,
                    usuario_so
                );
END IF;
END IF;
END;