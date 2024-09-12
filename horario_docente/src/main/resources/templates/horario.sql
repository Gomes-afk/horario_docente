-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: horario
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id_curso` bigint NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Informática'),(2,'Administração');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dia`
--

DROP TABLE IF EXISTS `dia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dia` (
  `id_dia` bigint NOT NULL AUTO_INCREMENT,
  `ordem` int DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_dia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dia`
--

LOCK TABLES `dia` WRITE;
/*!40000 ALTER TABLE `dia` DISABLE KEYS */;
INSERT INTO `dia` VALUES (1,2,'Segunda'),(2,3,'Terça'),(3,4,'Quarta'),(4,5,'Quinta'),(5,6,'Sexta'),(6,7,'Sabado');
/*!40000 ALTER TABLE `dia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `id_disciplina` bigint NOT NULL,
  `nome` varchar(45) NOT NULL,
  `sigla` varchar(45) NOT NULL,
  `tempo` int DEFAULT NULL,
  `area_fim` tinyint DEFAULT NULL,
  `matriz_curricular_id` bigint NOT NULL,
  `etapa_serie_id` bigint NOT NULL,
  PRIMARY KEY (`id_disciplina`),
  KEY `fk_disciplina_matriz_curricular_idx` (`matriz_curricular_id`),
  KEY `fk_disciplina_etapa_idx` (`etapa_serie_id`),
  CONSTRAINT `fk_disciplina_etapa_serie` FOREIGN KEY (`etapa_serie_id`) REFERENCES `etapa_serie` (`id_etapa_serie`),
  CONSTRAINT `fk_disciplina_matriz_curricular` FOREIGN KEY (`matriz_curricular_id`) REFERENCES `matriz_curricular` (`id_matriz_curricular`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'ARQUITETURA DE COMPUTADORES','ARC',4,1,1,1),(2,'LINGUAGEM DE PROGRAMAÇÃO I','LP1',8,1,1,1),(3,'LÓGICA APLICADA À INFORMÁTICA','LAI',4,0,1,1),(4,'MODELAGEM DE DADOS I','MD1',4,1,1,1),(5,'SEGURANÇA, MEIO AMBIENTE E SAÚDE','SMAS',2,0,1,1),(6,'SISTEMAS OPERACIONAIS','SO',4,1,1,1),(7,'TECNOLOGIA DA INFORMAÇÃO','TI',4,1,1,1),(8,'BANCO DE DADOS I','BD1',4,1,1,2),(9,'DESIGN GRÁFICO','DG',4,0,1,2),(10,'FERRAMENTAS PARA WEB I','FW1',2,1,1,2),(11,'LINGUAGEM DE PROGRAMAÇÃO II','LP2',8,1,1,2),(12,'MODELAGEM DE DADOS II','MD2',4,1,1,2),(13,'MONTAGEM E MANUTENÇÃO','MM',4,1,1,2),(14,'REDES DE COMPUTADORES','RD',4,1,1,2),(15,'BANCO DE DADOS II','BD2',4,1,1,3),(16,'FERRAMENTAS PARA WEB II','FW2',4,1,1,3),(17,'GESTÃO E EMPREENDEDORISMO','GE',2,0,1,3),(18,'LINGUAGEM DE PROGRAMAÇÃO III','LP3',8,1,1,3),(19,'PROGRAMAÇÃO PARA DISPOSITIVOS','PDM',6,1,1,3),(20,'PROJETO FINAL','PF',4,1,1,3),(21,'PSICOLOGIA DAS RELAÇÕES HUMANAS','PSI',2,0,1,3),(22,'INFORMÁTICA APLICADA I ','INFA1',2,0,2,1),(23,'INFORMÁTICA APLICADA II','INFA2',2,0,2,3);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina_habilitacao`
--

DROP TABLE IF EXISTS `disciplina_habilitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina_habilitacao` (
  `disciplina_id` bigint NOT NULL,
  `habilitacao_id` bigint NOT NULL,
  PRIMARY KEY (`disciplina_id`,`habilitacao_id`),
  KEY `fk_disciplina_habilitacao_habilitacao_idx` (`habilitacao_id`),
  CONSTRAINT `fk_disciplina_habilitacao_disciplina` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`id_disciplina`),
  CONSTRAINT `fk_disciplina_habilitacao_habilitacao` FOREIGN KEY (`habilitacao_id`) REFERENCES `habilitacao` (`id_habilitacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina_habilitacao`
--

LOCK TABLES `disciplina_habilitacao` WRITE;
/*!40000 ALTER TABLE `disciplina_habilitacao` DISABLE KEYS */;
INSERT INTO `disciplina_habilitacao` VALUES (1,1),(2,1),(4,1),(6,1),(7,1),(8,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(18,1),(19,1),(20,1),(22,1),(23,1);
/*!40000 ALTER TABLE `disciplina_habilitacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilidade_docente`
--

DROP TABLE IF EXISTS `disponibilidade_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilidade_docente` (
  `id_disponibilidade_docente` bigint NOT NULL,
  `docente_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_disponibilidade_docente`),
  KEY `fk_disponibilidade_docente_docente_idx` (`docente_id`),
  CONSTRAINT `fk_disponibilidade_docente_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id_docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilidade_docente`
--

LOCK TABLES `disponibilidade_docente` WRITE;
/*!40000 ALTER TABLE `disponibilidade_docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `disponibilidade_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `id_docente` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `setor_id` bigint NOT NULL,
  `tempo` int DEFAULT '0',
  `habilitacao_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_docente`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fkSetorSetorID_idx` (`setor_id`),
  KEY `fk_docente_habilitacao_idx` (`habilitacao_id`),
  CONSTRAINT `fk_docente_habilitacao` FOREIGN KEY (`habilitacao_id`) REFERENCES `habilitacao` (`id_habilitacao`),
  CONSTRAINT `fk_docente_setor` FOREIGN KEY (`setor_id`) REFERENCES `setor` (`id_setor`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
INSERT INTO `docente` VALUES (10,'BRUNO','TORRES','99999999999','brunotorresprofessor@gmail.com',4,12,1),(11,'ALEXANDRE','ROCHA novo','77777777777','vivian.torres@prof.etejk.faetec.rj.gov.br',5,0,1),(12,'JULIO','DA SILVA','88888888888','teste@teste.com',4,24,1);
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente_disciplina`
--

DROP TABLE IF EXISTS `docente_disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente_disciplina` (
  `docente_id` bigint NOT NULL,
  `disciplina_id` bigint NOT NULL,
  PRIMARY KEY (`docente_id`,`disciplina_id`),
  KEY `fk_docente_disciplina_disciplina_idx` (`disciplina_id`),
  CONSTRAINT `fk_docente_disciplina_disciplina` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`id_disciplina`),
  CONSTRAINT `fk_docente_disciplina_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id_docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Essa entidade associativa forma a preferencia em relação as disciplinas de um docente.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente_disciplina`
--

LOCK TABLES `docente_disciplina` WRITE;
/*!40000 ALTER TABLE `docente_disciplina` DISABLE KEYS */;
INSERT INTO `docente_disciplina` VALUES (10,1),(10,8),(10,9),(10,10),(10,15),(10,17),(10,22),(10,23);
/*!40000 ALTER TABLE `docente_disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente_tempo`
--

DROP TABLE IF EXISTS `docente_tempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente_tempo` (
  `docente_id` bigint NOT NULL,
  `tempo_id` bigint NOT NULL,
  `prioridade` bigint NOT NULL,
  PRIMARY KEY (`docente_id`,`tempo_id`,`prioridade`),
  KEY `fk_docente_tempo_tempo_idx` (`tempo_id`),
  CONSTRAINT `fk_docente_tempo_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id_docente`),
  CONSTRAINT `fk_docente_tempo_tempo` FOREIGN KEY (`tempo_id`) REFERENCES `tempo` (`id_tempo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Essa entidade associativa forma a disponibilidade em relação ao tempos de aula de um docente.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente_tempo`
--

LOCK TABLES `docente_tempo` WRITE;
/*!40000 ALTER TABLE `docente_tempo` DISABLE KEYS */;
INSERT INTO `docente_tempo` VALUES (10,1,1),(11,1,1),(11,1,2),(10,2,2),(11,3,3),(10,4,3),(10,5,4);
/*!40000 ALTER TABLE `docente_tempo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ensino`
--

DROP TABLE IF EXISTS `ensino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ensino` (
  `id_ensino` bigint NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_ensino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensino`
--

LOCK TABLES `ensino` WRITE;
/*!40000 ALTER TABLE `ensino` DISABLE KEYS */;
INSERT INTO `ensino` VALUES (1,'Integrado'),(2,'Subsequente');
/*!40000 ALTER TABLE `ensino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escola`
--

DROP TABLE IF EXISTS `escola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `escola` (
  `id_escola` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id_escola`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escola`
--

LOCK TABLES `escola` WRITE;
/*!40000 ALTER TABLE `escola` DISABLE KEYS */;
INSERT INTO `escola` VALUES (4,'ETEJK'),(5,'REPÚBLICA');
/*!40000 ALTER TABLE `escola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapa_serie`
--

DROP TABLE IF EXISTS `etapa_serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapa_serie` (
  `id_etapa_serie` bigint NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_etapa_serie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapa_serie`
--

LOCK TABLES `etapa_serie` WRITE;
/*!40000 ALTER TABLE `etapa_serie` DISABLE KEYS */;
INSERT INTO `etapa_serie` VALUES (1,'Etapa 1'),(2,'Etapa 2'),(3,'Etapa 3');
/*!40000 ALTER TABLE `etapa_serie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habilitacao`
--

DROP TABLE IF EXISTS `habilitacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habilitacao` (
  `id_habilitacao` bigint NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_habilitacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habilitacao`
--

LOCK TABLES `habilitacao` WRITE;
/*!40000 ALTER TABLE `habilitacao` DISABLE KEYS */;
INSERT INTO `habilitacao` VALUES (1,'Informática'),(2,'Administração');
/*!40000 ALTER TABLE `habilitacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id_horario` bigint NOT NULL,
  `local_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `fk_horario_local_idx` (`local_id`),
  CONSTRAINT `fk_horario_local` FOREIGN KEY (`local_id`) REFERENCES `local` (`id_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario_turma`
--

DROP TABLE IF EXISTS `horario_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario_turma` (
  `horario_id` bigint NOT NULL,
  `turma_id` bigint NOT NULL,
  PRIMARY KEY (`horario_id`,`turma_id`),
  KEY `fk_horario_turma_turma_idx` (`turma_id`),
  CONSTRAINT `fk_horario_turma_horario` FOREIGN KEY (`horario_id`) REFERENCES `horario` (`id_horario`),
  CONSTRAINT `fk_horario_turma_turma` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`id_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario_turma`
--

LOCK TABLES `horario_turma` WRITE;
/*!40000 ALTER TABLE `horario_turma` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario_turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local`
--

DROP TABLE IF EXISTS `local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local` (
  `id_local` bigint NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `tipo_local_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_local`),
  KEY `fk_local_tipo_local_idx` (`tipo_local_id`),
  CONSTRAINT `fk_local_tipo_local` FOREIGN KEY (`tipo_local_id`) REFERENCES `tipo_local` (`id_tipo_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local`
--

LOCK TABLES `local` WRITE;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
/*!40000 ALTER TABLE `local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `id_matricula` bigint NOT NULL AUTO_INCREMENT,
  `cargo` varchar(255) NOT NULL,
  `carga_horaria` bigint NOT NULL,
  `docente_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `fk_matricula_docente_idx` (`docente_id`),
  CONSTRAINT `fk_matricula_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id_docente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriz_curricular`
--

DROP TABLE IF EXISTS `matriz_curricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matriz_curricular` (
  `id_matriz_curricular` bigint NOT NULL,
  `nome` varchar(45) NOT NULL,
  `curso_id` bigint NOT NULL,
  `ano_matriz` varchar(4) NOT NULL,
  PRIMARY KEY (`id_matriz_curricular`),
  KEY `fk_matriz_curricular_curso_idx` (`curso_id`),
  CONSTRAINT `fk_matriz_curricular_curso` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriz_curricular`
--

LOCK TABLES `matriz_curricular` WRITE;
/*!40000 ALTER TABLE `matriz_curricular` DISABLE KEYS */;
INSERT INTO `matriz_curricular` VALUES (1,'Matriz Curricular Informática Subsequente',1,'2023'),(2,'Matriz Curricular Administração Subsequente',2,'2023');
/*!40000 ALTER TABLE `matriz_curricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissao`
--

DROP TABLE IF EXISTS `permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissao` (
  `id_permissao` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id_permissao`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissao`
--

LOCK TABLES `permissao` WRITE;
/*!40000 ALTER TABLE `permissao` DISABLE KEYS */;
INSERT INTO `permissao` VALUES (1,'administrador'),(2,'coordenador_curso'),(3,'professor');
/*!40000 ALTER TABLE `permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferencia_disciplina_docente`
--

DROP TABLE IF EXISTS `preferencia_disciplina_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferencia_disciplina_docente` (
  `docente_id` bigint NOT NULL,
  `disciplina_id` bigint NOT NULL,
  `preferencia` int NOT NULL,
  `data_escolha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`docente_id`,`disciplina_id`,`preferencia`),
  KEY `fk_preferencia_disciplina_docente_disciplina_idx` (`disciplina_id`),
  CONSTRAINT `fk_preferencia_disciplina_docente_disciplina` FOREIGN KEY (`disciplina_id`) REFERENCES `disciplina` (`id_disciplina`),
  CONSTRAINT `fk_preferencia_disciplina_docente_docente` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id_docente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferencia_disciplina_docente`
--

LOCK TABLES `preferencia_disciplina_docente` WRITE;
/*!40000 ALTER TABLE `preferencia_disciplina_docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferencia_disciplina_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setor`
--

DROP TABLE IF EXISTS `setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setor` (
  `id_setor` bigint NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `escola_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id_setor`),
  KEY `fk_setor_escola_idx` (`escola_id`),
  CONSTRAINT `fk_setor_escola` FOREIGN KEY (`escola_id`) REFERENCES `escola` (`id_escola`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setor`
--

LOCK TABLES `setor` WRITE;
/*!40000 ALTER TABLE `setor` DISABLE KEYS */;
INSERT INTO `setor` VALUES (4,'Coordenação de Informática',5),(5,'Coordenação de Administração',5),(6,'Coordenação de Turismo',5);
/*!40000 ALTER TABLE `setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tempo`
--

DROP TABLE IF EXISTS `tempo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempo` (
  `id_tempo` bigint NOT NULL AUTO_INCREMENT,
  `ordem` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `dia_id` bigint NOT NULL,
  PRIMARY KEY (`id_tempo`),
  UNIQUE KEY `ordem_UNIQUE` (`ordem`),
  KEY `fk_tempo_dia_idx` (`dia_id`),
  CONSTRAINT `fk_tempo_dia` FOREIGN KEY (`dia_id`) REFERENCES `dia` (`id_dia`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tempo`
--

LOCK TABLES `tempo` WRITE;
/*!40000 ALTER TABLE `tempo` DISABLE KEYS */;
INSERT INTO `tempo` VALUES (1,1,'7:00 até 07:50',1),(2,2,'7:50 até 08:40',1),(3,3,'9:00 até 09:50',1),(4,4,'9:50 até 10:40',1),(5,5,'10:40 até 11:30',1),(6,6,'11:30 até 12:20',1),(7,7,'13:00 até 13:50',1),(8,8,'13:50 até 14:40',1),(9,9,'14:40 até 15:30',1),(10,10,'15:50 até 16:40',1),(11,11,'16:40 até 17:30',1),(12,12,'17:30 até 18:20',1),(13,13,'18:30 até 19:10',1),(14,14,'19:10 até 19:50',1),(15,15,'20:00 até 20:40',1),(16,16,'20:40 até 21:20',1),(17,17,'21:20 até 22:00',1),(18,18,'22:00 até 22:40',1),(19,19,'7:00 até 07:50',2),(20,20,'7:50 até 08:40',2),(21,21,'9:00 até 09:50',2),(22,22,'9:50 até 10:40',2),(23,23,'10:40 até 11:30',2),(24,24,'11:30 até 12:20',2),(25,25,'13:00 até 13:50',2),(26,26,'13:50 até 14:40',2),(27,27,'14:40 até 15:30',2),(28,28,'15:50 até 16:40',2),(29,29,'16:40 até 17:30',2),(30,30,'17:30 até 18:20',2),(31,31,'18:30 até 19:10',2),(32,32,'19:10 até 19:50',2),(33,33,'20:00 até 20:40',2),(34,34,'20:40 até 21:20',2),(35,35,'21:20 até 22:00',2),(36,36,'22:00 até 22:40',2),(37,37,'7:00 até 07:50',3),(38,38,'7:50 até 08:40',3),(39,39,'9:00 até 09:50',3),(40,40,'9:50 até 10:40',3),(41,41,'10:40 até 11:30',3),(42,42,'11:30 até 12:20',3),(43,43,'13:00 até 13:50',3),(44,44,'13:50 até 14:40',3),(45,45,'14:40 até 15:30',3),(46,46,'15:50 até 16:40',3),(47,47,'16:40 até 17:30',3),(48,48,'17:30 até 18:20',3),(49,49,'18:30 até 19:10',3),(50,50,'19:10 até 19:50',3),(51,51,'20:00 até 20:40',3),(52,52,'20:40 até 21:20',3),(53,53,'21:20 até 22:00',3),(54,54,'22:00 até 22:40',3),(55,55,'7:00 até 07:50',4),(56,56,'7:50 até 08:40',4),(57,57,'9:00 até 09:50',4),(58,58,'9:50 até 10:40',4),(59,59,'10:40 até 11:30',4),(60,60,'11:30 até 12:20',4),(61,61,'13:00 até 13:50',4),(62,62,'13:50 até 14:40',4),(63,63,'14:40 até 15:30',4),(64,64,'15:50 até 16:40',4),(65,65,'16:40 até 17:30',4),(66,66,'17:30 até 18:20',4),(67,67,'18:30 até 19:10',4),(68,68,'19:10 até 19:50',4),(69,69,'20:00 até 20:40',4),(70,70,'20:40 até 21:20',4),(71,71,'21:20 até 22:00',4),(72,72,'22:00 até 22:40',4),(73,73,'7:00 até 07:50',5),(74,74,'7:50 até 08:40',5),(75,75,'9:00 até 09:50',5),(76,76,'9:50 até 10:40',5),(77,77,'10:40 até 11:30',5),(78,78,'11:30 até 12:20',5),(79,79,'13:00 até 13:50',5),(80,80,'13:50 até 14:40',5),(81,81,'14:40 até 15:30',5),(82,82,'15:50 até 16:40',5),(83,83,'16:40 até 17:30',5),(84,84,'17:30 até 18:20',5),(85,85,'18:30 até 19:10',5),(86,86,'19:10 até 19:50',5),(87,87,'20:00 até 20:40',5),(88,88,'20:40 até 21:20',5),(89,89,'21:20 até 22:00',5),(90,90,'22:00 até 22:40',5),(91,91,'7:00 até 07:50',6),(92,92,'7:50 até 08:40',6),(93,93,'9:00 até 09:50',6),(94,94,'9:50 até 10:40',6),(95,95,'10:40 até 11:30',6),(96,96,'11:30 até 12:20',6);
/*!40000 ALTER TABLE `tempo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_local`
--

DROP TABLE IF EXISTS `tipo_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_local` (
  `id_tipo_local` bigint NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_local`
--

LOCK TABLES `tipo_local` WRITE;
/*!40000 ALTER TABLE `tipo_local` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turma` (
  `id_turma` bigint NOT NULL,
  `nome` varchar(45) NOT NULL,
  `ano_inicio` varchar(4) NOT NULL,
  `semestre_inicio` varchar(1) NOT NULL,
  `curso_id` bigint NOT NULL,
  `ensino_id` bigint NOT NULL,
  `turno_id` bigint NOT NULL,
  `etapa_serie_id` bigint NOT NULL,
  `ativo` tinyint NOT NULL,
  PRIMARY KEY (`id_turma`),
  KEY `fk_turma_curso_idx` (`curso_id`),
  KEY `fk_ensino_curso_idx` (`ensino_id`),
  KEY `fk_turno_curso_idx` (`turno_id`),
  KEY `fk_etapa_curso_idx` (`etapa_serie_id`),
  CONSTRAINT `fk_turma_curso` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id_curso`),
  CONSTRAINT `fk_turma_ensino` FOREIGN KEY (`ensino_id`) REFERENCES `ensino` (`id_ensino`),
  CONSTRAINT `fk_turma_etapa_serie` FOREIGN KEY (`etapa_serie_id`) REFERENCES `etapa_serie` (`id_etapa_serie`),
  CONSTRAINT `fk_turma_turno` FOREIGN KEY (`turno_id`) REFERENCES `turno` (`id_turno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
INSERT INTO `turma` VALUES (1,'1350','2023','1',1,2,3,3,1),(2,'1250','2023','2',1,2,3,2,1);
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno`
--

DROP TABLE IF EXISTS `turno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turno` (
  `id_turno` bigint NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_turno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno`
--

LOCK TABLES `turno` WRITE;
/*!40000 ALTER TABLE `turno` DISABLE KEYS */;
INSERT INTO `turno` VALUES (1,'Matutino '),(2,'Vespertino '),(3,'Noturno '),(4,'Integral');
/*!40000 ALTER TABLE `turno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` bigint NOT NULL AUTO_INCREMENT,
  `cpf` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `data_expiracao` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'77777777777','brunotorresprofessor@gmail.com','Alexandre Administrador','$2a$10$q/tVg3Ch0WpdNOWBzzSO7.1JLjGNTIthPzQX8449q0urVXS5KZqiC',NULL),(2,'88888888888','brunotorresprofessor2@gmail.com','Emiliano Coordenador','$2a$10$q/tVg3Ch0WpdNOWBzzSO7.1JLjGNTIthPzQX8449q0urVXS5KZqiC',NULL),(3,'99999999999','brunotorresprofessor3@gmail.com','Bruno Professor','$2a$10$q/tVg3Ch0WpdNOWBzzSO7.1JLjGNTIthPzQX8449q0urVXS5KZqiC',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_permissao`
--

DROP TABLE IF EXISTS `usuario_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_permissao` (
  `usuario_id_usuario` bigint NOT NULL,
  `permissao_id_permissao` bigint NOT NULL,
  PRIMARY KEY (`usuario_id_usuario`,`permissao_id_permissao`),
  KEY `fk_usuario_permissao_permissao` (`permissao_id_permissao`),
  KEY `fk_usuario_permissao_usuario` (`usuario_id_usuario`),
  CONSTRAINT `fk_usuario_permissao_permissao` FOREIGN KEY (`permissao_id_permissao`) REFERENCES `permissao` (`id_permissao`),
  CONSTRAINT `fk_usuario_permissao_usuario` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_permissao`
--

LOCK TABLES `usuario_permissao` WRITE;
/*!40000 ALTER TABLE `usuario_permissao` DISABLE KEYS */;
INSERT INTO `usuario_permissao` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `usuario_permissao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-10 20:27:41
