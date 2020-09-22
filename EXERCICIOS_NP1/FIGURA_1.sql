
-- EXERCICIOS FIGURA 1

use exerc_fixacao ; 
select * from departamentos;
select *  from funcionarios;

-- FIGURA 1 A) mostre a media de salarios da folha de pagamento 
select avg(salario) as MediaSalarial_FolhaPagamento from funcionarios;

-- FIGURA 1 B) mostre os nomes, funcao dos funcionarios e o departamento que ele trabalha. agrupando pelo nome do departamento.
select f.primeiro_Nome , f.segundo_Nome , f.ultimo_Nome , f.funcao, d.nome as Departamento  from funcionarios f, departamentos d
where d.codigo_Depto = f.codigo_Depto 
group by d.nome;

-- FIGURA 1 C) mostre os nomes, o endereço, RG e  CPF dos funcionarios que trabalham no departamento de TI
select f.primeiro_Nome,f.segundo_Nome,f.ultimo_Nome, f.endereço,f.rg,f.cpf from funcionarios f, departamentos d
where d.codigo_Depto = f.codigo_Depto and
d.nome = "TI";

-- FIGURA 1 D) mostre o nome e os salarios dos funcionarios que nasceram entre 01/01/1980 a 31/12/1990.
select primeiro_Nome,segundo_Nome,ultimo_Nome, salario from funcionarios 
where data_Nasc >= "1980-01-01" and
data_Nasc <="1990-12-31";


