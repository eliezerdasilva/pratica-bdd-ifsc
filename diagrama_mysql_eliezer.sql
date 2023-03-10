drop database clinica;
create database clinica;
use clinica;


create table endereco (
    cep bigint  PRIMARY KEY,
    rua varchar(45) not null,
    bairro varchar(45) not null,
    estado varchar(45) not null
);
create table cliente(
    cpf bigint PRIMARY key,
    nome VARCHAR(100) NOT NULL,
    dataNascimento Datetime NOT NULL,
    email VARCHAR(45) NOT NULL,
    rg bigint NOT NULL,
    cep bigint not null,
    foreign key (cep) references endereco(cep)
);



create table fornecedor(
    cnpj bigint PRIMARY KEY,
    e_mail_empresa varchar(45) not null,
    endereco bigint not null,
    nome_funcionario varchar(100) not null,
    foreign key (endereco) references endereco(cep)
);

create table produto(
    id_produto float(8)  PRIMARY KEY ,
    cnpj bigint not null,
    foreign key (cnpj) references fornecedor(cnpj),
    peso_prod float not null,
    formato varchar(45) not null,
    dataCompra datetime not null
 
);

create table encomenda(
    id_encomenda float primary key,
    produto float(8) not null,
	cpf bigint not null,
    foreign key (produto) references produto(id_produto),
    foreign key (cpf) references cliente(cpf)
);

create table cliente_has_endereco(
    foreign key (cpf) references cliente(cpf),
    foreign key (cep) references endereco(cep),
	cep bigint not null,
    cpf bigint not null,
    n_casa int not null,
    complemento varchar (150) not null
);

create table fornecedor_has_endereco(
	n_empresa int not null,
    complemento varchar (150) not null,
	cnpj bigint not null,
    cep bigint not null,
    foreign key (cnpj) references fornecedor(cnpj),
    foreign key (cep) references endereco(cep)  
);

INSERT INTO endereco (cep, rua, bairro, estado)
VALUES 
(13131313,"rua lagoa", "comunidade do seu zé","venezuela"),
(45687895,"rua amazonas", "Desmatamento","cuba"),
(45642131,"rua jacarépalha", "Ilhotinha","china"),
(45646868,"rua laranjeiras ", "Jordania","argentina"),
(84641456,"rua laranjinha", "São jorge","chile"),
(89126232,"rua beco do nenem", "Bela Vista","suriname"),
(22222222,"rua Capitao do povo", "Democracia","guiana holandes"),
(56464645,"rua Comunidade São João da Capela", "comunidade do alemão","porto rico"),
(66666666,"rua Viver é alegria", "Alegria","lemen"),
(89228922,"rua Silvio santos", "Jequiti","haiti"),
(56469466,"rua Esperança amada", "Jequiti","Uruguai"),
(44864651,"rua Esperança abalada", "Santos","Uruguai"),
(98562374,"rua Esperança morta", "Manuel Machado","Uruguai"),
(16434357,"rua Esperança em deus", "Uniao","Uruguai"),
(54364684,"rua Esperança em ninguem", "Estados","Uruguai"),
(64854351,"rua Esperança valida", "Aliança","Uruguai"),
(52477568,"rua Esperança na sorte", "Brasil","Uruguai"),
(55783643,"rua Esperança na vida", "Jequiti","Sergipe"),
(57574836,"rua Esperança", "Uruguai","Paraguai"),
(58647888,"rua Esperança patriora", "Jequiti","Uruguai"),
(98562123,"rua Esperança vivida", "Manuel Machado","Rondonia"),
(16431231,"rua Esperança de Sao pedro", "Cordilhiera","Fortaleza"),
(54363211,"rua Esperança de passar de fase", "Londres","Belgica"),
(64312321,"rua Esperança de passar", "Berlim","pernambuco"),
(53123328,"rua Esperança de cidadania", "Reino unido","Bahia");

-- para fornecedor

-- inserts
INSERT INTO cliente (cpf, nome, dataNascimento,email, rg, cep)
VALUES 
(12345678996,'eliezer','2003-05-05' ,'eliezer.s',89574657,13131313),
(75315986244,"joao",'2015-02-24',"joao.msm",15975348,45687895),
(45678912365,"maria",'2002-11-01',"maria.gmail",35785215,45642131),
(12386427145,"bruna",'2001-09-11',"bruna.teacher",48621578,45646868),
(24896357415,"joana",'2022-11-30',"joana.ing",68421951,84641456),
(45878225982,"ana",'2003-12-15',"ana.hotmail",93716456,89126232),
(46791352845,"vitor",'2005-12-21',"vitor.ifsc",98236571,22222222),
(78945685443,"enzo",'2034-01-06',"enzo.kahoot",45695175,56464645),
(48643458435,"xandy",'1999-06-17',"xandy.ifsc",84593274,66666666),
(56454354354,"antonio",'2014-07-01',"antonio.dg",56239874,89228922),


