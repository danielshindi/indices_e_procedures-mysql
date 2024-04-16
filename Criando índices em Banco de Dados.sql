/* Parte 1 – Criando índices em Banco de Dados */ 

use company_constraints;

select * from department;
select * from employee;
select * from dept_locations;

-- Departamento com maior número de pessoas
select e.Dno as "Número do departamento", d.Dname as "Departamento", count(e.Dno) as frequencia from employee e, department d
where e.Dno = d.Dnumber
group by Dno
order by frequencia desc limit 1;

-- Criação do índice para o número do departamento, para agilizar a busca pelo departamento com maior número de pessoas
create index index_departament on employee(Dno);


-- Departamentos por cidade
select dl.Dlocation, d.Dname from department d, dept_locations dl
where d.Dnumber = dl.Dnumber
order by dl.Dlocation;

-- Criação dos índices para o número do departamento nas tabelas department e dept_locations, para agilizar a querry acima, já que estamos comparando esses parâmetros
create index index_department_Dnumber on department(Dnumber);
-- usando ALTER TABLE
alter table dept_locations add index index_dept_locations_Dnumber(Dnumber);
show index from department;
show index from dept_locations;


-- Relação de empregados por departamento
select Dno, Dname, concat(Fname, ' ', Minit, ' ', Lname) as Name, Ssn from employee, department
where Dno = Dnumber
order by Dno;

-- Os índices necessários já foram criados, para Dno e Dnumber.