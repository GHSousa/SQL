USE DBCONTROLEMP
SELECT * 
FROM qualidade.FICHA_VERIFICACAO_USUARIO
--JOIN QUALIDADE.FICHA_VERIFICACAO
WHERE dbo.TRAZ_USERNAME(UserId) like '%graciane.oliveira%'
