drop database clinica;
create database clinica;
use clinica;


create table cliente(
    cpf float(8)AUTO_INCREMENT PRIMARY key not null,
    nome VARCHAR(100) NOT NULL,
    dataNascimento Date NOT NULL,
    email VARCHAR(45) NOT NULL,
    rg VARCHAR(10) NOT NULL,
    cep float(8) not null,
    foreign key (cep) references endereco(cep)
);

create table endereco (
    cep float(8) auto_increment NOT NULL PRIMARY KEY ,
    rua varchar(45) not null,
    bairro varchar(45) not null,
    estado varchar(45) not null
);

create table fornecedor(
    cnpj float(8) NOT NULL NULL PRIMARY KEY AUTO_INCREMENT,
    e_mail_empresa varchar(45) not null,
    cnpj varchar(14),
    foreign key (endereco) references endereco(cep)
);

create table produto(
    id_produto int not NULL NULL PRIMARY KEY AUTO_INCREMENT,
    foreign key (cnpj) references fornecedor(cnpj),
    peso_prod float not null,
    formato varchar(45) not null,
    dataCompra date not null
 
);

create table encomenda(
    id_encomenda int not null primary key auto_increment,
    foreign key (produto) references produto(id_produto),
    foreign key (cpf) references cliente(cpf)
);

create table cliente_has_endereco(
    foreign key (cpf) references cliente(cpf),
    foreign key (cep) references endereco(cep),
    n_casa int not null,
    complemento varchar (150) not null
);

create table fornecedor_has_endereco(
    n_empresa int not null,
    complemento varchar (150) not null,
    foreign key (cnpj) references fornecedor(cnpj),
    foreign key (cep) references endereco(cep)
);

-- inserts
INSERT INTO cliente (cpf, nome,dataNacimento,email, rg, cep)
VALUES 
(12345678996,"eliezer","30/02/2003","eliezer.s"," 89574657",13131313),
(75315986244,"joao","07/03/2015","joao.msm"," 15975348",45687895),
(45678912365,"maria","06/06/2009","maria.gmail"," 35785215",45642131),
(12386427145,"bruna","24/07/2005","bruna.teacher"," 486215978",45646868),
(24896357415,"joana","29/10/1986","joana.ing"," 6842195135",84641456),
(45878225982,"ana","31/05/1965","ana.hotmail"," 593716456",89126232),
(46791352845,"vitor","26/11/1968","vitor.ifsc"," 98236571",22222222),
(78945685443,"enzo","02/09/1998","enzo.kahoot"," 456951753",56464645),
(48643458435,"xandy","01/02/2013","xandy.ifsc"," 845932714",66666666),
(56454354354,"antonio","25/03/2011","antonio.dg"," 56239874",89228922);

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
-- para fornecedor

(56469466,"rua Esperança amada", "Jequiti","Uruguai"),
(44864651,"rua Esperança abalada", "Santos","Uruguai"),
(98562374,"rua Esperança morta", "Manuel Machado","Uruguai"),
(16434357,"rua Esperança em deus", "Uniao","Uruguai"),
(54364684,"rua Esperança em ninguem", "Estados","Uruguai"),
(64854351,"rua Esperança valida", "Aliança","Uruguai"),
(52477568,"rua Esperança na sorte", "Brasil","Uruguai"),
(55783643,"rua Esperança na vida", "Jequiti","Uruguai"),
(57574836,"rua Esperança", "Jequiti","Uruguai","Paraguai"),
(58647888,"rua Esperança patriora", "Jequiti","Uruguai");



INSERT INTO fornecedor (cnpj, e_mail_empresa, nome_funcionario )
VALUES 
(13131313,"AmoMeuEmprego.@empregaBrasil","Irineu"),
(22222222,"AmoDesing.@DesingBrasil","Tonho"),
(13165468,"AdorodarAula.@AulaBrasil","Liamar"),
(26598485,"Bminhavida.@BBBrasil","Rafaela"),
(13548458,"favelaVenceu.@BBBrasil","Calila de Lucas"),
(54658436,"humorNegro.@BBBrasil","Nego di"),
(58438545,"oMelhordeTodos.@favelaBrasil","Poze"),
(36435845,"ReiDoPop.@ReiBrasil","Kevin"),
(56766894,"adivogadaKevin.@empregaBrasil","Deolane"),
(21561454,"vivaNordeste.@cactos","Julieta");


INSERT INTO produto (id_produto, cnpj, peso_prod, formato, dataCompra)
VALUES (231321, 13131313, 24, "quadrado", "85/56/2006"),
(545482, 13131313, 24, "quadrado", "05/12/2005"),
(646566, 22222222, 3, "quadrado", "04/10/1996"),
(284452, 13165468, 4, "quadrado", "09/12/1985"),
(848455, 26598485, 5, "quadrado", "25/11/1955"),
(486854, 13548458, 19, "quadrado", "04/56/2006"),
(535321, 54658436, 5, "retangulo", "29/100/2007"),
(554582, 58438545, 20, "retangulo", "27/09/2008"),
(299543, 36435845, 18, "retangulo", "26/08/2007"),
(953498, 56766894, 09, "retangulo", "23/05/2009"),
(564545, 21561454, 6, "retangulo", "05/07/2013");

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