(56454355354,"Carlos",'2017-11-24',"Carlos.dg",16161512,13131313),
(56453466354,"Amorim",'2015-12-15',"Amorim.dg",84848488,89228922),
(54652464354,"Pedro",'2017-05-01',"Pedro.dg",84848587,16434357),
(53210315354,"Lindomar",'1998-05-21',"Lindomar.dg",94994955,45642131),
(53253453354,"Liamar",'2005-07-11',"Liamar.dg",48648445,45642131);






INSERT INTO fornecedor (cnpj, e_mail_empresa,endereco, nome_funcionario )
VALUES 
(13131313,"AmomeuEmprego.@empregaBrasil",45642131,"Irineu"),
(22222222,"AmoDesing.@DesingBrasil",56469466,"Tonho"),
(13165468,"AdorodarAula.@AulaBrasil",22222222,"Liamar"),
(26598485,"Bminhavida.@BBBrasil",56464645,"Rafaela"),
(13548458,"favelaVenceu.@BBBrasil",55783643,"Camila de Lucas"),
(54658436,"humorNegro.@BBBrasil",57574836,"Nego di"),
(58438545,"omelhordeTodos.@favelaBrasil",89228922,"Poze"),
(36435845,"ReiDoPop.@ReiBrasil",89126232,"Kevin"),
(56766894,"adivogadaKevin.@empregaBrasil",44864651,"Deolane"),
(21561454,"vivaNordeste.@cactos",66666666,"Julieta"),

(21232454,"vivaSul.@cactos",66666666,"Julieta"),
(22432454,"tchegarotos",84641456,"Zé"),
(24232454,"AliançapeloBR.@Br",56464645,"Romeu"),
(64543454,"Marcos@Brasil",55783643,"Marcos"),
(21624454,"Brina.rss@MyTeacher.com",45642131,"Bruna");


INSERT INTO produto (id_produto, cnpj, peso_prod, formato, dataCompra)
VALUES (231321, 13131313, 24, "quadrado", '2006-12-06'),
(545482, 13131313, 24, "quadrado", '2015-06-25'),
(646566, 22222222, 3, "quadrado", '2016-12-02'),
(284452, 13165468, 4, "quadrado", '2022-12-13'),
(848455, 26598485, 5, "quadrado", '2022-12-14'),
(486854, 13548458, 19, "quadrado", '2022-12-14'),
(535321, 54658436, 5, "retangulo", '2022-12-15'),
(554582, 58438545, 20, "retangulo", '2022-09-16'),
(299543, 36435845, 18, "retangulo", '2022-10-25'),
(953498, 56766894, 09, "retangulo", '2022-07-25'),
(564545, 21561454, 6, "retangulo", '2005-02-06'),


(865625, 26598485, 5, "quadrado", '2022-12-14'),
(413554, 13548458, 19, "quadrado", '2022-12-14'),
(564561, 54658436, 5, "oval", '2022-12-15'),
(556562, 58438545, 20, "10/50/41 caixa", '2022-09-16'),
(646543, 36435845, 18, "50/10/42 caixa", '2022-10-25');

INSERT INTO encomenda (id_encomenda,produto, cpf)
VALUES
(5153135,231321,12345678996),
(4566465,545482,75315986244),
(4545454,646566,45678912365),
(5654654,284452,12386427145),
(5798998,848455,24896357415),
(6489945,486854,45878225982),
(6483643,535321,46791352845),
(6846465,554582,78945685443),
(6466468,299543,48643458435),
(6435445,564545,56454354354);


INSERT INTO cliente_has_endereco (cpf, cep, n_casa,complemento)
VALUES

(12345678996, 13131313, 656,"casa"),
(75315986244, 45687895, 52,"Apartamento"),
(45678912365, 45642131, 46," no lado do ifsc"),
(12386427145, 45646868, 54, "no lado da igreja"),
(24896357415, 84641456, 455, "casa de madeira"),
(45878225982, 89126232, 44, " casa de material"),
(46791352845, 22222222, 46, "casa azul"),
(78945685443, 56464645, 6554," casa bordo"),
(48643458435, 66666666, 646," esquina nos fundo"),
(56454354354, 89228922, 646, "esquina esquerda");

INSERT INTO fornecedor_has_endereco(n_empresa,complemento,cnpj,cep)
VALUES
(6561, "Deixar na caixa ", 13165468,57574836);




