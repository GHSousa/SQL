SELECT CODCOLIGADA, MAX(DATACRIACAO) AS DATACRIACAO
FROM TMOV
WHERE (CODCOLIGADA =1 OR CODCOLIGADA >=10)
GROUP BY CODCOLIGADA



select * from flan where codcoligada = 1