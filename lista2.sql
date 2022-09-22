/*
1. Para que serve o projeto (ou modelagem) de banco de dados?

modelar é um sinonimo de projetar, seja um identidade visual(desing).*/

/* 2. Quais são as três etapas da modelagem de banco de dados?

AS tres etapas sao, modelagem logica , modellagem conceitual e modelagem fisica.*/

/* 3. Cite três problemas de uma modelagem de dados inadequada e como podemos evitá-los. 
 os tres prolbemas sao:
redundancia: dados que se repetem em campo  da mesma tabela .
como evitar:È preciso avaliar cada cenario, e este casi a subtituicao por uma unica tabeka é indicada pois ambas tem os  mesmo campos/*

inconsdidtencia:

integridade franca: 
/*

/* 4. É possível afirmar que o SQL é uma linguagem de programação? Justifique.

Nao , sql nao é uma linguagem de programacao  pela  estrutura de comandos, sql nao tem controle de fluxo, lacos de repeticoes, declaracaod e variaveis*/

/*5. Procure a diferença entre o comando DELETE FROM (sem WHERE) e TRUNCATE TABLE, e
escreva com as suas próprias palavras.

a diferenca entre esses dois comando é que DELETE é usadopara excluir linhas de uma tabela, mas nao libereo espaco ocupado por essas linha. E o comando  TRUNCATE é usado para excluir as linha de uma tab3ela e liberar o espaco ocupado por essas linhas/*


/* 7. Insira três registros na tabela employees utilizando um insert múltiplo. Lembre-se de utilizar o
comando DESC nome_tabela para verificar a estrutura da tabela. Você deve respeitar os tipos de
dados de cada coluna.*/

INSERT INTO employees(
    employee_id,
    first_name,
    last_name,
    email,
    phone_number,
    hire_date,
    job_id,
    salary,
    commission_pct,
    manager_id,
    department_id
)
values (
    10,
    'bruna',
    'russi',
    'bruna.russi@ifsc.edu.br',
    '13513513',
    CURDATE(),
    'AC_ACCOUNT',
    2000,
    null,
    null,
    90
),(
    12,
    'eliezer',
    'Silva',
    'eliezer.s@gmail.com',
    '956845484',
    CURDATE(),
    'AC_ACCOUNT',
    2000,
    null,
    null,
    100
),(
    13,
    'joao',
    'miguelito',
    'migulito.msms',
    '45451441',
    CURDATE(),
    'AC_ACCOUNT',
    2000,
    null,
    null,
    110
)

/* 8. Faça um insert múltiplo de cinco países na tabela countries. Lembre-se de utilizar o comando
DESC nome_tabela para verificar a estrutura da tabela. Você deve respeitar os tipos de dados de
cada coluna.
*/
Insert into countries(
    country_id,
    country_name,
    region_id
)
values('sc','santa catharina',2),
('mg',' magé',1   ),
('vd',' videira',2 ),
('fd','fundo da grota',1 ),
(' gv',' grande volta',2 );

/* 9. Faça a exclusão de um país que você inseriu na tabela countries. Não esqueça de utilizar o termo
WHERE, pois senão você removerá todos os registros.*/

DELETE FROM coutries WHERE country_id like 'mg';

/*
10. Atualize dois registros que você inseriu na tabela employees. Você deve utilizar o filtro (WHERE)
por ID.*/

UPDATE employees
SET first_name ='el',last_name= 'mi' WHERE employee_id = 15


/* 11. Escreva o comando para consultar todos os registros inseridos por você na tabela employees. Dica:
você terá que filtrar por ID.*/

select * from employees WHERE employees_id in(10,12,13)
