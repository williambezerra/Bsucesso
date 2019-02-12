CREATE DATABASE  IF NOT EXISTS `bsucesso` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bsucesso`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bsucesso
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao` (
  `idavaliacao` int(11) NOT NULL AUTO_INCREMENT,
  `nota1` int(11) DEFAULT NULL,
  `nota2` int(11) DEFAULT NULL,
  `nota3` int(11) DEFAULT NULL,
  `nota4` int(11) DEFAULT NULL,
  `nota5` int(11) DEFAULT NULL,
  `ipavaliador` varchar(45) DEFAULT NULL,
  `fkproduto` int(11) NOT NULL,
  PRIMARY KEY (`idavaliacao`),
  KEY `fkproduto_avaliacao_idx` (`fkproduto`),
  CONSTRAINT `fkproduto_avaliacao` FOREIGN KEY (`fkproduto`) REFERENCES `produto` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog` (
  `idblog` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL,
  `conteudo` longtext NOT NULL,
  `lickimagem1blog` varchar(45) NOT NULL,
  `lickvendablog` varchar(45) NOT NULL,
  `fklogin` int(11) NOT NULL,
  PRIMARY KEY (`idblog`),
  KEY `blog_login_idx` (`fklogin`),
  CONSTRAINT `blog_login` FOREIGN KEY (`fklogin`) REFERENCES `login` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nmcategoria` varchar(50) NOT NULL,
  `descategoria` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'SAúDE E ESPORTE','TUDO RELACIONADO A DIETAS, TREINAMENTO FISICOS, ESPORTES GERAL, CONDICIONAMENTO FISICO, DENTRE OUTROS'),(2,'FINANCAS E INVESTIMENTOS','SAÚDE FINANCEIRA, CONTROLE DA GASTOS, NOVOS INVETIMENTOS, DINHEIRO FACÍL, COMO GANHAR DINHEIRO'),(3,'DESENVOLVIMENTO PESSOAL',''),(4,'MEU NEGÓCIO','');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `idlogin` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `senha` varchar(128) NOT NULL,
  `nivel` int(11) NOT NULL,
  `imgusu` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'ADMINISTRADOR','ADM',NULL,'9f1967cc78bdfe6748597b7b6628398984538dd77a73610b6e0397965be5d7f30f23bf6c14229ecb2b4375f7d083353f106593482675c73c351043e4202ad762',2,NULL),(3,'WILLIAM BEZERRA DE SOUSA','WILLIAM','','9f1967cc78bdfe6748597b7b6628398984538dd77a73610b6e0397965be5d7f30f23bf6c14229ecb2b4375f7d083353f106593482675c73c351043e4202ad762',2,'fun2.png');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `idproduto` int(11) NOT NULL AUTO_INCREMENT,
  `nmproduto` varchar(45) NOT NULL,
  `sobre` longtext NOT NULL,
  `idioma` varchar(20) NOT NULL,
  `formaacesso` varchar(80) NOT NULL,
  `formato` varchar(80) NOT NULL,
  `emailsuporte` varchar(80) NOT NULL,
  `linkimagem1` varchar(220) NOT NULL,
  `linkimagem2` varchar(220) DEFAULT NULL,
  `linkvideo` varchar(250) DEFAULT NULL,
  `linkvenda` varchar(250) NOT NULL,
  `fkcategoria` int(11) NOT NULL,
  `fklogin` int(11) NOT NULL,
  PRIMARY KEY (`idproduto`,`fkcategoria`,`fklogin`),
  KEY `produto_categoria_idx` (`fkcategoria`),
  KEY `produto_login_idx` (`fklogin`),
  CONSTRAINT `produto_categoria` FOREIGN KEY (`fkcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `produto_login` FOREIGN KEY (`fklogin`) REFERENCES `login` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'NOME','conteudo','IDIOMA','FORMA','forma','EMAIL','bsucesso_preto.png','','https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091','https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091',1,1),(2,'FDDDDDD','conteudo','IDIOMA','FORMA','forma','EMAIL','bsucesso_branco.png','','https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091','https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091',1,1),(3,'MINHA LIBERDADE','<span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">Descubra agora, neste completo treinamento, como conquistar sua liberdade financeira, aumentar sua qualidade de vida e focar no que realmente importa para você. Módulo&nbsp;</span><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">1: Conscientização Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">2: Mudança de Mentalidade Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">3: Mudança de Hábitos Financeiros Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">4: Organização Financeira (teoria) Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">5: Organização Financeira (prática) Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">6: Investimentos Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">7: Renda Fixa Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">8: Renda Variável Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">9: Mentalidade Empreendedora Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">10: Riqueza</span>				</div>',' PORTUGUÊS (BRASIL)','MEMBERSHIP (SITE DE MEMBROS)','Cursos Online, Área de Membros, Serviços de Assinatura','CONTATO@MINHALIBERDADE.COM','05-absolutismo-160919042540-thumbnail-4.jpg',NULL,'https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091','https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091',2,1),(4,'WILLIAM','<span style=\"color: rgb(51, 51, 51); font-family: opensans, helvetica, arial, sans-serif; font-size: 20px; letter-spacing: -0.5px;\">O deputado federal Onyx Lorenzoni (DEM-RS) foi nomeado, nesta segunda-feira (5), ministro extraordinário do governo de transição do presidente eleito&nbsp;</span><a href=\"http://g1.globo.com/politica/politico/jair-bolsonaro.html\" style=\"box-sizing: inherit; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 20px; line-height: inherit; font-family: opensans, helvetica, arial, sans-serif; vertical-align: baseline; color: rgb(196, 23, 12); letter-spacing: -0.5px; background-color: rgb(255, 255, 255);\">Jair Bolsonaro</a><span style=\"color: rgb(51, 51, 51); font-family: opensans, helvetica, arial, sans-serif; font-size: 20px; letter-spacing: -0.5px;\">&nbsp;(PSL). A nomeação, assinada pelo presidente Michel Temer e o ministro Eliseu Padilha, foi publicada na edição desta segunda do&nbsp;</span><a href=\"http://pesquisa.in.gov.br/imprensa/jsp/visualiza/index.jsp?jornal=529&amp;pagina=1&amp;data=05/11/2018\" target=\"_blank\" style=\"box-sizing: inherit; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 20px; line-height: inherit; font-family: opensans, helvetica, arial, sans-serif; vertical-align: baseline; color: rgb(196, 23, 12); letter-spacing: -0.5px; background-color: rgb(255, 255, 255);\">\"Diário Oficial da União\"</a><span style=\"color: rgb(51, 51, 51); font-family: opensans, helvetica, arial, sans-serif; font-size: 20px; letter-spacing: -0.5px;\">.</span>				<div><span style=\"color: rgb(51, 51, 51); font-family: opensans, helvetica, arial, sans-serif; font-size: 20px; letter-spacing: -0.5px;\"><br></span></div><div><div class=\"mc-column content-text active-extra-styles \" data-block-type=\"unstyled\" data-block-weight=\"28\" data-block-id=\"4\" style=\"box-sizing: inherit; margin-right: auto; margin-bottom: 2rem; margin-left: auto; padding-right: 1rem; padding-left: 1rem; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 1.25rem; line-height: 2rem; font-family: opensans, helvetica, arial, sans-serif; vertical-align: baseline; max-width: 42.5rem; width: 680px; float: none; letter-spacing: -0.03125rem; overflow-wrap: break-word; color: rgb(51, 51, 51);\"><p class=\"content-text__container \" data-track-category=\"Link no Texto\" data-track-links=\"\" style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Um dos principais articuladores da candidatura de Bolsonaro e um dos coordenadores da campanha, Onyx Lorenzoni já foi anunciado pelo presidente eleito como futuro chefe da Casa Civil.</p></div><div class=\"mc-column content-text active-extra-styles \" data-block-type=\"unstyled\" data-block-weight=\"44\" data-block-id=\"5\" style=\"box-sizing: inherit; margin-right: auto; margin-bottom: 2rem; margin-left: auto; padding-right: 1rem; padding-left: 1rem; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 1.25rem; line-height: 2rem; font-family: opensans, helvetica, arial, sans-serif; vertical-align: baseline; max-width: 42.5rem; width: 680px; float: none; letter-spacing: -0.03125rem; overflow-wrap: break-word; color: rgb(51, 51, 51);\"><p class=\"content-text__container \" data-track-category=\"Link no Texto\" data-track-links=\"\" style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Desde que&nbsp;<a href=\"https://g1.globo.com/politica/eleicoes/2018/noticia/2018/10/28/jair-bolsonaro-e-eleito-presidente-e-interrompe-serie-de-vitorias-do-pt.ghtml\" style=\"box-sizing: inherit; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: rgb(196, 23, 12);\">Bolsonaro venceu a eleição presidencial no último domingo (28)</a>, Onyx passou a comandar o processo de transição do novo governo. Na última semana, ele se reuniu quase diariamente com o presidente eleito no Rio de Janeiro, onde Bolsonaro reside com a família.</p></div><div class=\"mc-column content-text active-extra-styles \" data-block-type=\"unstyled\" data-block-weight=\"43\" data-block-id=\"6\" style=\"box-sizing: inherit; margin-right: auto; margin-bottom: 2rem; margin-left: auto; padding-right: 1rem; padding-left: 1rem; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 1.25rem; line-height: 2rem; font-family: opensans, helvetica, arial, sans-serif; vertical-align: baseline; max-width: 42.5rem; width: 680px; float: none; letter-spacing: -0.03125rem; overflow-wrap: break-word; color: rgb(51, 51, 51);\"><p class=\"content-text__container \" data-track-category=\"Link no Texto\" data-track-links=\"\" style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; font: inherit; vertical-align: baseline;\">O futuro presidente poderá indicar até 50 pessoas para cargos temporários na equipe de transição. Entre esses nomes está o de Onyx Lorenzoni, que se licenciará do mandato de deputado a partir do ano que vem para assumir o comando da Casa Civil.</p></div></div>','PORTUGUES','ONLINE',' PDF','SUPORTE@SUPORTE','57a926a443d328bb11c5703787c78189.png',NULL,'https://g1.globo.com/politica/noticia/2018/11/05/onyx-lorenzoni-e-nomeado-ministro-extraordinario-de-bolsonaro.ghtml','https://g1.globo.com/politica/noticia/2018/11/05/onyx-lorenzoni-e-nomeado-ministro-extraordinario-de-bolsonaro.ghtml',2,1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-20 19:20:55
