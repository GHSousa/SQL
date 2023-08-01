SELECT DISTINCT
TUSRTMV.CODCOLIGADA, 
TUSRTMV.CODUSUARIO, 
TUSRTMV.CODTMV
FROM GUSRPERFIL 
LEFT JOIN TUSRTMV ON (TUSRTMV.CODUSUARIO = GUSRPERFIL.CODUSUARIO AND GUSRPERFIL.CODCOLIGADA = TUSRTMV.CODCOLIGADA)
LEFT JOIN GUSUARIO ON (GUSRPERFIL.CODUSUARIO= GUSUARIO.CODUSUARIO)
WHERE CODSISTEMA = 'T'
AND TUSRTMV.CODCOLIGADA = '1'
AND GUSUARIO.NOME LIKE '%ESTELA%SANTOS%'    
--AND TUSRTMV.CODUSUARIO '%ESTELA%SANTOS%'   
-- IN (SELECT NOME FROM PFUNC WHERE CODSECAO NOT IN ('01.500.20','01.500.21','01.500.91') AND CODSITUACAO <> 'D')  
