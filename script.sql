CREATE DATABASE TRABALHO_FINAL_ADA_MODULO_03;

USE TRABALHO_FINAL_ADA_MODULO_03;

-- Modalidade

CREATE TABLE MODALIDADE(
	SEQ_MODALIDADE tinyint not null auto_increment,
    DES_NOME varchar(20) not null,
    primary key (SEQ_MODALIDADE)
);

INSERT INTO MODALIDADE (DES_NOME) VALUES ('Diária');

-- Cor
-- USE TRABALHO_FINAL_ADA_MODULO_03;

CREATE TABLE COR(
	SEQ_COR smallint not null auto_increment,
    DES_NOME varchar(20) not null,
    primary key (SEQ_COR)
);
-- Definir cores
INSERT INTO COR (DES_NOME) VALUES ('Branco'), ('Preto'), ('Prata');

-- UF

CREATE TABLE UF(
	SEQ_UF tinyint not null auto_increment,
    DES_NOME varchar(20) not null,
    DES_SIGLA varchar(2) not null,
    primary key (SEQ_UF)
);

INSERT INTO UF (DES_NOME, DES_SIGLA) VALUES 
('Acre', 'AC'), ('Alagoas', 'AL'), ('Amapá', 'AP'), ('Amazonas', 'AM'), ('Bahia', 'BA'), ('Ceará', 'CE'), ('Espírito Santo', 'ES'), ('Goiás', 'GO'), ('Maranhão', 'MA'),
('Mato Grosso', 'MT'), ('Mato Grosso do Sul', 'MS'), ('Minas Gerais', 'MG'), ('Pará', 'PA'), ('Paraíba', 'PB'), ('Paraná', 'PR'), ('Pernambuco', 'PE'), ('Piauí', 'PI'), ('Rio de Janeiro', 'RJ'),
('Rio Grande do Norte', 'RN'), ('Rio Grande do Sul', 'RS'), ('Rondônia', 'RO'), ('Roraima', 'RR'), ('Santa Catarina', 'SC'), ('São Paulo', 'SP'), ('Sergipe', 'SE'), ('Tocantins', 'TO'), ('Distrito Federal', 'DF')
;

-- Cidade

CREATE TABLE CIDADE(
	SEQ_CIDADE bigint not null auto_increment,
    DES_NOME varchar(40) not null,
    SEQ_UF tinyint not null,
    primary key (SEQ_CIDADE),
    foreign key (SEQ_UF) references UF(SEQ_UF)
);

INSERT INTO CIDADE(DES_NOME, SEQ_UF) SELECT 'Rio Grande', SEQ_UF FROM UF WHERE DES_SIGLA = 'RS';
INSERT INTO CIDADE(DES_NOME, SEQ_UF) SELECT 'Mauá', SEQ_UF FROM UF WHERE DES_SIGLA = 'SP';
INSERT INTO CIDADE(DES_NOME, SEQ_UF) SELECT 'São Caetano', SEQ_UF FROM UF WHERE DES_SIGLA = 'SP';
INSERT INTO CIDADE(DES_NOME, SEQ_UF) SELECT 'Curitiba', SEQ_UF FROM UF WHERE DES_SIGLA = 'PR'; 
INSERT INTO CIDADE(DES_NOME, SEQ_UF) SELECT 'Florianópolis', SEQ_UF FROM UF WHERE DES_SIGLA = 'SC'; 
INSERT INTO CIDADE(DES_NOME, SEQ_UF) SELECT 'Porto Alegre', SEQ_UF FROM UF WHERE DES_SIGLA = 'RS'; 
INSERT INTO CIDADE(DES_NOME, SEQ_UF) SELECT 'Santa Maria', SEQ_UF FROM UF WHERE DES_SIGLA = 'RS';
INSERT INTO CIDADE(DES_NOME, SEQ_UF) SELECT 'São Luís', SEQ_UF FROM UF WHERE DES_SIGLA = 'MA'; 


-- Endereço

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

