USE CORPORE_RESIDENCIAL
SELECT
 
PFUNC.CHAPA
--,PFUNC.TIPODEMISSAO
--,PFUNC.DATADEMISSAO
,PFUNC.CODPESSOA
,PPESSOA.SEXO
,PFUNC.CODSITUACAO as 'SITUA��O'
,PFUNC.CODSECAO AS 'SE��O'
,PFUNC.CODCOLIGADA AS 'COLIGADA'
,PPESSOA.CPF
,PFUNC.DATAADMISSAO AS 'ADMISS�O'
,PFUNC.NOME AS 'NOME FUNCIONARIO'
,GUSUARIO.CODUSUARIO AS 'USU�RIO RM'
,ppessoa.EMAIL
,PFUNCAO.NOME AS 'FUNCAO'
,ISNULL (PPESSOA.TELEFONE1, '� POSSUI') AS 'TELEFONE'
,NROCENCUSTOCONT AS 'CENTRO DE CUSTO'
,GCCUSTO.NOME AS 'DEPARTAMENTO/LOCAL DE ACESSO'
,PSECAO.DESCRICAO AS 'NOME SE��O'
,PSECAO.CEP
,PPESSOA.RUA
,PPESSOA.NUMERO
,PPESSOA.COMPLEMENTO
,PPESSOA.BAIRRO
,PSECAO.CIDADE
,PSECAO.ESTADO
,ISNULL (GUSUARIO.EMAIL , 'N�O POSSUI') AS 'E-MAIL'
,PCODINSTRUCAO.DESCRICAO AS 'GRAU INSTRUCAO'
--,GUSRPERFIL.CODPERFIL AS 'PERFIL ACESSO'
 

    FROM PFUNC (NOLOCK)

        LEFT JOIN PSECAO            (NOLOCK)				 ON (PFUNC.CODSECAO = PSECAO.CODIGO AND PFUNC.CODCOLIGADA = PSECAO.CODCOLIGADA)
        LEFT JOIN PFUNCAO            (NOLOCK)			 ON (PFUNC.CODFUNCAO = PFUNCAO.CODIGO AND PFUNC.CODCOLIGADA = PFUNCAO.CODCOLIGADA)
        LEFT JOIN GCCUSTO            (NOLOCK)			  ON (PSECAO.NROCENCUSTOCONT = GCCUSTO.CODCCUSTO AND PSECAO.CODCOLIGADA = GCCUSTO.CODCOLIGADA)
        LEFT JOIN PPESSOA            (NOLOCK)				  ON (PFUNC.CODPESSOA = PPESSOA.CODIGO)
        LEFT JOIN GUSUARIO            (NOLOCK)			  ON (PFUNC.NOME = GUSUARIO.NOME)
        LEFT JOIN PCODINSTRUCAO        (NOLOCK)    ON (PPESSOA.GRAUINSTRUCAO = PCODINSTRUCAO.CODINTERNO)
        --INNER JOIN AHORARIO            (NOLOCK)    ON (AHORARIO.CODCOLIGADA = PFUNC.CODCOLIGADA AND AHORARIO.CODIGO = PFUNC.CODCOLIGADA)
        --LEFT JOIN GUSRPERFIL        (NOLOCK)    ON (GUSRPERFIL.CODUSUARIO = GUSUARIO.CODUSUARIO)
            WHERE  PFUNC.CODSITUACAO <> 'D' and
                    --GUSUARIO.CODUSUARIO LIKE 'flavio%'  /* usu�rio RM */
                    PFUNC.NOME like '%Abel%rodrigues%'  /* procurar por nome */
                    --PFUNCAO.NOME like '%contas%receber%' /* FUN��O */
                    --GCCUSTO.NOME LIKE '%compras%' /*DEPARTAMENTO */


ORDER BY PFUNC.NOME
