-- EXERCICIOS FIGURA 2 
use world;
select * from pais;
select * from lingua_pais;
-- FIGURA 2 A) mostre os nomes dos paises e seus continentes  
select Name, continent from pais;

-- FIGURA 2 B) mostre os nomes dos paises, regiao e a populaçao dos paizes do continente "Europe"
select Name, Region, Population from pais 
where continent = "Europe";

-- FIGURA 2 C) mostre a expectativa de vida das pessoas do continente "Asia".
select LifeExpectancy, localname from pais
where continent = "Asia";

-- FIGURA 2 D) crie uma view que mostre os nomes dos paises, seus presidentes(HeadOFState). tipos de governo(GovernmentForm) e a populacao dos paises do continente ("South America" e com populacao maior que 2000000
create view vw_InfoAmerica as 
select Name, HeadOfState Presidente,GovernmentForm Tipo_Governo, Population Populacao from pais 
where continent = "South America" and
Population > 2000000;

-- FIGURA 2 E) crie uma view que mostre os nomes dos paisesm, tamanho da sau area (SurfaceArea), e seu idioma. exibir somente os paises com idioma "English" como oficial ordenar pelo tamanho do area (da menor para maior). mostre tambem como usar a view.
-- criando
create view vw_InfoPais as
select p.Name as Nome_pais , p.SurfaceArea As area_pais , lp.Language as lingua_falada from lingua_pais lp, pais p 
where p.Code = lp.CountryCode and
Language = "English"  and
IsOfficial = "T"
order by SurfaceArea asc;

-- usando 
select * from vw_InfoPais;
-- usando com restricoes 
select * from vw_InfoPais
where area_pais > 200;

-- para mostrar uma coluna, deve-se usar o nome dado a ela na criaçao da view 
select Nome_pais, lingua_falada, area_pais from vw_InfoPais;

select Nome_pais from vw_InfoPais;

-- FIGURA 2 F) altere a view do exercicio anterior para incluir a porcentagem de pessoas que falam o idioma English como oficial, mostre tbm como usar a view
alter view vw_InfoPais as
select p.Name as Nome_pais , p.SurfaceArea As area_pais , lp.Language as lingua_falada, lp.percentage as percentual_pessoas from lingua_pais lp, pais p 
where p.Code = lp.CountryCode and
Language = "English"  and
IsOfficial = "T"
order by SurfaceArea asc;

-- usando a view
select * from vw_InfoPais;

-- usando a view com restriçoes 
select * from vw_infoPais
where percentual_pessoas > 0;

-- para mostrar uma coluna deve-se usar o nome dado a ela na criacao da view 
select nome_pais, percentual_pessoas from vw_InfoPais
where percentual_pessoas > 0;