-- update
-- cliente
UPDATE cliente SET nome = 'bruna' WHERE cpf = 12345678996;
UPDATE cliente SET nome = 'Zé vaqueiro' WHERE cpf = 12345678996;
UPDATE cliente SET nome = 'Gabriel' WHERE cpf = 12345678996;
UPDATE cliente SET nome = 'Valmor' WHERE cpf = 12345678996;
UPDATE cliente SET nome = 'Deodoro' WHERE cpf = 12345678996;


-- endereco
UPDATE endereco SET rua = "sao joao"  WHERE cep = 45642131;
UPDATE endereco SET rua = "sao pedro"  WHERE cep = 45687895;
UPDATE endereco SET rua = "sao luis"  WHERE cep = 54364684;
UPDATE endereco SET rua = "sao jorge"  WHERE cep = 58647888;
UPDATE endereco SET rua = "sao mateus"  WHERE cep = 66666666;

-- produto


UPDATE produto  SET formato = "quadrado" WHERE cnpj = 13165468;
UPDATE produto  SET formato = "quadrado" WHERE cnpj = 36435845;
UPDATE produto  SET formato = "quadrado" WHERE cnpj = 58438545;
UPDATE produto  SET formato = "quadrado" WHERE cnpj = 13131313;
UPDATE produto  SET formato = "quadrado" WHERE cnpj = 22222222;

-- encomenda


UPDATE encomenda   SET id_encomenda = 7531541 WHERE cpf = 75315986244;
UPDATE encomenda  SET id_encomenda =  8458484 WHERE cpf = 12345678996;
UPDATE encomenda  SET id_encomenda =  4684684 WHERE cpf = 45678912365;
UPDATE encomenda  SET id_encomenda =  1354385 WHERE cpf = 12386427145;
UPDATE encomenda  SET id_encomenda =  5453435 WHERE cpf = 45878225982;

-- cliente endereco

UPDATE cliente_has_endereco  SET n_casa = 515 WHERE cep = 45687895;
UPDATE cliente_has_endereco  SET n_casa = 464 WHERE cep = 66666666;
UPDATE cliente_has_endereco  SET n_casa = 6456 WHERE cep = 56469466;
UPDATE cliente_has_endereco  SET n_casa = 6446 WHERE cep = 45642131;
UPDATE cliente_has_endereco  SET n_casa = 664 WHERE cep = 52477568;


-- delete cliente

DELETE FROM cliente WHERE cpf= 56454355354;
DELETE FROM cliente WHERE cpf = 53210315354;
DELETE FROM cliente WHERE cpf = 56453466354;
DELETE FROM cliente WHERE cpf = 54652464354;
DELETE FROM cliente WHERE cpf = 53253453354;

-- delete endereco 




DELETE FROM endereco WHERE cep = 98562123;
DELETE FROM endereco WHERE cep = 98562374;
DELETE FROM endereco WHERE cep = 53123328;
DELETE FROM endereco WHERE cep = 54363211;
DELETE FROM endereco WHERE cep = 54364684;


-- delete produto



DELETE FROM produto WHERE id_produto =953498;
DELETE FROM produto WHERE id_produto =865625;
DELETE FROM produto WHERE id_produto =413554;
DELETE FROM produto WHERE id_produto =556562;
DELETE FROM produto WHERE id_produto =646543;

-- delete fornecedor 

DELETE FROM fornecedor WHERE cnpj = 13151313;
DELETE FROM fornecedor WHERE cnpj = 21232454;
DELETE FROM fornecedor WHERE cnpj = 22432454;
DELETE FROM fornecedor WHERE cnpj = 24232454;
DELETE FROM fornecedor WHERE cnpj = 21624454;

-- encomenda

DELETE FROM encomenda WHERE id_encomenda = 5153135;
DELETE FROM encomenda WHERE id_encomenda = 4566465;
DELETE FROM encomenda WHERE id_encomenda = 4545454;
DELETE FROM encomenda WHERE id_encomenda = 5654654;
DELETE FROM encomenda WHERE id_encomenda = 5798998;



-- selects


SELECT endereco.cep, cliente.cep
FROM endereco
INNER JOIN cliente
ON
endereco.cep = cliente.cep;

SELECT cliente_has_endereco.cep, cliente.cep
FROM cliente_has_endereco 
INNER JOIN cliente
ON
cliente_has_endereco .cep = cliente.cep;

SELECT fornecedor_has_endereco.cep, endereco.cep
FROM fornecedor_has_endereco 
INNER JOIN endereco
ON
fornecedor_has_endereco.cep = endereco.cep;

SELECT encomenda.cpf, cliente.cpf
FROM encomenda
INNER JOIN cliente
ON
encomenda.cpf = cliente.cpf;


SELECT produto.id_produto, encomenda.produto
FROM produto
INNER JOIN encomenda
ON
produto.id_produto = encomenda.produto;


