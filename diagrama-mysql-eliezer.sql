create database clinica;

create table cliente(

	
	cpf VARCHAR(12) NOT  NULL PRIMARY KEY AUTO_INCREMENT,
	dataNascimento Date NOT  NULL,
    email VARCHAR(45) NOT  NULL,
    rg VARCHAR(10) NOT  NULL,
    foreign key (endereco) references endereco(cep)
                    

);
create table endereco(
	cep VARCHAR(12) NOT NULL NULL PRIMARY KEY AUTO_INCREMENT,
    rua varchar(45) not null,
    bairro varchar(45) not null,
	estado varchar(45) not null
);
create table fornecedor(
	id_fornecedor int NOT NULL NULL PRIMARY KEY AUTO_INCREMENT,
    e_mail_empresa varchar(45) not null,
    cnpj varchar(14),
    nome_funcionario varchar(45),
    foreign key (endereco) references endereco(cep)
    
);
create table produto(
	id_produto int not NULL NULL PRIMARY KEY AUTO_INCREMENT,
    foreign key (fornecedor) references fornecedor(id_fornecedor),
    peso_prod float not null,
    formato varchar(45) not null,
    dataCompra date not null,
    dataEntrega date not null

);
create table encomenda(
	id_encomenda int not null primary key auto_increment,
    
    foreign key (produto) references produto(id_produto),
    foreign key (cpf) references usuario(cpf)
);

create table cliente_has_endereco(
	foreign key (cpf_cliente) references cliente(cpf),
    foreign key (cep_cliente) references endereco(cep),
    n_casa int not null,
    complemento varchar (150) not null
);

create table fornecedor_has_endereco(
    n_empresa int not null,
    complemento varchar (150) not null,
    foreign key (cnpj_fornecedor) references fornecedor(cnpj),
    foreign key (cep_fornecedor) references endereco(cep)
);



 