SELECT * FROM OBRA WHERE ID_EMPREENDIMENTO = '152' AND ID_OBRA IN ('207'/*RESIDENCIAL BOTANIC - OBRAS */, '208'/*RESIDENCIAL ARBOR ATLANTICA - OBRAS */) 

SELECT * FROM [dbo].[FICHA_PREENCHIDA_bak]
WHERE ID_EMPREITEIRO = '3356'
AND ID_FICHA_PREENCHIDA = '622037'


SELECT * FROM [dbo].[EMPREITEIRO] WHERE NOM_EMPREITEIRO LIKE '%JAVA GAS%'AND ID_EMPREITEIRO = '3356'

SELECT * FROM
[RMO].[ENVIO_REQUISICAO_DETALHE_HISTORICO] 
WHERE RM_CODIGOPRD = 'MHID.002.011.0137'

SELECT ID_REQUISICAO, ID_EMPREITEIRO, DATA_REQUISICAO, DATA_NECESSIDADE, ID_USUARIO_REQUISITANTE, [RMO].[SITUACAO_RMO].ID_SITUACAO_RMO, NOM_SITUACAO_RMO, ID_OBRA,*
FROM [RMO].[REQUISICAO] 
LEFT JOIN [RMO].[SITUACAO_RMO] ON [RMO].[SITUACAO_RMO].ID_SITUACAO_RMO = [RMO].[REQUISICAO].ID_SITUACAO_RMO
WHERE ID_OBRA IN ('207', '208') AND ID_EMPREITEIRO = '3356'


select * from rmo.REQUISICAO_MATERIAL where ID_REQUISICAO = 642008
select * from rmo.REQUISICAO_MATERIAL where ID_REQUISICAO = 622037


update rmo.REQUISICAO_MATERIAL set DESCONTADO = 0 where ID_REQUISICAO = 622037


select  * from rmo.REQUISICAO where ID_REQUISICAO =642008
select  * from rmo.REQUISICAO where ID_REQUISICAO =622037



select * from medicao where id_medicao = 73267


select * from CORPORE_RESIDENCIAL..tprd where idprd = 102636 and codcoligada = 26

select * from CLASSE where ID_CLASSE = 43

select * from rmo.MATERIAIS_A_DESCONTAR where id_obra = 208 and rm_codigoprd = 'MHID.002.011.0137'