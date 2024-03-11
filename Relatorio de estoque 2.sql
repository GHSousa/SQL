SELECT DISTINCT 
T.IDPRD, 
T.CODIGOPRD, 
T.NOMEFANTASIA, 
SUM(ISNULL(T.ENTRADA,0)) AS ENTRADA, 
(SUM(ISNULL(T.SAIDA,0)) - SUM(ISNULL(T.ENTRADA2,0)))AS SAIDA, 
 T.CODUNDCONTROLE,
(SUM(ISNULL(T.ENTRADA,0)) -SUM(ISNULL(T.SAIDA,0)) )AS DIFERENCA


FROM

			(select 
				TPRD.IDPRD, 
				TPRD.CODIGOPRD, 
				TPRD.NOMEFANTASIA, 
				TMOV.CODTMV, 
					(CASE WHEN TITMMOV.CODUND = TPRD.CODUNDCONTROLE 
					 THEN  (CASE WHEN TITMMOV.QUANTIDADE = '0' THEN TITMMOV.QUANTIDADETOTAL ELSE TITMMOV.QUANTIDADE END)  
					 ELSE ( (CASE WHEN TITMMOV.QUANTIDADE = '0' THEN TITMMOV.QUANTIDADETOTAL ELSE TITMMOV.QUANTIDADE END)  
					 * 
						(SELECT ISNULL(FATORCONVERSAO,0) 
						FROM TUND (NOLOCK) 
						WHERE TUND.CODUND = TITMMOV.CODUND)
					) / 
						(SELECT ISNULL(FATORCONVERSAO,0) 
						FROM TUND (NOLOCK)  
						WHERE TUND.CODUND = TPRD.CODUNDCONTROLE)
					END) AS ENTRADA, 
				 0 AS SAIDA,
				TPRD.CODUNDCONTROLE,
					TMOV.CODLOC,
					0 AS ENTRADA2,
					TMOV.CODFILIAL

				FROM TITMMOV (NOLOCK)

				INNER JOIN TMOV (NOLOCK) ON TMOV.CODCOLIGADA = TITMMOV.CODCOLIGADA AND TMOV.IDMOV = TITMMOV.IDMOV
				INNER JOIN TPRD (NOLOCK) ON TPRD.CODCOLIGADA = TMOV.CODCOLIGADA AND TPRD.IDPRD = TITMMOV.IDPRD

				WHERE TMOV.CODCOLIGADA= '1'
 				AND (TITMMOV.QUANTIDADETOTAL<>0 OR TITMMOV.QUANTIDADE<>0) 
				AND TMOV.STATUS <> 'C' 
				AND TMOV.CODTMV IN ('2.2.05','1.1.40','1.1.41','4.1.01','4.1.04' ,'3.1.28')
				AND (
					CASE WHEN TMOV.CODTMV = '3.1.28' THEN TMOV.CODLOCDESTINO  
				   ELSE TMOV.CODLOC END) BETWEEN  '1' AND '9.9999' 
				AND (CASE WHEN TMOV.CODTMV = '3.1.28' THEN TMOV.CODFILIALDESTINO
					   ELSE TMOV.CODFILIAL END) ='1'
				AND TPRD.CODIGOPRD >='a' AND TPRD.CODIGOPRD <='z' 
				AND (CASE WHEN CAST(TMOV.DATACRIACAO AS DATE) IS NULL THEN CAST(TMOV.DATACRIACAO AS DATE) ELSE CAST(TMOV.DATACRIACAO AS DATE) END) >= '2023-01-01' 
				AND (CASE WHEN CAST(TMOV.DATACRIACAO AS DATE) IS NULL THEN CAST(TMOV.DATACRIACAO AS DATE) ELSE CAST(TMOV.DATACRIACAO AS DATE) END) <= '2023-05-01'

				UNION ALL

				SELECT 
				TPRD.IDPRD, 
				TPRD.CODIGOPRD, 
				TPRD.NOMEFANTASIA, 
				TMOV.CODTMV,
				0 AS ENTRADA, 
				(CASE WHEN TITMMOV.CODUND = TPRD.CODUNDCONTROLE 
				 THEN  (CASE WHEN TITMMOV.QUANTIDADE = '0' THEN TITMMOV.QUANTIDADETOTAL ELSE TITMMOV.QUANTIDADE END)  
				 ELSE ( (CASE WHEN TITMMOV.QUANTIDADE = '0' THEN TITMMOV.QUANTIDADETOTAL ELSE TITMMOV.QUANTIDADE END)  
				 * 
					(SELECT ISNULL(FATORCONVERSAO,0) 
					FROM TUND (NOLOCK) 
					WHERE TUND.CODUND = TITMMOV.CODUND)
				) / 
					(SELECT ISNULL(FATORCONVERSAO,0) 
					FROM TUND (NOLOCK) 
					WHERE TUND.CODUND = TPRD.CODUNDCONTROLE)
				 END) AS SAIDA,
				TPRD.CODUNDCONTROLE,
				TMOV.CODLOC,
				0 AS ENTRADA2,
				TMOV.CODFILIAL

				FROM TITMMOV (NOLOCK)

				INNER JOIN TMOV (NOLOCK) ON TMOV.CODCOLIGADA = TITMMOV.CODCOLIGADA AND TMOV.IDMOV = TITMMOV.IDMOV
				INNER JOIN TPRD (NOLOCK) ON TPRD.CODCOLIGADA = TMOV.CODCOLIGADA AND TPRD.IDPRD = TITMMOV.IDPRD

				WHERE TMOV.CODCOLIGADA= '1'
				AND TMOV.CODFILIAL ='1'
 				AND (TITMMOV.QUANTIDADETOTAL<>0 OR TITMMOV.QUANTIDADE<>0) 
				AND TMOV.STATUS <> 'C' 
				AND TMOV.CODTMV IN  ('1.1.03','1.1.27','1.1.33','3.1.28','3.1.36','3.1.39','2.1.01','4.1.06','4.1.05')
				AND TMOV.CODLOC >='1' 
				AND TMOV.CODLOC <='9.9999' 
				AND TPRD.CODIGOPRD >='a' 
				AND TPRD.CODIGOPRD <='z' 
				AND (CASE WHEN CAST(TMOV.DATACRIACAO AS DATE) IS NULL THEN CAST(TMOV.DATACRIACAO AS DATE) ELSE CAST(TMOV.DATACRIACAO AS DATE) END) >= '2023-01-01' 
				AND (CASE WHEN CAST(TMOV.DATACRIACAO AS DATE) IS NULL THEN CAST(TMOV.DATACRIACAO AS DATE) ELSE CAST(TMOV.DATACRIACAO AS DATE) END) <= '2023-05-01'

				UNION ALL

				SELECT 
				TPRD.IDPRD, 
				TPRD.CODIGOPRD, 
				TPRD.NOMEFANTASIA, 
				TMOV.CODTMV,
				0 AS ENTRADA, 
				0 AS SAIDA,
				TPRD.CODUNDCONTROLE,
				TMOV.CODLOC,
					(CASE WHEN TITMMOV.CODUND = TPRD.CODUNDCONTROLE 
					 THEN  (CASE WHEN TITMMOV.QUANTIDADE = '0' THEN TITMMOV.QUANTIDADETOTAL ELSE TITMMOV.QUANTIDADE END)  
					 ELSE ( (CASE WHEN TITMMOV.QUANTIDADE = '0' THEN TITMMOV.QUANTIDADETOTAL ELSE TITMMOV.QUANTIDADE END) 
					 *
						(SELECT FATORCONVERSAO 
						FROM TUND (NOLOCK) 
						WHERE TUND.CODUND = TITMMOV.CODUND)
					 ) / 
						(SELECT FATORCONVERSAO 
						FROM TUND (NOLOCK) 
						WHERE TUND.CODUND = TPRD.CODUNDCONTROLE)
					 END) AS ENTRADA2,
				TMOV.CODFILIAL

				FROM TITMMOV (NOLOCK)

				INNER JOIN TMOV (NOLOCK) ON TMOV.CODCOLIGADA = TITMMOV.CODCOLIGADA AND TMOV.IDMOV = TITMMOV.IDMOV
				INNER JOIN TPRD (NOLOCK) ON TPRD.CODCOLIGADA = TMOV.CODCOLIGADA AND TPRD.IDPRD = TITMMOV.IDPRD

				 WHERE TMOV.CODCOLIGADA= '1'
				 AND TMOV.CODFILIAL ='1'
				 AND (TITMMOV.QUANTIDADETOTAL<>0 OR TITMMOV.QUANTIDADE<>0) 
				 AND TMOV.STATUS <> 'C' 
				 AND TMOV.CODTMV IN 
					(select TTMV.CODTMV 
					from TTMV (NOLOCK)
					inner join TITMTMV (NOLOCK) on TTMV.CODTMV = TITMTMV.CODTMV AND TTMV.CODCOLIGADA = TITMTMV.CODCOLIGADA
					and TITMTMV.codtmv ='4.1.03')  
				 AND TMOV.CODLOC >='1' 
				 AND TMOV.CODLOC <='9.9999' 
				 AND TPRD.CODIGOPRD >='a' 
				 AND TPRD.CODIGOPRD <='z' 
				 AND (CASE WHEN CAST(TMOV.DATACRIACAO AS DATE) IS NULL THEN CAST(TMOV.DATACRIACAO AS DATE) ELSE CAST(TMOV.DATACRIACAO AS DATE) END) >= '2023-01-01' 
				 AND (CASE WHEN CAST(TMOV.DATACRIACAO AS DATE) IS NULL THEN CAST(TMOV.DATACRIACAO AS DATE) ELSE CAST(TMOV.DATACRIACAO AS DATE) END) <= '2023-05-01'
				) as T 


GROUP BY
T.IDPRD, T.CODIGOPRD, T.NOMEFANTASIA,
T.CODUNDCONTROLE
ORDER BY 
T.NOMEFANTASIA
  