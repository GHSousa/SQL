select CONSULTA_JOB.CODCOLIGADA,STSJOB,CONSULTA_JOB.IDJOB,DATA_FINAL_EXEC,STATUS,DATAPROGRAMADA,PROCESSO,CONSULTA_JOB.NOME,DATAFECHAMENTOESTOQUE,LIMNEGSALDO2,MENSAGEMSTATUS
FROM [dbo].[CONSULTA_JOB]()
LEFT JOIN GJOBX ON GJOBX.IDJOB = CONSULTA_JOB.IDJOB
where gjobx.idjob = 3682702
AND gjobx.codcoligada IS NOT NULL
order by 1,3