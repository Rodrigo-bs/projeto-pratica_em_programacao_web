-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Nov-2022 às 13:37
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Estrutura da tabela `categoriadaloja`
--

CREATE TABLE `categoriadaloja` (
  `id_categoria_loja` int(11) NOT NULL,
  `categoria_nome_loja` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoriadeproduto`
--

CREATE TABLE `categoriadeproduto` (
  `id_categoria_produto` int(11) NOT NULL,
  `categoria_produto_nome` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `cliente_nome` bigint(255) NOT NULL,
  `cliente_cpf` varchar(11) NOT NULL,
  `cliente_endereco` text NOT NULL,
  `cliente_email` varchar(100) NOT NULL,
  `cliente_senha` int(32) NOT NULL,
  `cliente_foto_de_usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comerciante`
--

CREATE TABLE `comerciante` (
  `id_comerciante` int(11) NOT NULL,
  `comerciante_nome` varchar(255) NOT NULL,
  `comerciante_cnpj` varchar(11) NOT NULL,
  `comerciante_endereco` text NOT NULL,
  `comerciante_email` varchar(255) NOT NULL,
  `comerciante_senha` varchar(32) NOT NULL,
  `comerciante_foto_de_usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja`
--

CREATE TABLE `loja` (
  `id_loja` int(11) NOT NULL,
  `loja_nome` varchar(100) NOT NULL,
  `loja_logo` varchar(255) NOT NULL,
  `loja_descricao` text NOT NULL,
  `id_comerciante_fk` int(11) NOT NULL,
  `id_categoria_da_loja_fk` int(11) NOT NULL,
  `id_plano_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `plano`
--

CREATE TABLE `plano` (
  `id_plano` int(11) NOT NULL,
  `plano_nome` varchar(255) NOT NULL,
  `plano_valor` varchar(10) NOT NULL,
  `plano_desconto` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `produto_nome` varchar(255) NOT NULL,
  `produto_preco` varchar(10) NOT NULL,
  `produto_descricao` text NOT NULL,
  `id_categoria_fk` int(11) NOT NULL,
  `id_loja_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

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
  ADD KEY `id_comerciante_fk` (`id_comerciante_fk`),
  ADD KEY `id_plano_fk` (`id_plano_fk`),
  ADD KEY `id_categoria_da_loja_fk` (`id_categoria_da_loja_fk`);

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
-- AUTO_INCREMENT de tabela `categoriadeproduto`
--
ALTER TABLE `categoriadeproduto`
  MODIFY `id_categoria_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `comerciante`
--
ALTER TABLE `comerciante`
  MODIFY `id_comerciante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `loja`
--
ALTER TABLE `loja`
  MODIFY `id_loja` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `plano`
--
ALTER TABLE `plano`
  MODIFY `id_plano` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `loja_ibfk_1` FOREIGN KEY (`id_comerciante_fk`) REFERENCES `comerciante` (`id_comerciante`),
  ADD CONSTRAINT `loja_ibfk_2` FOREIGN KEY (`id_plano_fk`) REFERENCES `plano` (`id_plano`),
  ADD CONSTRAINT `loja_ibfk_3` FOREIGN KEY (`id_categoria_da_loja_fk`) REFERENCES `categoriadaloja` (`id_categoria_loja`);

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
