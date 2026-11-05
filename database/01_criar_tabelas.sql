
-- Criar e selecionar o banco de dados
CREATE DATABASE IF NOT EXISTS retrogames_db;
USE retrogames_db;

-- 1. Tabela tb_condicao_jogo (Domínio - chave fixa)
CREATE TABLE tb_condicao_jogo (
    co_condicao_jogo INT NOT NULL,
    ds_condicao_jogo VARCHAR(100) NOT NULL,
    CONSTRAINT pk_tb_condicao_jogo PRIMARY KEY (co_condicao_jogo),
    CONSTRAINT uk_tb_condicao_jogo_ds UNIQUE (ds_condicao_jogo)
);

-- 2. Tabela tb_perfil (Domínio - chave fixa)
CREATE TABLE tb_perfil (
    co_perfil INT NOT NULL,
    ds_perfil VARCHAR(100) NOT NULL,
    CONSTRAINT pk_tb_perfil PRIMARY KEY (co_perfil),
    CONSTRAINT uk_tb_perfil_ds UNIQUE (ds_perfil)
);

-- 3. Tabela tb_plataforma
CREATE TABLE tb_plataforma (
    co_seq_plataforma INT AUTO_INCREMENT NOT NULL,
    no_plataforma VARCHAR(100) NOT NULL,
    no_fabricante VARCHAR(100) NOT NULL,
    nu_ano_lancamento INT NOT NULL,
    CONSTRAINT pk_tb_plataforma PRIMARY KEY (co_seq_plataforma),
    CONSTRAINT uk_tb_plataforma_no UNIQUE (no_plataforma)
);

-- 4. Tabela tb_genero
CREATE TABLE tb_genero (
    co_seq_genero INT AUTO_INCREMENT NOT NULL,
    no_genero VARCHAR(100) NOT NULL,
    CONSTRAINT pk_tb_genero PRIMARY KEY (co_seq_genero),
    CONSTRAINT uk_tb_genero_no UNIQUE (no_genero)
);

-- 5. Tabela tb_jogo
CREATE TABLE tb_jogo (
    co_seq_jogo INT AUTO_INCREMENT NOT NULL,
    no_jogo VARCHAR(150) NOT NULL,
    ds_jogo TEXT NULL,
    nu_ano_lancamento INT NOT NULL,
    vl_preco DECIMAL(10,2) NOT NULL,
    qt_estoque INT NOT NULL,
    st_ativo BOOLEAN NOT NULL DEFAULT TRUE,
    dt_cadastro DATETIME NOT NULL,
    co_plataforma INT NOT NULL,
    co_condicao_jogo INT NOT NULL,
    CONSTRAINT pk_tb_jogo PRIMARY KEY (co_seq_jogo),
    CONSTRAINT fk_tb_jogo_plataforma FOREIGN KEY (co_plataforma) REFERENCES tb_plataforma(co_seq_plataforma),
    CONSTRAINT fk_tb_jogo_condicao FOREIGN KEY (co_condicao_jogo) REFERENCES tb_condicao_jogo(co_condicao_jogo)
);

CREATE INDEX idx_tb_jogo_no ON tb_jogo(no_jogo);

-- 6. Tabela tb_jogo_genero (Associativa - PK Composta)
CREATE TABLE tb_jogo_genero (
    co_jogo INT NOT NULL,
    co_genero INT NOT NULL,
    CONSTRAINT pk_tb_jogo_genero PRIMARY KEY (co_jogo, co_genero),
    CONSTRAINT fk_tb_jogo_genero_jogo FOREIGN KEY (co_jogo) REFERENCES tb_jogo(co_seq_jogo),
    CONSTRAINT fk_tb_jogo_genero_genero FOREIGN KEY (co_genero) REFERENCES tb_genero(co_seq_genero)
);

-- 7. Tabela tb_usuario
CREATE TABLE tb_usuario (
    co_seq_usuario INT AUTO_INCREMENT NOT NULL,
    no_usuario VARCHAR(150) NOT NULL,
    ds_email VARCHAR(150) NOT NULL,
    ds_senha_hash VARCHAR(255) NOT NULL,
    st_ativo BOOLEAN NOT NULL DEFAULT TRUE,
    dt_cadastro DATETIME NOT NULL,
    co_perfil INT NOT NULL,
    CONSTRAINT pk_tb_usuario PRIMARY KEY (co_seq_usuario),
    CONSTRAINT uk_tb_usuario_email UNIQUE (ds_email),
    CONSTRAINT fk_tb_usuario_perfil FOREIGN KEY (co_perfil) REFERENCES tb_perfil(co_perfil)
);