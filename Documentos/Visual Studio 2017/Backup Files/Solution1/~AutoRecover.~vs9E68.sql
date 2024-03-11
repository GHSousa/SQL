
select flanintegracao.IDCAMPO, flanintegracaodef.DESCRICAO, * from flanintegracao

left join flanintegracaodef (nolock) on flanintegracaodef.idcampo=flanintegracao.IDCAMPO		and flanintegracaodef.CODCOLIGADA=flanintegracao.CODCOLIGADA

where idlan= '1543' and flanintegracao.codcoligada= 31 