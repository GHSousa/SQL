USE CORPORE_RESIDENCIAL
SELECT DISTINCT
PFUNC.NOME							AS 'USUARIO_NOME',
PFUNC.CODSITUACAO					AS 'SITUA��O',
TUSRTMV.CODUSUARIO					AS 'USUARIO', 
PFUNCAO.NOME						AS 'FUNCAO',
GCCUSTO.NOME						AS 'DEPARTAMENTO/LOCAL DE ACESSO',
GUSRPERFIL.CODSISTEMA				AS 'SISTEMA',
GUSRPERFIL.CODPERFIL				AS 'PERFIL',
TUSRTMV.CODCOLIGADA					AS 'COLIGADA'
--TUSRTMV.CODTMV

FROM GUSRPERFIL						(NOLOCK)
LEFT JOIN TUSRTMV					(NOLOCK)			ON			(TUSRTMV.CODUSUARIO = GUSRPERFIL.CODUSUARIO AND GUSRPERFIL.CODCOLIGADA = TUSRTMV.CODCOLIGADA)
LEFT JOIN GUSUARIO					(NOLOCK)			ON			(GUSRPERFIL.CODUSUARIO= GUSUARIO.CODUSUARIO)
LEFT JOIN PFUNC						(NOLOCK)			ON			(PFUNC.NOME = GUSUARIO.NOME) 
LEFT JOIN PFUNCAO					(NOLOCK)			ON			(PFUNC.CODFUNCAO = PFUNCAO.CODIGO AND PFUNC.CODCOLIGADA = PFUNCAO.CODCOLIGADA)
LEFT JOIN PSECAO			        (NOLOCK)			ON			(PFUNC.CODSECAO = PSECAO.CODIGO AND PFUNC.CODCOLIGADA = PSECAO.CODCOLIGADA)
LEFT JOIN GCCUSTO				    (NOLOCK)			ON			(PSECAO.NROCENCUSTOCONT = GCCUSTO.CODCCUSTO AND PSECAO.CODCOLIGADA = GCCUSTO.CODCOLIGADA)
LEFT JOIN GSISTEMA					(NOLOCK)			ON			(GSISTEMA.CODSISTEMA = GUSRPERFIL.CODSISTEMA)

WHERE GUSUARIO.NOME LIKE '%debora%brito%' 
 and GUSRPERFIL.CODSISTEMA = 'T'
AND PFUNC.CODSITUACAO =  'A'
--AND TUSRTMV.CODCOLIGADA = '1'
--GUSUARIO.NOME LIKE '%Eduardo%Lacerda%Ribeiro%'    
--AND PFUNCAO.NOME LIKE '%seguranca%'
--AND TUSRTMV.CODUSUARIO '%ALINE%'   
--AND GCCUSTO.NOME LIKE '%OSASCO%'

ORDER BY PFUNC.NOME DESC