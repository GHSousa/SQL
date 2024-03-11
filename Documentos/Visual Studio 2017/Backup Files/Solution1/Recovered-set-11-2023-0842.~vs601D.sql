SELECT 

EMPREENDIMENTO.NOM_EMPREENDIMENTO,
OBRA.RM_NOME,
UPPER( EMPREITEIRO.NOM_EMPREITEIRO) AS NOM_EMPREITEIRO,
(CASE WHEN CONTRATO.NUM_ADITAMENTO IS NULL THEN 'CONTRATO' ELSE 'ADITAMENTO' END) AS 'TIPO CONTRATO',
CONTRATO.ID_CONTRATO,
CONTRATO.ID_CONTRATO_ORIGINAL,
CONTRATO.COD_CONTRATO,
CONTRATO.NUM_ADITAMENTO,
CONTRATO.OBSERVACOES,

convert(VARCHAR,(SELECT MIN(M.DAT_INICIO) FROM MEDICAO AS M 
INNER JOIN CONTRATO AS C (NOLOCK) ON (C.ID_CONTRATO = M.ID_CONTRATO)
INNER JOIN OBRA AS O (NOLOCK) ON (O.ID_OBRA = M.ID_OBRA)
WHERE M.EXCLUIDO= 0 AND C.COD_CONTRATO = CONTRATO.COD_CONTRATO AND C.ID_EMPREITEIRO = CONTRATO.ID_EMPREITEIRO AND O.ID_EMPREENDIMENTO = EMPREENDIMENTO.ID_EMPREENDIMENTO),103) AS DATA_INICIO_PRIMEIRA_MEDICAO,

convert(VARCHAR,(SELECT MIN(M.DAT_FIM) FROM MEDICAO AS M 
INNER JOIN CONTRATO AS C (NOLOCK) ON (C.ID_CONTRATO = M.ID_CONTRATO)
INNER JOIN OBRA AS O (NOLOCK) ON (O.ID_OBRA = M.ID_OBRA)
WHERE M.EXCLUIDO= 0 AND C.COD_CONTRATO = CONTRATO.COD_CONTRATO AND C.ID_EMPREITEIRO = CONTRATO.ID_EMPREITEIRO AND O.ID_EMPREENDIMENTO = EMPREENDIMENTO.ID_EMPREENDIMENTO),103) AS DATA_FIN_PRIMEIRA_MEDICAO,


convert(VARCHAR,(SELECT MAX(M.DAT_CRIACAO) FROM MEDICAO AS M 
INNER JOIN CONTRATO AS C (NOLOCK) ON (C.ID_CONTRATO = M.ID_CONTRATO)
INNER JOIN OBRA AS O (NOLOCK) ON (O.ID_OBRA = M.ID_OBRA)
WHERE M.EXCLUIDO= 0 AND C.COD_CONTRATO = CONTRATO.COD_CONTRATO AND C.ID_EMPREITEIRO = CONTRATO.ID_EMPREITEIRO AND O.ID_EMPREENDIMENTO = EMPREENDIMENTO.ID_EMPREENDIMENTO),103) AS ULTIMA_MEDICAO,

CONVERT (VARCHAR,CONTRATO.DAT_INICIO_CONTRATO,103) AS DAT_INICIO_CONTRATO,
CONVERT (VARCHAR,CONTRATO.DAT_FIM_CONTRATO,103) AS DAT_FIM_CONTRATO,
CONTRATO.NUM_MESES,
CONVERT (VARCHAR,CONTRATO.DAT_QUITACAO,103) AS DAT_QUITACAO,
CONVERT (VARCHAR,CONTRATO.DAT_CADASTRO,103) AS DAT_CADASTRO,
CONVERT (VARCHAR,CONTRATO.DATA_PRIMEIRA_INTEGRACAO,103) AS DATA_PRIMEIRA_INTEGRACAO,


(SELECT CONVERT(VARCHAR,MAX (DAT_HISTORICO),103) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = 3) AS APROV_ENG,
(SELECT MAX (OBSERVACOES) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = '3') AS OBS,

