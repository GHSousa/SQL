select  CODCOLIGADA,STSJOB,IDJOB,DATA_FINAL_EXEC,STATUS,DATAPROGRAMADA,PROCESSO,NOME,DATAFECHAMENTOESTOQUE,LIMNEGSALDO2,MENSAGEMSTATUS
FROM [dbo].[CONSULTA_JOB]()
where nome like '%saldos%custos%' 
AND codcoligada IS NOT NULL
order by 1,3
