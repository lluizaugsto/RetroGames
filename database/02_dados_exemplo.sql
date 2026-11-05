USE retrogames_db;

-- 1. Carga da tabela tb_condicao_jogo (Chaves fixas: 1 Novo, 2 Usado, 3 Recondicionado)
INSERT INTO tb_condicao_jogo (co_condicao_jogo, ds_condicao_jogo) VALUES
(1, 'Novo'),
(2, 'Usado'),
(3, 'Recondicionado');

-- 2. Carga da tabela tb_perfil (Chaves fixas: 1 Administrador, 2 Cliente)
INSERT INTO tb_perfil (co_perfil, ds_perfil) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- 3. Carga da tabela tb_plataforma (Pelo menos 6 plataformas)
INSERT INTO tb_plataforma (co_seq_plataforma, no_plataforma, no_fabricante, nu_ano_lancamento) VALUES
(1, 'Super Nintendo', 'Nintendo', 1990),
(2, 'Mega Drive', 'Sega', 1988),
(3, 'PlayStation', 'Sony', 1994),
(4, 'Nintendo 64', 'Nintendo', 1996),
(5, 'Game Boy', 'Nintendo', 1989),
(6, 'Atari 2600', 'Atari', 1977);

-- 4. Carga da tabela tb_genero (Pelo menos 8 gêneros)
INSERT INTO tb_genero (co_seq_genero, no_genero) VALUES
(1, 'Ação'),
(2, 'Aventura'),
(3, 'Plataforma'),
(4, 'RPG'),
(5, 'Corrida'),
(6, 'Esporte'),
(7, 'Estratégia'),
(8, 'Luta');

-- 5. Carga da tabela tb_jogo (Pelo menos 20 jogos; 1 inativo e 1 com estoque zero)
INSERT INTO tb_jogo (co_seq_jogo, no_jogo, ds_jogo, nu_ano_lancamento, vl_preco, qt_estoque, st_ativo, dt_cadastro, co_plataforma, co_condicao_jogo) VALUES
(1, 'Super Mario World', 'Jogo clássico de plataforma do SNES.', 1990, 150.00, 10, TRUE, NOW(), 1, 2),
(2, 'The Legend of Zelda: A Link to the Past', 'Aventura épica de Link no SNES.', 1991, 250.00, 5, TRUE, NOW(), 1, 2),
(3, 'Super Metroid', 'Exploração sci-fi de ação e plataforma.', 1994, 300.00, 3, TRUE, NOW(), 1, 3),
(4, 'Chrono Trigger', 'Um dos maiores RPGs de todos os tempos.', 1995, 450.00, 2, TRUE, NOW(), 1, 1),
(5, 'Donkey Kong Country', 'Plataforma com gráficos pré-renderizados marcantes.', 1994, 180.00, 8, TRUE, NOW(), 1, 2),
(6, 'Sonic the Hedgehog', 'Velocidade e ação no console da Sega.', 1991, 120.00, 15, TRUE, NOW(), 2, 2),
(7, 'Streets of Rage 2', 'Beat em up clássico para Mega Drive.', 1992, 200.00, 4, TRUE, NOW(), 2, 2),
(8, 'Phantasy Star IV', 'RPG renomado para o Mega Drive.', 1993, 350.00, 1, TRUE, NOW(), 2, 3),
(9, 'Castlevania: Symphony of the Night', 'O marco do gênero Metroidvania.', 1997, 400.00, 6, TRUE, NOW(), 3, 2),
(10, 'Final Fantasy VII', 'O clássico RPG da Square no PS1.', 1997, 220.00, 12, TRUE, NOW(), 3, 2),
(11, 'Metal Gear Solid', 'Ação e espionagem tática de Hideo Kojima.', 1998, 280.00, 7, TRUE, NOW(), 3, 2),
(12, 'Tekken 3', 'Jogo de luta 3D aclamado do PS1.', 1998, 130.00, 0, TRUE, NOW(), 3, 2),
(13, 'Super Mario 64', 'Primeira grande aventura 3D do Mario.', 1996, 210.00, 9, TRUE, NOW(), 4, 2),
(14, 'The Legend of Zelda: Ocarina of Time', 'Revolucionário jogo de ação e aventura em 3D.', 1998, 320.00, 4, TRUE, NOW(), 4, 2),
(15, 'GoldenEye 007', 'Jogo de tiro e espionagem multiplayer no N64.', 1997, 190.00, 5, TRUE, NOW(), 4, 2),
(16, 'Pokémon Red', 'O início da jornada Pokémon no portátil.', 1996, 380.00, 3, TRUE, NOW(), 5, 2),
(17, 'Tetris', 'O lendário jogo de quebra-cabeça e estratégia.', 1989, 90.00, 20, TRUE, NOW(), 5, 2),
(18, 'Pitfall!', 'Aventura clássica na selva para Atari.', 1982, 80.00, 15, TRUE, NOW(), 6, 2),
(19, 'River Raid', 'Jogo de tiro vertical para Atari 2600.', 1982, 75.00, 11, TRUE, NOW(), 6, 2),
(20, 'Top Gear', 'Jogo clássico de corrida do SNES.', 1992, 110.00, 0, FALSE, NOW(), 1, 2);

-- 6. Carga da tabela tb_jogo_genero (Associação N:N)
INSERT INTO tb_jogo_genero (co_jogo, co_genero) VALUES
(1, 1), (1, 3),
(2, 2), (2, 4),
(3, 1), (3, 3),
(4, 4),
(5, 3),
(6, 1), (6, 3),
(7, 1), (7, 8),
(8, 4), (8, 7),
(9, 1), (9, 2),
(10, 4),
(11, 1), (11, 2),
(12, 8),
(13, 2), (13, 3),
(14, 2), (14, 4),
(15, 1),
(16, 4), (16, 7),
(17, 7),
(18, 2),
(19, 1),
(20, 5);