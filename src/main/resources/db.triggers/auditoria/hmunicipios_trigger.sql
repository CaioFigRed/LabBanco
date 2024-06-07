create or replace NONEDITIONABLE TRIGGER TG_AUD_H_MUNICIPIOS
    AFTER DELETE OR UPDATE
    ON HMUNICIPIOS
    FOR EACH ROW
DECLARE
usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HMUNICIPIOS';
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

        IF :OLD.HMUN_ID <> :NEW.HMUN_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HMUN_ID',
                    operacao,
                    :OLD.HMUN_ID,
                    :NEW.HMUN_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HMUN_NOME <> :NEW.HMUN_NOME THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HMUN_NOME',
                    operacao,
                    :OLD.HMUN_NOME,
                    :NEW.HMUN_NOME,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HMUN_UFS_ID <> :NEW.HMUN_UFS_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HMUN_UFS_ID',
                    operacao,
                    :OLD.HMUN_UFS_ID,
                    :NEW.HMUN_UFS_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HMUN_DAT_ENTRADA <> :NEW.HMUN_DAT_ENTRADA THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HMUN_DAT_ENTRADA',
                    operacao,
                    :OLD.HMUN_DAT_ENTRADA,
                    :NEW.HMUN_DAT_ENTRADA,
                    usuario_bd,
                    usuario_so
                );
END IF;
END IF;
END;