(SELECT CONVERT(VARCHAR,MAX (DAT_HISTORICO),103) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = 4) AS APROV_CONTROLE,
(SELECT MAX (OBSERVACOES) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = '4') AS OBS1,

(SELECT CONVERT(VARCHAR,MAX (DAT_HISTORICO),103) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = 5) AS APROV_SECRETARIA,
(SELECT MAX (OBSERVACOES) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = '5') AS OBS2,

(SELECT CONVERT(VARCHAR,MAX (DAT_HISTORICO),103) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = 7) AS ASS_DIRETORIA1,
(SELECT MAX (OBSERVACOES) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = '7') AS OBS3,

(SELECT CONVERT(VARCHAR,MAX (DAT_HISTORICO),103) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = 8) AS ASS_DIRETORIA2,
(SELECT MAX (OBSERVACOES) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = '8') AS OBS4,

(SELECT CONVERT(VARCHAR,MAX (DAT_HISTORICO),103) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = 9) AS ENVIO_OBRA,
(SELECT MAX (OBSERVACOES) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = '9') AS OBS5,

(SELECT CONVERT(VARCHAR,MAX (DAT_HISTORICO),103) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = 10) AS RETORNO_OBRA,
(SELECT MAX (OBSERVACOES) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA = '10') AS OBS6,


CORPORE_RESIDENCIAL.DBO.DIAS_UTEIS (CONTRATO.DATA_PRIMEIRA_INTEGRACAO,(SELECT MAX (CONVERT (DATETIME,LEFT (DAT_HISTORICO,11))) FROM CONTRATO_HISTORICO WHERE ID_CONTRATO = CONTRATO.ID_CONTRATO AND ID_ETAPA =8)) AS 'DATA DA PRIMEIRA INTEGRAÇÃO X ULTIMA DATA DE ASS. DIRETORIA 2',

ETAPA.NOM_ETAPA,

(SELECT TOP 1 ETAPA_HISTORICO.NOM_ETAPA FROM CONTRATO_HISTORICO (NOLOCK)
INNER JOIN ETAPA AS ETAPA_HISTORICO (NOLOCK) ON (ETAPA_HISTORICO.ID_ETAPA = CONTRATO_HISTORICO.ID_ETAPA)
WHERE CONTRATO_HISTORICO.ID_CONTRATO = CONTRATO.ID_CONTRATO  ORDER BY CONTRATO_HISTORICO.DAT_HISTORICO DESC) AS ULTIMA_ETAPA_HISTORICO,


OBJETO_CONTRATO.ID_OBJETO_CONTRATO,

OBJETO_CONTRATO.NOM_OBJETO_CONTRATO




FROM CONTRATO (NOLOCK)

INNER JOIN OBRA				(NOLOCK) ON (OBRA.ID_OBRA = CONTRATO.ID_OBRA)
INNER JOIN EMPREENDIMENTO	(NOLOCK) ON (EMPREENDIMENTO.ID_EMPREENDIMENTO = OBRA.ID_EMPREENDIMENTO)
INNER JOIN EMPREITEIRO		(NOLOCK) ON (EMPREITEIRO.ID_EMPREITEIRO = CONTRATO.ID_EMPREITEIRO)	
INNER JOIN ETAPA			(NOLOCK) ON (ETAPA.ID_ETAPA = CONTRATO.ID_ETAPA)
INNER JOIN OBJETO_CONTRATO  (NOLOCK) ON (OBJETO_CONTRATO.ID_OBJETO_CONTRATO = CONTRATO.ID_OBJETO_CONTRATO)

WHERE	CONTRATO.EXCLUIDO = '0'
AND		(CONTRATO.FLAG_GLOBAL = '0' OR OBRA.FLG_OBRA_BASE = '1')

AND		CONTRATO.DAT_CRIACAO BETWEEN '2020-01-01' AND '2023-09-06'
AND		OBRA.ID_OBRA IN ('%IPIRANGA%')