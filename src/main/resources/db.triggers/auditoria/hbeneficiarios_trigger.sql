create or replace NONEDITIONABLE TRIGGER TG_AUD_H_BENEFICIARIOS
    AFTER DELETE OR UPDATE
    ON HBENEFICIARIOS
    FOR EACH ROW
DECLARE
usuario_bd  VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    usuario_so  VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    nome_tabela VARCHAR2(30) := 'HBENEFICIARIOS';
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

        IF :OLD.HBNF_ID <> :NEW.HBNF_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBNF_ID',
                    operacao,
                    :OLD.HBNF_ID,
                    :NEW.HBNF_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HBNF_CPF <> :NEW.HBNF_CPF THEN
            LAB_AUDITORIA.proc_insert_aud(
                    :OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBNF_CPF',
                    operacao,
                    :OLD.HBNF_CPF,
                    :NEW.HBNF_CPF,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HBNF_DAT_NASC <> :NEW.HBNF_DAT_NASC THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBNF_DAT_NASC',
                    operacao,
                    :OLD.HBNF_DAT_NASC,
                    :NEW.HBNF_DAT_NASC,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HBNF_DEFICIENTE_FISICO <> :NEW.HBNF_DEFICIENTE_FISICO THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBNF_DEFICIENTE_FISICO',
                    operacao,
                    :OLD.HBNF_DEFICIENTE_FISICO,
                    :NEW.HBNF_DEFICIENTE_FISICO,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HBNF_HSEX_ID <> :NEW.HBNF_HSEX_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBNF_HSEX_ID',
                    operacao,
                    :OLD.HBNF_HSEX_ID,
                    :NEW.HBNF_HSEX_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HBNF_HRCS_ID <> :NEW.HBNF_HRCS_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBNF_HRCS_ID',
                    operacao,
                    :OLD.HBNF_HRCS_ID,
                    :NEW.HBNF_HRCS_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;

        IF :OLD.HBNF_HMUN_ID <> :NEW.HBNF_HMUN_ID THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBNF_HMUN_ID',
                    operacao,
                    :OLD.HBNF_HMUN_ID,
                    :NEW.HBNF_HMUN_ID,
                    usuario_bd,
                    usuario_so
                );
END IF;
        IF :OLD.HBNF_DAT_ENTRADA <> :NEW.HBNF_DAT_ENTRADA THEN
            LAB_AUDITORIA.proc_insert_aud(
                    : OLD.ROWID,
                    SYSDATE,
                    nome_tabela,
                    'HBNF_DAT_ENTRADA',
                    operacao,
                    :OLD.HBNF_DAT_ENTRADA,
                    :NEW.HBNF_DAT_ENTRADA,
                    usuario_bd,
                    usuario_so
                );
END IF;
END IF;
END;