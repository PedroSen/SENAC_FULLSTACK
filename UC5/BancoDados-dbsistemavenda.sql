-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/02/2026 às 22:17
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbsistemavenda`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbcliente`
--

CREATE TABLE `tbcliente` (
  `Codigo` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `DataNascimento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbcliente`
--

INSERT INTO `tbcliente` (`Codigo`, `Nome`, `CPF`, `DataNascimento`) VALUES
(1, 'Ana', '090.099.999-99', '2026-01-26');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbcompra`
--

CREATE TABLE `tbcompra` (
  `Codigo` int(11) NOT NULL,
  `CodigoFornecedor` int(11) NOT NULL,
  `DataCompra` date NOT NULL,
  `ValorTotal` decimal(10,2) NOT NULL,
  `Situacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbfornecedor`
--

CREATE TABLE `tbfornecedor` (
  `Codigo` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `CNPJ` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbitemcompra`
--

CREATE TABLE `tbitemcompra` (
  `Codigo` int(11) NOT NULL,
  `CodigoProduto` int(11) NOT NULL,
  `CodigoCompra` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `ValorUnitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbitemvenda`
--

CREATE TABLE `tbitemvenda` (
  `Codigo` int(11) NOT NULL,
  `CodigoProduto` int(11) NOT NULL,
  `CodigoVenda` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `ValorUnitario` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbitemvenda`
--

INSERT INTO `tbitemvenda` (`Codigo`, `CodigoProduto`, `CodigoVenda`, `Quantidade`, `ValorUnitario`) VALUES
(1, 1, 1, 1, 100.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbproduto`
--

CREATE TABLE `tbproduto` (
  `Codigo` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `PrecoCompra` decimal(10,2) NOT NULL,
  `PrecoVenda` decimal(10,2) NOT NULL,
  `QuantidadeEstoque` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbproduto`
--

INSERT INTO `tbproduto` (`Codigo`, `Nome`, `PrecoCompra`, `PrecoVenda`, `QuantidadeEstoque`) VALUES
(1, 'Notebook', 60.00, 100.00, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbvenda`
--

CREATE TABLE `tbvenda` (
  `Codigo` int(11) NOT NULL,
  `CodigoCliente` int(11) NOT NULL,
  `DataVenda` date NOT NULL,
  `ValorTotal` decimal(10,2) NOT NULL,
  `Situacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbvenda`
--

INSERT INTO `tbvenda` (`Codigo`, `CodigoCliente`, `DataVenda`, `ValorTotal`, `Situacao`) VALUES
(1, 1, '2026-01-26', 100.00, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbcliente`
--
ALTER TABLE `tbcliente`
  ADD PRIMARY KEY (`Codigo`);

--
-- Índices de tabela `tbcompra`
--
ALTER TABLE `tbcompra`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_CodigoFornecedor_idx` (`CodigoFornecedor`);

--
-- Índices de tabela `tbfornecedor`
--
ALTER TABLE `tbfornecedor`
  ADD PRIMARY KEY (`Codigo`);

--
-- Índices de tabela `tbitemcompra`
--
ALTER TABLE `tbitemcompra`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_CodigoCompra_idx2` (`CodigoCompra`),
  ADD KEY `FK_CodigoProduto_idx2` (`CodigoProduto`);

--
-- Índices de tabela `tbitemvenda`
--
ALTER TABLE `tbitemvenda`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_CodigoVenda_idx` (`CodigoVenda`),
  ADD KEY `FK_CodigoProduto_idx` (`CodigoProduto`);

--
-- Índices de tabela `tbproduto`
--
ALTER TABLE `tbproduto`
  ADD PRIMARY KEY (`Codigo`);

--
-- Índices de tabela `tbvenda`
--
ALTER TABLE `tbvenda`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `FK_CodigoCliente_idx` (`CodigoCliente`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbcliente`
--
ALTER TABLE `tbcliente`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbcompra`
--
ALTER TABLE `tbcompra`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbfornecedor`
--
ALTER TABLE `tbfornecedor`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbitemcompra`
--
ALTER TABLE `tbitemcompra`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbitemvenda`
--
ALTER TABLE `tbitemvenda`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbproduto`
--
ALTER TABLE `tbproduto`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbvenda`
--
ALTER TABLE `tbvenda`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tbcompra`
--
ALTER TABLE `tbcompra`
  ADD CONSTRAINT `FK_CodigoFornecedor` FOREIGN KEY (`CodigoFornecedor`) REFERENCES `tbfornecedor` (`Codigo`);

--
-- Restrições para tabelas `tbitemcompra`
--
ALTER TABLE `tbitemcompra`
  ADD CONSTRAINT `FK_CodigoCompra2` FOREIGN KEY (`CodigoCompra`) REFERENCES `tbcompra` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_CodigoProduto2` FOREIGN KEY (`CodigoProduto`) REFERENCES `tbproduto` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tbitemvenda`
--
ALTER TABLE `tbitemvenda`
  ADD CONSTRAINT `FK_CodigoProduto` FOREIGN KEY (`CodigoProduto`) REFERENCES `tbproduto` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_CodigoVenda` FOREIGN KEY (`CodigoVenda`) REFERENCES `tbvenda` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `tbvenda`
--
ALTER TABLE `tbvenda`
  ADD CONSTRAINT `FK_CodigoCliente` FOREIGN KEY (`CodigoCliente`) REFERENCES `tbcliente` (`Codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
