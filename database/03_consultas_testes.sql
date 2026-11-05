USE retrogames_db;

-- 1. Consultar todos os jogos ativos com o nome da plataforma e da condição
SELECT 
    j.co_seq_jogo,
    j.no_jogo,
    j.vl_preco,
    j.qt_estoque,
    p.no_plataforma,
    c.ds_condicao_jogo
FROM tb_jogo j
INNER JOIN tb_plataforma p ON j.co_plataforma = p.co_seq_plataforma
INNER JOIN tb_condicao_jogo c ON j.co_condicao_jogo = c.co_condicao_jogo
WHERE j.st_ativo = TRUE;

-- 2. Consultar os jogos com seus respetivos gêneros (Relacionamento N:N)
SELECT 
    j.no_jogo,
    g.no_genero
FROM tb_jogo j
INNER JOIN tb_jogo_genero jg ON j.co_seq_jogo = jg.co_jogo
INNER JOIN tb_genero g ON jg.co_genero = g.co_seq_genero
ORDER BY j.no_jogo;

-- 3. Teste de Restrição UNIQUE (Deve FALHAR ao tentar inserir e-mail duplicado)
-- INSERT INTO tb_usuario (no_usuario, ds_email, ds_senha_hash, co_perfil, dt_cadastro) 
-- VALUES ('Teste 1', 'admin@retrogames.com', 'hash123', 1, NOW());
-- INSERT INTO tb_usuario (no_usuario, ds_email, ds_senha_hash, co_perfil, dt_cadastro) 
-- VALUES ('Teste 2', 'admin@retrogames.com', 'hash123', 2, NOW());

-- 4. Teste de Chave Estrangeira (Deve FALHAR ao tentar inserir jogo com plataforma inexistente)
-- INSERT INTO tb_jogo (no_jogo, nu_ano_lancamento, vl_preco, qt_estoque, dt_cadastro, co_plataforma, co_condicao_jogo) 
-- VALUES ('Jogo Invalido', 2000, 100.00, 5, NOW(), 999, 1);