INSERT INTO ENDERECO(DES_CEP, DES_RUA, DES_NUMERO, DES_BAIRRO, SEQ_CIDADE) SELECT '09322288', 'Rua Luis Aletto', '178', 'Boa Vista', SEQ_CIDADE FROM CIDADE WHERE DES_NOME = 'Mauá';
INSERT INTO ENDERECO(DES_CEP, DES_RUA, DES_NUMERO, DES_BAIRRO, SEQ_CIDADE) SELECT '96203270', 'Rua Padre Nilo Gollo', '27', 'Vila São Jorge', SEQ_CIDADE FROM CIDADE WHERE DES_NOME = 'Rio Grande';
INSERT INTO ENDERECO(DES_CEP, DES_RUA, DES_NUMERO, DES_BAIRRO, SEQ_CIDADE) SELECT '09550400', 'Avenida do Estado', '2880', 'Prosperidade', SEQ_CIDADE FROM CIDADE WHERE DES_NOME = 'São Caetano';
INSERT INTO ENDERECO(DES_CEP, DES_RUA, DES_NUMERO, DES_BAIRRO, SEQ_CIDADE) SELECT '80215170', 'Rua Chile', '1298', 'Rebouças', SEQ_CIDADE FROM CIDADE WHERE DES_NOME = 'Curitiba';
INSERT INTO ENDERECO(DES_CEP, DES_RUA, DES_NUMERO, DES_BAIRRO, SEQ_CIDADE) SELECT '80220180', 'Rua Bocaiuva', '2468', 'Centro', SEQ_CIDADE FROM CIDADE WHERE DES_NOME = 'Florianópolis';
INSERT INTO ENDERECO(DES_CEP, DES_RUA, DES_NUMERO, DES_BAIRRO, SEQ_CIDADE) SELECT '88035110', 'Rua Coronel Maurício Spalding de Souza', '910', 'Santa Mônica', SEQ_CIDADE FROM CIDADE WHERE DES_NOME = 'Florianópolis';
INSERT INTO ENDERECO(DES_CEP, DES_RUA, DES_NUMERO, DES_BAIRRO, SEQ_CIDADE) SELECT '80520650', 'Rua José Luiz Rissardi', '226', 'Pilarzinho', SEQ_CIDADE FROM CIDADE WHERE DES_NOME = 'Curitiba'; 
INSERT INTO ENDERECO(DES_CEP, DES_RUA, DES_NUMERO, DES_BAIRRO, SEQ_CIDADE) SELECT '90430090', 'Rua Dona Laura', '333', 'Rio Branco', SEQ_CIDADE FROM CIDADE WHERE DES_NOME = 'Porto Alegre';
INSERT INTO ENDERECO(DES_CEP, DES_RUA, DES_NUMERO, DES_BAIRRO, SEQ_CIDADE) SELECT '97010440', 'Rua São Francisco', '350', 'Nossa Sra. do Rosario', SEQ_CIDADE FROM CIDADE WHERE DES_NOME = 'Santa Maria';  
INSERT INTO ENDERECO(DES_CEP, DES_RUA, DES_NUMERO, DES_BAIRRO, SEQ_CIDADE) SELECT '65081110', 'Rua Monção', '350', 'Vila Dom Luis', SEQ_CIDADE FROM CIDADE WHERE DES_NOME = 'São Luís'; 


-- Marca
-- USE TRABALHO_FINAL_ADA_MODULO_03;

CREATE TABLE MARCA(
	SEQ_MARCA tinyint not null auto_increment,
    DES_NOME varchar(50) not null,
    primary key (SEQ_MARCA)
);

INSERT INTO MARCA(DES_NOME) VALUES ('Chevrolet'), ('Volkswagen'), ('Fiat'), ('Ford'), ('Citröen'), ('Nissan'), ('Peugeot'), ('Honda'); 


-- Montadora
CREATE TABLE MONTADORA(
	SEQ_MONTADORA bigint not null auto_increment,
    DES_NOME varchar(50) not null,
    SEQ_ENDERECO bigint not null,
    SEQ_MARCA tinyint not null,
    primary key (SEQ_MONTADORA),
    foreign key (SEQ_ENDERECO) references ENDERECO(SEQ_ENDERECO),
    foreign key (SEQ_MARCA) references MARCA(SEQ_MARCA)
);

INSERT INTO MONTADORA(DES_NOME, SEQ_ENDERECO, SEQ_MARCA) SELECT 'Volkswagen São Caetano', e.SEQ_ENDERECO, m.SEQ_MARCA FROM ENDERECO e, MARCA m WHERE e.DES_CEP = '09550400' AND m.DES_NOME = 'Volkswagen';
INSERT INTO MONTADORA(DES_NOME, SEQ_ENDERECO, SEQ_MARCA) SELECT 'Ford Curitiba', e.SEQ_ENDERECO, m.SEQ_MARCA FROM ENDERECO e, MARCA m WHERE e.DES_CEP = '80520650' AND m.DES_NOME = 'Ford';
INSERT INTO MONTADORA(DES_NOME, SEQ_ENDERECO, SEQ_MARCA) SELECT 'Nissan Mauá', e.SEQ_ENDERECO, m.SEQ_MARCA FROM ENDERECO e, MARCA m WHERE e.DES_CEP = '09322288' AND m.DES_NOME = 'Nissan';
INSERT INTO MONTADORA(DES_NOME, SEQ_ENDERECO, SEQ_MARCA) SELECT 'Chevrolet São Luís', e.SEQ_ENDERECO, m.SEQ_MARCA FROM ENDERECO e, MARCA m WHERE e.DES_CEP = '65081110' AND m.DES_NOME = 'Chevrolet';


-- Categoria

CREATE TABLE CATEGORIA(
	SEQ_CATEGORIA tinyint not null auto_increment,
    DES_NOME varchar(30) not null,
    primary key (SEQ_CATEGORIA)
);

INSERT INTO CATEGORIA(DES_NOME) VALUES ('Hatch'), ('Sedan Compacto'), ('Sedan Médio'), ('SUV');


