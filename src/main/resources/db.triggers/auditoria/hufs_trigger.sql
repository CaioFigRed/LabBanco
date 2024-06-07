create or replace NONEDITIONABLE TRIGGER TG_AUD_H_UFS
    AFTER DELETE OR UPDATE
    ON HUFS
    FOR EACH ROW
DECLARE
usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HUFS';
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

        IF :OLD.HUFS_ID <> :NEW.HUFS_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HUFS_ID',
                    operacao,
                    :OLD.HUFS_ID,
                    :NEW.HUFS_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HUFS_SIGLA <> :NEW.HUFS_SIGLA THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HUFS_SIGLA',
                    operacao,
                    :OLD.HUFS_SIGLA,
                    :NEW.HUFS_SIGLA,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HUFS_REG_ID <> :NEW.HUFS_REG_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HUFS_REG_ID',
                    operacao,
                    :OLD.HUFS_REG_ID,
                    :NEW.HUFS_REG_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HUFS_DAT_ENTRADA <> :NEW.HUFS_DAT_ENTRADA THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HUFS_DAT_ENTRADA',
                    operacao,
                    :OLD.HUFS_DAT_ENTRADA,
                    :NEW.HUFS_DAT_ENTRADA,
                    usuario_bd,
                    usuario_so
                );
END IF;
END IF;
END;