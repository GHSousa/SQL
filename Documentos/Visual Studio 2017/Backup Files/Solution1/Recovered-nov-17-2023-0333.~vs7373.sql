--CONSULTA COLIGADA COM MOVIMENTAÇÃO
SELECT 
CODCOLIGADA, 
MAX(DATACRIACAO) AS DATACRIACAO
FROM TMOV
WHERE (CODCOLIGADA =1 OR CODCOLIGADA >=10)
GROUP BY CODCOLIGADA