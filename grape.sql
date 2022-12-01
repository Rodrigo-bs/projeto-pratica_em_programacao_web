-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Dez-2022 às 11:50
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `grape`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `admin_nome` varchar(100) NOT NULL,
  `admin_usuario` varchar(100) NOT NULL,
  `admin_senha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `admin`
--

INSERT INTO `admin` (`id_admin`, `admin_nome`, `admin_usuario`, `admin_senha`) VALUES
(1, 'Rodrigo da Silva', 'rodrigo', '214ffdcff6db2609faa8f6b0633e9695'),
(2, 'Ricardo Costa', 'ricas', '214ffdcff6db2609faa8f6b0633e9695');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoriadaloja`
--

CREATE TABLE `categoriadaloja` (
  `id_categoria_loja` int(10) NOT NULL,
  `categoria_nome_loja` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoriadeproduto`
--

CREATE TABLE `categoriadeproduto` (
  `id_categoria_produto` int(11) NOT NULL,
  `categoria_produto_nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `cliente_nome` varchar(100) NOT NULL,
  `cliente_cpf` varchar(11) NOT NULL,
  `cliente_endereco` text NOT NULL,
  `cliente_email` varchar(100) NOT NULL,
  `cliente_usuario` varchar(100) NOT NULL,
  `cliente_senha` varchar(255) NOT NULL,
  `cliente_foto_de_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `cliente_nome`, `cliente_cpf`, `cliente_endereco`, `cliente_email`, `cliente_usuario`, `cliente_senha`, `cliente_foto_de_usuario`) VALUES
(1, 'Rodrigo Do nala\r\n', '88866655522', 'Rua Padre Cícero,  Bairro Conquista, N 1195', 'bixodoesculo@gmail.com', 'rodrigobs', '81dc9bdb52d04dc20036dbd8313ed055', 0),
(2, 'Rodrigo', '88855566699', '', 'rodrigo@gmail.com', 'rodrigo', '827ccb0eea8a706c4c34a16891f84e7b', 0),
(3, 'Bentinho', '05601587264', '', 'bentoluiz50@gmail.com', 'bento', '827ccb0eea8a706c4c34a16891f84e7b', 0),
(4, 'Pedro da Silva', '88866523454', '', 'paulo.sampaio88@gmail.com', '', '827ccb0eea8a706c4c34a16891f84e7b', 0),
(5, 'Rodrigo 2', '88855544422', '', 'rodrigo2@gmail.com', 'rodrigo2', '827ccb0eea8a706c4c34a16891f84e7b', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comerciante`
--

CREATE TABLE `comerciante` (
  `id_comerciante` int(10) NOT NULL,
  `comerciante_nome` varchar(100) NOT NULL,
  `comerciante_cnpj` varchar(11) NOT NULL,
  `comerciante_endereco` varchar(255) NOT NULL,
  `comerciante_email` varchar(100) NOT NULL,
  `comerciante_senha` varchar(255) NOT NULL,
  `comerciante_foto_de_usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `comerciante`
--

INSERT INTO `comerciante` (`id_comerciante`, `comerciante_nome`, `comerciante_cnpj`, `comerciante_endereco`, `comerciante_email`, `comerciante_senha`, `comerciante_foto_de_usuario`) VALUES
(1, 'Ronaldo Pedrin', '11122233366', 'Rua Padre Cícero;Bairro Conquista;Nº 1197;Rio Branco', 'ronaldo@gmail.com', 'ff64a1c43498d955147518733ac88c7c', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja`
--

CREATE TABLE `loja` (
  `id_loja` int(10) NOT NULL,
  `loja_nome` varchar(255) NOT NULL,
  `loja_descricao` text NOT NULL,
  `id_comerciante_fk` int(10) NOT NULL,
  `id_categoria_fk` int(10) NOT NULL,
  `id_plano_fk` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano`
--

CREATE TABLE `plano` (
  `id_plano` int(10) NOT NULL,
  `plano_nome` varchar(255) NOT NULL,
  `plano_valor` varchar(20) NOT NULL,
  `plano_desconto` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `produto_nome` varchar(100) NOT NULL,
  `produto_preco` varchar(20) NOT NULL,
  `produto_descricao` text NOT NULL,
  `id_categoria_fk` int(11) NOT NULL,
  `id_loja_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Índices para tabela `categoriadaloja`
--
ALTER TABLE `categoriadaloja`
  ADD PRIMARY KEY (`id_categoria_loja`);

--
-- Índices para tabela `categoriadeproduto`
--
ALTER TABLE `categoriadeproduto`
  ADD PRIMARY KEY (`id_categoria_produto`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `comerciante`
--
ALTER TABLE `comerciante`
  ADD PRIMARY KEY (`id_comerciante`);

--
-- Índices para tabela `loja`
--
ALTER TABLE `loja`
  ADD PRIMARY KEY (`id_loja`),
  ADD KEY `id_categoria_fk` (`id_categoria_fk`),
  ADD KEY `id_comerciante_fk` (`id_comerciante_fk`),
  ADD KEY `id_plano_fk` (`id_plano_fk`);

--
-- Índices para tabela `plano`
--
ALTER TABLE `plano`
  ADD PRIMARY KEY (`id_plano`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `id_categoria_fk` (`id_categoria_fk`),
  ADD KEY `id_loja_fk` (`id_loja_fk`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `categoriadaloja`
--
ALTER TABLE `categoriadaloja`
  MODIFY `id_categoria_loja` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categoriadeproduto`
--
ALTER TABLE `categoriadeproduto`
  MODIFY `id_categoria_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `comerciante`
--
ALTER TABLE `comerciante`
  MODIFY `id_comerciante` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `loja`
--
ALTER TABLE `loja`
  MODIFY `id_loja` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `plano`
--
ALTER TABLE `plano`
  MODIFY `id_plano` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `loja`
--
ALTER TABLE `loja`
  ADD CONSTRAINT `loja_ibfk_1` FOREIGN KEY (`id_categoria_fk`) REFERENCES `categoriadaloja` (`id_categoria_loja`),
  ADD CONSTRAINT `loja_ibfk_2` FOREIGN KEY (`id_comerciante_fk`) REFERENCES `comerciante` (`id_comerciante`),
  ADD CONSTRAINT `loja_ibfk_3` FOREIGN KEY (`id_plano_fk`) REFERENCES `plano` (`id_plano`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_categoria_fk`) REFERENCES `categoriadeproduto` (`id_categoria_produto`),
  ADD CONSTRAINT `produto_ibfk_2` FOREIGN KEY (`id_loja_fk`) REFERENCES `loja` (`id_loja`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
