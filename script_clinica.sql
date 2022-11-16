CREATE DATABASE clinica;
USE clinica;

-- -----------------------------------------------------
-- Table endereco
-- -----------------------------------------------------
CREATE TABLE endereco (
  cep VARCHAR(8) NOT NULL,
  rua VARCHAR(45) NOT NULL,
  bairro VARCHAR(45) NOT NULL,
  estado VARCHAR(45) NOT NULL,
  PRIMARY KEY (cep));

-- -----------------------------------------------------
-- Table fornecedor
-- -----------------------------------------------------
CREATE TABLE fornecedor (
  cnpj INT NOT NULL,
  e_mail_empresa VARCHAR(14) NOT NULL,
  nome_funcionario VARCHAR(45) NOT NULL,
  PRIMARY KEY (cnpj));


-- -----------------------------------------------------
-- Table clientes
-- -----------------------------------------------------
CREATE TABLE IF clientes (
  cpf VARCHAR(11) NOT NULL,
  data_nasc DATE NOT NULL,
  email VARCHAR(45) NOT NULL,
  rg VARCHAR(8) NOT NULL,
  PRIMARY KEY (cpf));


-- -----------------------------------------------------
-- Table produto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS produto (
  id_produto INT NOT NULL,
  formato_prog VARCHAR(45) NULL,
  peso_prod DOUBLE NULL,
  fornecedor_id_fornecedor INT NOT NULL,
  datacompra DATE NOT NULL,
  dataentrega DATE NOT NULL,
  PRIMARY KEY (id_produto, fornecedor_id_fornecedor),

    FOREIGN KEY (fornecedor_id_fornecedor)
    REFERENCES fornecedor (cnpj);


-- -----------------------------------------------------
-- Table encomenda
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS encomenda (
  idencomenda INT NOT NULL,
  produto_idcarga INT NOT NULL,
  clientes_cpf VARCHAR(45) NOT NULL,
  PRIMARY KEY (idencomenda, produto_idcarga, clientes_cpf),
  
    FOREIGN KEY (produto_idcarga)REFERENCES produto (id_produto),
    FOREIGN KEY (clientes_cpf) REFERENCES clientes (cpf);


-- -----------------------------------------------------
-- Table clientes_has_endereco
-- -----------------------------------------------------
CREATE TABLE clientes_has_endereco (
  cep_cliente VARCHAR(8) NOT NULL,
  cpf_clientes VARCHAR(45) NOT NULL,
  n_casa VARCHAR(45) NOT NULL,
  complemento VARCHAR(45) NOT NULL,
  PRIMARY KEY (cep_cliente, cpf_clientes),
  CONSTRAINT fk_clientes_has_endereco_clientes
    FOREIGN KEY (cpf_clientes)
    REFERENCES clientes (cpf)
   
  CONSTRAINT fk_clientes_has_endereco_endereco1
    FOREIGN KEY (cep_cliente)
    REFERENCES endereco (cep));


-- -----------------------------------------------------
-- Table endereco_has_fornecedor
-- -----------------------------------------------------
CREATE TABLE endereco_has_fornecedor (
  cep_fornecedor VARCHAR(8) NOT NULL,
  id_fornecedor INT NOT NULL,
  n_empresa INT NOT NULL,
  endereco_has_fornecedorcol VARCHAR(45) NOT NULL,
  PRIMARY KEY (cep_fornecedor, id_fornecedor),
    FOREIGN KEY (cep_fornecedor) REFERENCES endereco (cep)
    FOREIGN KEY (id_fornecedor) REFERENCES  fornecedor(cnpj);