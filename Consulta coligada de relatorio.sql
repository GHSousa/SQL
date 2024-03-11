SELECT  
	CODCOLIGADA
	,(CONVERT(VARCHAR,CODCOLIGADA) + ' - ' + NOMEFANTASIA) AS COLIGADA
	FROM GCOLIGADA
	WHERE (CODCOLIGADA = 1 OR CODCOLIGADA >=10)
	AND CODCOLIGADA NOT IN (54,61)

	ORDER BY CODCOLIGADA