INSERT INTO fornecedor_has_endereco (n_empresa,complemento,cnpj,cep)
VALUES
(80,"Empresa vermelha",13131313,56469466),

(95,"Empresa Cinza",22222222,44864651),
(80, "Empresa aos fundo",13165468,44864651),
(50,"Bater palma na casa da frente",26598485,98562374),
(5564,"",13548458,54364684),
(156, "Senha para entrar é 2025 ",54658436,64854351),
(88, " Residencial",58438545,52477568),
(5451,"se acaso nao estiver ninguem entregar na casa do lado",36435845,55783643),
(8745, "Cuiddado com o cachorro", 56766894,57574836),
(6561, "Deixar na caixa ", 45421561454,586478888);




-- update
-- cliente
UPDATE cliente SET nome = 'bruna' WHERE cpf = 12345678996;
UPDATE cliente SET nome = 'Zé vaqueiro' WHERE cpf = 12345678996;
UPDATE cliente SET nome = 'Gabriel' WHERE cpf = 12345678996;
UPDATE cliente SET nome = 'Valmor' WHERE cpf = 12345678996;
UPDATE cliente SET nome = 'Deodoro' WHERE cpf = 12345678996;


-- endereco
UPDATE endereco SET cep = 12345682 WHERE cep = 45687895;
UPDATE endereco SET cep = 54155454 WHERE cpf = 45642131;
UPDATE endereco SET cep = 54563485 WHERE cpf = 45646868;
update endereco SET cep = 85858474 where cpf = 84641456;
UPDATE endereco SET cep = 84814254 WHERE cpf = 22222222;

-- produto


UPDATE produto  SET id_produto = 457812 WHERE id_produto = 545482;
UPDATE produto  SET id_produto = 454852 WHERE id_produto = 646566;
UPDATE produto  SET id_produto = 354781 WHERE id_produto = 284452;
UPDATE produto  SET id_produto = 154551 WHERE id_produto = 848455;
UPDATE produto  SET id_produto = 153155 WHERE id_produto = 486854;

-- encomenda


UPDATE encomenda   SET cpf = 75315414854 WHERE cpf = 75315986244;
UPDATE encomenda  SET cpf =  84584848848 WHERE cpf = 12345678996;
UPDATE encomenda  SET cpf =  46846848646 WHERE cpf = 45678912365;
UPDATE encomenda  SET cpf =  13543854348 WHERE cpf = 12386427145;
UPDATE encomenda  SET cpf =  54534355335 WHERE cpf = 45878225982;

-- cliente endereco

UPDATE cliente_has_endereco  SET n_casa = 515 WHERE n_casa = 52;
UPDATE cliente_has_endereco  SET n_casa = 464 WHERE n_casa = 46;
UPDATE cliente_has_endereco  SET n_casa = 6456 WHERE n_casa = 54;
UPDATE cliente_has_endereco  SET n_casa = 6446 WHERE n_casa = 44;
UPDATE cliente_has_endereco  SET n_casa = 664 WHERE n_casa = 46;


-- delete cliente

DELETE FROM cliente WHERE cpf = 56454354354;
DELETE FROM cliente WHERE cpf = 45678912365;
DELETE FROM cliente WHERE cpf = 12386427145;
DELETE FROM cliente WHERE cpf = 24896357415;
DELETE FROM cliente WHERE cpf = 78945685443;

-- delete endereco 

DELETE FROM endereco WHERE cep = 45642131;
DELETE FROM endereco WHERE cep = 22222222;
DELETE FROM endereco WHERE cep = 56464645;
DELETE FROM endereco WHERE cep = 89228922;
DELETE FROM endereco WHERE cep = 89126232;

-- delete produto

DELETE FROM produto WHERE id_produto =231321;
DELETE FROM produto WHERE id_produto =284452;
DELETE FROM produto WHERE id_produto =848455;
DELETE FROM produto WHERE id_produto =486854;
DELETE FROM produto WHERE id_produto =535321;

-- delete fornecedor 

DELETE FROM fornecedor WHERE cnpj = 13131313;
DELETE FROM fornecedor WHERE cnpj = 22222222;
DELETE FROM fornecedor WHERE cnpj = 13165468;
DELETE FROM fornecedor WHERE cnpj = 26598485;
DELETE FROM fornecedor WHERE cnpj = 54658436;

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

SELECT produto.cnpj, fornecedor.cnpj
FROM produto
INNER JOIN fornecedor
ON
produto.cnpj = fornecedor.cpnj;
