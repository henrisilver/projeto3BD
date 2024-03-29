SELECT ATLET, SOMA FROM
(SELECT TABELA.ATL AS ATLET, SUM(NUM_EVEN) AS SOMA FROM (SELECT ATLETA as ATL, COUNT(EVENTO) AS NUM_EVEN from COMPETE C
GROUP BY C.ATLETA
UNION
SELECT A.RG AS ATL, COUNT(E.NOME) AS NUM_EVEN FROM ((ATLETA A JOIN EQUIPE E ON A.EQUIPE = E.NOME) JOIN REPRESENTA R ON R.EQUIPE = E.NOME)
GROUP BY A.RG) TABELA
GROUP BY TABELA.ATL)
WHERE SOMA >2
ORDER BY SOMA;