CREATE TABLE UNIDADE(
	SEQ_UNIDADE bigint not null auto_increment,
    DES_NOME varchar(50) not null,
    DES_NUM_CNPJ varchar(14) not null,
    SEQ_ENDERECO bigint not null,
    primary key (SEQ_UNIDADE),
    foreign key (SEQ_ENDERECO) references ENDERECO(SEQ_ENDERECO)
);

INSERT INTO UNIDADE(DES_NOME, DES_NUM_CNPJ, SEQ_ENDERECO) SELECT 'Carloca Florianópolis Centro', '15454689000187', SEQ_ENDERECO FROM ENDERECO WHERE DES_CEP = '80220180';
INSERT INTO UNIDADE(DES_NOME, DES_NUM_CNPJ, SEQ_ENDERECO) SELECT 'Carloca Florianópolis Santa Mônica', '15454689000287', SEQ_ENDERECO FROM ENDERECO WHERE DES_CEP = '88035110';
INSERT INTO UNIDADE(DES_NOME, DES_NUM_CNPJ, SEQ_ENDERECO) SELECT 'Carloca Porto Alegre Rio Branco', '15454689000387', SEQ_ENDERECO FROM ENDERECO WHERE DES_CEP = '90430090';
INSERT INTO UNIDADE(DES_NOME, DES_NUM_CNPJ, SEQ_ENDERECO) SELECT 'Carloca Curitiba Rebouças', '15454689000487', SEQ_ENDERECO FROM ENDERECO WHERE DES_CEP = '80215170';


-- Modelo Carro
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

INSERT INTO MODELO_CARRO(SEQ_CATEGORIA, SEQ_MONTADORA, DES_NOME, DES_ANO_LANCAMENTO) SELECT c.SEQ_CATEGORIA, m.SEQ_MONTADORA, 'Ford Focus', '2021' FROM CATEGORIA c, MONTADORA m WHERE c.DES_NOME = 'Hatch' AND m.DES_NOME = 'Ford Curitiba';
INSERT INTO MODELO_CARRO(SEQ_CATEGORIA, SEQ_MONTADORA, DES_NOME, DES_ANO_LANCAMENTO) SELECT c.SEQ_CATEGORIA, m.SEQ_MONTADORA, 'Nissan Kicks', '2024' FROM CATEGORIA c, MONTADORA m WHERE c.DES_NOME = 'SUV' AND m.DES_NOME = 'Nissan Mauá';
INSERT INTO MODELO_CARRO(SEQ_CATEGORIA, SEQ_MONTADORA, DES_NOME, DES_ANO_LANCAMENTO) SELECT c.SEQ_CATEGORIA, m.SEQ_MONTADORA, 'Volkswagen Jetta', '2023' FROM CATEGORIA c, MONTADORA m WHERE c.DES_NOME = 'Sedan Médio' AND m.DES_NOME = 'Volkswagen São Caetano';
INSERT INTO MODELO_CARRO(SEQ_CATEGORIA, SEQ_MONTADORA, DES_NOME, DES_ANO_LANCAMENTO) SELECT c.SEQ_CATEGORIA, m.SEQ_MONTADORA, 'Chevrolet Onix', '2020' FROM CATEGORIA c, MONTADORA m WHERE c.DES_NOME = 'Sedan Compacto' AND m.DES_NOME = 'Chevrolet São Luís';


-- Status Locação
CREATE TABLE STATUS_LOCACAO(
	SEQ_STATUS_LOCACAO tinyint not null auto_increment,
    DES_NOME varchar(50) not null,
    primary key (SEQ_STATUS_LOCACAO)
);

INSERT INTO STATUS_LOCACAO(DES_NOME) VALUES ('Disponível'), ('Locado'), ('Em manutenção'), ('Indisponível');


-- Carro
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

INSERT INTO CARRO(SEQ_MODELO_CARRO, SEQ_COR, DES_PLACA, IND_STATUS_LOCACAO, VAL_KM_ATUAL) SELECT mc.SEQ_MODELO_CARRO, c.SEQ_COR, 'CYW12C4', sl.SEQ_STATUS_LOCACAO, 200 FROM MODELO_CARRO mc, COR c, STATUS_LOCACAO sl WHERE mc.DES_NOME = 'Ford Focus' AND c.DES_NOME = 'Branco' AND sl.DES_NOME = 'Disponível';

SELECT * FROM CARRO;

-- Cliente
CREATE TABLE CLIENTE(
	SEQ_CLIENTE bigint not null auto_increment,
    SEQ_ENDERECO bigint not null,
    DES_NOME_COMPLETO varchar(50) not null,
    DES_NUM_CPF_CNPJ varchar(14) not null,
    DTH_CADASTRAMENTO datetime not null,
    primary key (SEQ_CLIENTE),
    foreign key (SEQ_ENDERECO) references ENDERECO(SEQ_ENDERECO)
);

INSERT INTO CLIENTE(SEQ_ENDERECO, DES_NOME_COMPLETO, DES_NUM_CPF_CNPJ, DTH_CADASTRAMENTO) VALUES (1, 'Lelly Vilar', '12345678912', '2023-10-28 19:30:35');
