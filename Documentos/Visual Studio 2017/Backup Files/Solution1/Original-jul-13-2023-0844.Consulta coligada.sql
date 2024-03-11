SELECT DISTINCT
EMPREENDIMENTO.RM_CODCOLIGADA				AS CODIGO_DA_COLIGADA,
EMPREENDIMENTO.NOM_EMPREENDIMENTO			AS NOME_DO_EMPREENDIMENTO,
RM_CODFILIAL								AS FILIAL,
EMPREENDIMENTO.ID_EMPREENDIMENTO			AS ID_DO_EMPREENDIMENTO,
OBRA.RM_NOME,
EMPREENDIMENTO.NOME_ABREVIADO,
OBRA.ID_OBRA,
OBRA.ESTADO,
OBRA.CIDADE,
OBRA.BAIRRO
--ETAPA.NOM_ETAPA

FROM EMPREENDIMENTO

JOIN OBRA									ON EMPREENDIMENTO.RM_CODCOLIGADA = OBRA.RM_CODCOLIGADA AND EMPREENDIMENTO.ID_EMPREENDIMENTO = OBRA.ID_EMPREENDIMENTO
JOIN CONTRATO								ON OBRA.ID_OBRA =  CONTRATO.ID_OBRA
--JOIN ETAPA ON ETAPA.ID_ETAPA = CONTRATO.ID_ETAPA


WHERE OBRA.RM_NOME LIKE '%veneto%'
ORDER BY 1, 3