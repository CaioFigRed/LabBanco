create or replace NONEDITIONABLE TRIGGER TG_AUD_H_INSTITUICOES_ENSINO
    AFTER DELETE OR UPDATE
    ON HINSTITUICOES_ENSINO
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

        IF :OLD.HINS_ID <> :NEW.HINS_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HINS_ID',
                    operacao,
                    :OLD.HINS_ID,
                    :NEW.HINS_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HINS_NOME <> :NEW.HINS_NOME THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HINS_NOME',
                    operacao,
                    :OLD.HINS_NOME,
                    :NEW.HINS_NOME,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HINS_DAT_ENTRADA <> :NEW.HINS_DAT_ENTRADA THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HINS_DAT_ENTRADA',
                    operacao,
                    :OLD.HINS_DAT_ENTRADA,
                    :NEW.HINS_DAT_ENTRADA,
                    usuario_bd,
                    usuario_so
                );
END IF;
END IF;
END;