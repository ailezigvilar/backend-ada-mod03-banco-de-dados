CREATE DATABASE TRABALHO_FINAL_ADA_MODULO_03;

USE TRABALHO_FINAL_ADA_MODULO_03;

CREATE TABLE MODALIDADE(
	SEQ_MODALIDADE tinyint not null auto_increment,
    DES_NOME varchar(20) not null,
    primary key (SEQ_MODALIDADE)
);

CREATE TABLE COR(
	SEQ_COR smallint not null auto_increment,
    DES_NOME varchar(20) not null,
    primary key (SEQ_COR)
);

CREATE TABLE UF(
	SEQ_UF tinyint not null auto_increment,
    DES_NOME varchar(20) not null,
    DES_SIGLA varchar(2) not null,
    primary key (SEQ_UF)
);

CREATE TABLE CIDADE(
	SEQ_CIDADE bigint not null auto_increment,
    DES_NOME varchar(40) not null,
    SEQ_UF tinyint not null,
    primary key (SEQ_CIDADE),
    foreign key (SEQ_UF) references UF(SEQ_UF)
);

CREATE TABLE ENDERECO(
	SEQ_ENDERECO bigint not null auto_increment,
    DES_CEP varchar(8) not null,
    DES_RUA varchar(50) not null,
    DES_NUMERO varchar(4) not null,
    DES_BAIRRO varchar(50) not null,
    SEQ_CIDADE bigint not null,
    primary key (SEQ_ENDERECO),
    foreign key (SEQ_CIDADE) references CIDADE(SEQ_CIDADE)
);

CREATE TABLE MARCA(
	SEQ_MARCA tinyint not null auto_increment,
    DES_NOME varchar(50) not null,
    primary key (SEQ_MARCA)
);

CREATE TABLE MONTADORA(
	SEQ_MONTADORA bigint not null auto_increment,
    DES_NOME varchar(50) not null,
    SEQ_ENDERECO bigint not null,
    SEQ_MARCA tinyint not null,
    primary key (SEQ_MONTADORA),
    foreign key (SEQ_ENDERECO) references ENDERECO(SEQ_ENDERECO),
    foreign key (SEQ_MARCA) references MARCA(SEQ_MARCA)
);

CREATE TABLE CATEGORIA(
	SEQ_CATEGORIA tinyint not null auto_increment,
    DES_NOME varchar(30) not null,
    primary key (SEQ_CATEGORIA)
);

CREATE TABLE UNIDADE(
	SEQ_UNIDADE bigint not null auto_increment,
    DES_NOME varchar(50) not null,
    DES_NUM_CNPJ varchar(14) not null,
    SEQ_ENDERECO bigint not null,
    primary key (SEQ_UNIDADE),
    foreign key (SEQ_ENDERECO) references ENDERECO(SEQ_ENDERECO)
);

CREATE TABLE MODELO_CARRO(
	SEQ_MODELO_CARRO bigint not null auto_increment,
    SEQ_CATEGORIA tinyint not null,
    SEQ_MONTADORA bigint not null,
    DES_NOME varchar(50) not null,
    DES_ANO_LANCAMENTO smallint not null,
    primary key (SEQ_MODELO_CARRO),
    foreign key (SEQ_CATEGORIA) references CATEGORIA(SEQ_CATEGORIA),
    foreign key (SEQ_MONTADORA) references MONTADORA(SEQ_MONTADORA)
);

CREATE TABLE STATUS_LOCACAO(
	SEQ_STATUS_LOCACAO tinyint not null auto_increment,
    DES_NOME varchar(50) not null,
    primary key (SEQ_STATUS_LOCACAO)
);

CREATE TABLE CARRO(
	SEQ_CARRO bigint not null auto_increment,
    SEQ_MODELO_CARRO bigint not null,
    SEQ_COR smallint not null,
    DES_PLACA varchar(7) not null,
    IND_STATUS_LOCACAO tinyint not null,
    VAL_KM_ATUAL decimal(7,1) not null,
    primary key (SEQ_CARRO),
    foreign key (SEQ_MODELO_CARRO) references MODELO_CARRO(SEQ_MODELO_CARRO),
    foreign key (SEQ_COR) references COR(SEQ_COR),
    foreign key (IND_STATUS_LOCACAO) references STATUS_LOCACAO(SEQ_STATUS_LOCACAO)
);

CREATE TABLE CLIENTE(
	SEQ_CLIENTE bigint not null auto_increment,
    SEQ_ENDERECO bigint not null,
    DES_NOME_COMPLETO varchar(50) not null,
    DES_NUM_CPF_CNPJ varchar(14) not null,
    DTH_CADASTRAMENTO datetime not null,
    primary key (SEQ_CLIENTE),
    foreign key (SEQ_ENDERECO) references ENDERECO(SEQ_ENDERECO)
);

CREATE TABLE LOCACAO(
	SEQ_LOCACAO bigint not null auto_increment,
	SEQ_CLIENTE bigint not null,
    SEQ_CARRO bigint not null,
    SEQ_MODALIDADE tinyint not null,
    SEQ_UNIDADE_RETIRADA bigint not null,
    DTH_RETIRADA datetime not null,
    VAL_KM_RETIRADA decimal(7,1) not null,
    SEQ_UNIDADE_DEVOLUCAO bigint null,
	DTH_DEVOLUCAO datetime null,
    VAL_KM_DEVOLUCAO decimal(7,1) null,
    IND_STATUS tinyint not null,
	primary key (SEQ_LOCACAO),
    foreign key (SEQ_CLIENTE) references CLIENTE(SEQ_CLIENTE),
    foreign key (SEQ_CARRO) references CARRO(SEQ_CARRO),
    foreign key (SEQ_MODALIDADE) references MODALIDADE(SEQ_MODALIDADE),
    foreign key (SEQ_UNIDADE_RETIRADA) references UNIDADE(SEQ_UNIDADE),
    foreign key (SEQ_UNIDADE_DEVOLUCAO) references UNIDADE(SEQ_UNIDADE),
	foreign key (IND_STATUS) references STATUS_LOCACAO(SEQ_STATUS_LOCACAO)
);