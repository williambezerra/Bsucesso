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
  `titulo` varchar(200) NOT NULL,
  `conteudo` longtext NOT NULL,
  `linckimagem1blog` longtext NOT NULL,
  `linckvendablog` longtext,
  `fklogin` int(11) NOT NULL,
  PRIMARY KEY (`idblog`),
  KEY `blog_login_idx` (`fklogin`),
  CONSTRAINT `blog_login` FOREIGN KEY (`fklogin`) REFERENCES `login` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'NOVO ARTIGO','<SPAN STYLE=\"COLOR: RGB(226, 60, 0); FONT-FAMILY: BITTER, GEORGIA, SERIF; FONT-SIZE: 1.9EM; FONT-WEIGHT: INHERIT;\">APRESENTAÇÃO</SPAN><BR><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">TRANSFORMAR SUAS</SPAN><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">&NBSP;</SPAN><EM STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: INHERIT; FONT-SIZE: 18PX; FONT-WEIGHT: INHERIT; TEXT-ALIGN: JUSTIFY; BORDER: 0PX; OUTLINE: 0PX; VERTICAL-ALIGN: BASELINE;\">TAGS</EM><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">&NBSP;</SPAN><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">TEXTAREA EM UM EDITOR WEB JÁ NÃO É UMA TAREFA COMPLICADA. DENTRE OS VÁRIOS EDITORES QUE VOCÊ PODE ENCONTRAR NA INTERNET, VAMOS VER O USO DO CKEDITOR. VEJA O EDITOR EM AÇÃO NESTE</SPAN><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">&NBSP;</SPAN><A HREF=\"HTTP://CKEDITOR.COM/DEMO\" TARGET=\"_BLANK\" STYLE=\"FONT-FAMILY: INHERIT; FONT-SIZE: 18PX; FONT-WEIGHT: INHERIT; TEXT-ALIGN: JUSTIFY; BACKGROUND-COLOR: RGB(255, 255, 255); BORDER: 0PX; FONT-STYLE: INHERIT; OUTLINE: 0PX; VERTICAL-ALIGN: BASELINE; COLOR: RGB(226, 60, 0); TRANSITION: ALL 0.2S EASE-IN-OUT 0S;\">DEMO</A><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">.</SPAN><BR><SPAN STYLE=\"COLOR: RGB(226, 60, 0); FONT-FAMILY: BITTER, GEORGIA, SERIF; FONT-SIZE: 1.9EM; FONT-WEIGHT: INHERIT;\">INSTALAÇÃO</SPAN><BR><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">BAIXE O CKEDITOR EM</SPAN><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">&NBSP;</SPAN><A HREF=\"HTTP://CKEDITOR.COM/DOWNLOAD\" TARGET=\"_BLANK\" STYLE=\"FONT-FAMILY: INHERIT; FONT-SIZE: 18PX; FONT-WEIGHT: INHERIT; TEXT-ALIGN: JUSTIFY; BACKGROUND-COLOR: RGB(255, 255, 255); BORDER: 0PX; FONT-STYLE: INHERIT; OUTLINE: 0PX; VERTICAL-ALIGN: BASELINE; COLOR: RGB(226, 60, 0); TRANSITION: ALL 0.2S EASE-IN-OUT 0S;\">HTTP://CKEDITOR.COM/DOWNLOAD</A><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">. A VERSÃO UTILIZADA NESTE POST FOI 3.6.4, DE 17 JUL 2012. EXTRAIA O ARQUIVO</SPAN><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">&NBSP;</SPAN><EM STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: INHERIT; FONT-SIZE: 18PX; FONT-WEIGHT: INHERIT; TEXT-ALIGN: JUSTIFY; BORDER: 0PX; OUTLINE: 0PX; VERTICAL-ALIGN: BASELINE;\">CKEDITOR_3.6.4.ZIP</EM><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">&NBSP;</SPAN><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">JUNTO A SUA APLICAÇÃO. UMA PASTA</SPAN><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">&NBSP;</SPAN><EM STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: INHERIT; FONT-SIZE: 18PX; FONT-WEIGHT: INHERIT; TEXT-ALIGN: JUSTIFY; BORDER: 0PX; OUTLINE: 0PX; VERTICAL-ALIGN: BASELINE;\">CKEDITOR</EM><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">&NBSP;</SPAN><SPAN STYLE=\"COLOR: RGB(51, 51, 51); FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; TEXT-ALIGN: JUSTIFY;\">SERÁ CRIADA. PRONTO, AGORA BASTA FAZER A CHAMADA DENTRO DO SEU CÓDIGO-FONTE!</SPAN><BR><SPAN STYLE=\"COLOR: RGB(226, 60, 0); FONT-FAMILY: BITTER, GEORGIA, SERIF; FONT-SIZE: 1.9EM; FONT-WEIGHT: INHERIT;\">INTEGRAÇÃO</SPAN><BR><P STYLE=\"BORDER: 0PX; FONT-FAMILY: &QUOT;SOURCE SANS PRO&QUOT;, HELVETICA, ARIAL, SANS-SERIF; FONT-SIZE: 18PX; MARGIN-TOP: 0PX; MARGIN-BOTTOM: 27PX; OUTLINE: 0PX; VERTICAL-ALIGN: BASELINE; TEXT-ALIGN: JUSTIFY; COLOR: RGB(51, 51, 51);\">O CKEDITOR É UMA APLICAÇÃO JAVASCRIPT. PARA LÊ-LO, BASTA FAZER UMA SIMPLES CHAMADA PARA ELE DENTRO DAS&NBSP;<EM STYLE=\"BORDER: 0PX; FONT-FAMILY: INHERIT; FONT-WEIGHT: INHERIT; OUTLINE: 0PX; VERTICAL-ALIGN: BASELINE;\">TAGS</EM>&NBSP;HEAD DO SEU CÓDIGO-FONTE. FEITO ISTO, A API JAVASCRIPT DO CKEDITOR JÁ ESTARÁ PRONTA PARA SER UTILIZADA. LEMBRE-SE DE AJUSTAR O CAMINHO DO ARQUIVO&NBSP;<EM STYLE=\"BORDER: 0PX; FONT-FAMILY: INHERIT; FONT-WEIGHT: INHERIT; OUTLINE: 0PX; VERTICAL-ALIGN: BASELINE;\">CKEDITOR.JS</EM>&NBSP;PARA O DIRETÓRIO EM QUE FOI DESCOMPACTADO.</P>				','tecnologias-e-esportes-978x653.jpg','',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'ADMINISTRADOR','ADM',NULL,'9f1967cc78bdfe6748597b7b6628398984538dd77a73610b6e0397965be5d7f30f23bf6c14229ecb2b4375f7d083353f106593482675c73c351043e4202ad762',2,NULL),(3,'WILLIAM BEZERRA DE SOUSA','WILLIAM','','9f1967cc78bdfe6748597b7b6628398984538dd77a73610b6e0397965be5d7f30f23bf6c14229ecb2b4375f7d083353f106593482675c73c351043e4202ad762',2,'fun2.png'),(4,'SISSISDANDO DO CARMO DIAS','DIAS','','9f1967cc78bdfe6748597b7b6628398984538dd77a73610b6e0397965be5d7f30f23bf6c14229ecb2b4375f7d083353f106593482675c73c351043e4202ad762',1,'p3.jpg');
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
  `linkimagem1` longtext NOT NULL,
  `linkimagem2` longtext,
  `linkvideo` longtext,
  `linkvenda` longtext NOT NULL,
  `linkpgproduto` longtext,
  `fkcategoria` int(11) NOT NULL,
  `fklogin` int(11) NOT NULL,
  PRIMARY KEY (`idproduto`,`fkcategoria`,`fklogin`),
  KEY `produto_categoria_idx` (`fkcategoria`),
  KEY `produto_login_idx` (`fklogin`),
  CONSTRAINT `produto_categoria` FOREIGN KEY (`fkcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `produto_login` FOREIGN KEY (`fklogin`) REFERENCES `login` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'NOME','conteudo','IDIOMA','FORMA','forma','EMAIL','bsucesso_preto.png','','https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091','https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091',NULL,1,1),(2,'FDDDDDD','conteudo','IDIOMA','FORMA','forma','EMAIL','bsucesso_branco.png','','https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091','https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091',NULL,1,1),(3,'MINHA LIBERDADE','<span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">Descubra agora, neste completo treinamento, como conquistar sua liberdade financeira, aumentar sua qualidade de vida e focar no que realmente importa para você. Módulo&nbsp;</span><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">1: Conscientização Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">2: Mudança de Mentalidade Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">3: Mudança de Hábitos Financeiros Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">4: Organização Financeira (teoria) Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">5: Organização Financeira (prática) Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">6: Investimentos Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">7: Renda Fixa Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">8: Renda Variável Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">9: Mentalidade Empreendedora Módulo&nbsp;</span></div><div><span style=\"color: rgb(52, 58, 66); font-family: &quot;Nunito Sans&quot;, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; font-size: 16px; background-color: rgb(250, 251, 252);\">10: Riqueza</span>				</div>',' PORTUGUÊS (BRASIL)','MEMBERSHIP (SITE DE MEMBROS)','Cursos Online, Área de Membros, Serviços de Assinatura','CONTATO@MINHALIBERDADE.COM','05-absolutismo-160919042540-thumbnail-4.jpg',NULL,'https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091','https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091',NULL,2,1),(4,'WILLIAM','<span style=\"color: rgb(51, 51, 51); font-family: opensans, helvetica, arial, sans-serif; font-size: 20px; letter-spacing: -0.5px;\">O deputado federal Onyx Lorenzoni (DEM-RS) foi nomeado, nesta segunda-feira (5), ministro extraordinário do governo de transição do presidente eleito&nbsp;</span><a href=\"http://g1.globo.com/politica/politico/jair-bolsonaro.html\" style=\"box-sizing: inherit; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 20px; line-height: inherit; font-family: opensans, helvetica, arial, sans-serif; vertical-align: baseline; color: rgb(196, 23, 12); letter-spacing: -0.5px; background-color: rgb(255, 255, 255);\">Jair Bolsonaro</a><span style=\"color: rgb(51, 51, 51); font-family: opensans, helvetica, arial, sans-serif; font-size: 20px; letter-spacing: -0.5px;\">&nbsp;(PSL). A nomeação, assinada pelo presidente Michel Temer e o ministro Eliseu Padilha, foi publicada na edição desta segunda do&nbsp;</span><a href=\"http://pesquisa.in.gov.br/imprensa/jsp/visualiza/index.jsp?jornal=529&amp;pagina=1&amp;data=05/11/2018\" target=\"_blank\" style=\"box-sizing: inherit; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: 700; font-stretch: inherit; font-size: 20px; line-height: inherit; font-family: opensans, helvetica, arial, sans-serif; vertical-align: baseline; color: rgb(196, 23, 12); letter-spacing: -0.5px; background-color: rgb(255, 255, 255);\">\"Diário Oficial da União\"</a><span style=\"color: rgb(51, 51, 51); font-family: opensans, helvetica, arial, sans-serif; font-size: 20px; letter-spacing: -0.5px;\">.</span>				<div><span style=\"color: rgb(51, 51, 51); font-family: opensans, helvetica, arial, sans-serif; font-size: 20px; letter-spacing: -0.5px;\"><br></span></div><div><div class=\"mc-column content-text active-extra-styles \" data-block-type=\"unstyled\" data-block-weight=\"28\" data-block-id=\"4\" style=\"box-sizing: inherit; margin-right: auto; margin-bottom: 2rem; margin-left: auto; padding-right: 1rem; padding-left: 1rem; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 1.25rem; line-height: 2rem; font-family: opensans, helvetica, arial, sans-serif; vertical-align: baseline; max-width: 42.5rem; width: 680px; float: none; letter-spacing: -0.03125rem; overflow-wrap: break-word; color: rgb(51, 51, 51);\"><p class=\"content-text__container \" data-track-category=\"Link no Texto\" data-track-links=\"\" style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Um dos principais articuladores da candidatura de Bolsonaro e um dos coordenadores da campanha, Onyx Lorenzoni já foi anunciado pelo presidente eleito como futuro chefe da Casa Civil.</p></div><div class=\"mc-column content-text active-extra-styles \" data-block-type=\"unstyled\" data-block-weight=\"44\" data-block-id=\"5\" style=\"box-sizing: inherit; margin-right: auto; margin-bottom: 2rem; margin-left: auto; padding-right: 1rem; padding-left: 1rem; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 1.25rem; line-height: 2rem; font-family: opensans, helvetica, arial, sans-serif; vertical-align: baseline; max-width: 42.5rem; width: 680px; float: none; letter-spacing: -0.03125rem; overflow-wrap: break-word; color: rgb(51, 51, 51);\"><p class=\"content-text__container \" data-track-category=\"Link no Texto\" data-track-links=\"\" style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; font: inherit; vertical-align: baseline;\">Desde que&nbsp;<a href=\"https://g1.globo.com/politica/eleicoes/2018/noticia/2018/10/28/jair-bolsonaro-e-eleito-presidente-e-interrompe-serie-de-vitorias-do-pt.ghtml\" style=\"box-sizing: inherit; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: rgb(196, 23, 12);\">Bolsonaro venceu a eleição presidencial no último domingo (28)</a>, Onyx passou a comandar o processo de transição do novo governo. Na última semana, ele se reuniu quase diariamente com o presidente eleito no Rio de Janeiro, onde Bolsonaro reside com a família.</p></div><div class=\"mc-column content-text active-extra-styles \" data-block-type=\"unstyled\" data-block-weight=\"43\" data-block-id=\"6\" style=\"box-sizing: inherit; margin-right: auto; margin-bottom: 2rem; margin-left: auto; padding-right: 1rem; padding-left: 1rem; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 1.25rem; line-height: 2rem; font-family: opensans, helvetica, arial, sans-serif; vertical-align: baseline; max-width: 42.5rem; width: 680px; float: none; letter-spacing: -0.03125rem; overflow-wrap: break-word; color: rgb(51, 51, 51);\"><p class=\"content-text__container \" data-track-category=\"Link no Texto\" data-track-links=\"\" style=\"box-sizing: inherit; margin-top: 0px; margin-bottom: 0px; border: 0px; font: inherit; vertical-align: baseline;\">O futuro presidente poderá indicar até 50 pessoas para cargos temporários na equipe de transição. Entre esses nomes está o de Onyx Lorenzoni, que se licenciará do mandato de deputado a partir do ano que vem para assumir o comando da Casa Civil.</p></div></div>','PORTUGUES','ONLINE',' PDF','SUPORTE@SUPORTE','57a926a443d328bb11c5703787c78189.png',NULL,'https://g1.globo.com/politica/noticia/2018/11/05/onyx-lorenzoni-e-nomeado-ministro-extraordinario-de-bolsonaro.ghtml','https://g1.globo.com/politica/noticia/2018/11/05/onyx-lorenzoni-e-nomeado-ministro-extraordinario-de-bolsonaro.ghtml',NULL,2,1),(5,'CORRIDA LEGAL','<p style=\"margin: 0px auto; padding: 5px; font-size: 16px; font-family: Lato, sans-serif; color: rgb(0, 0, 0); text-align: justify;\"><span style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif; line-height: 1.6em;\">A necessidade de uma ferramenta que nos possibilita fazer diversos tipos de edição de texto vai muito além do Word ou Open Office para computador, esta necessidade alcança as páginas WEB.</span></p><p style=\"margin: 0px auto; padding: 5px; font-size: 16px; font-family: Lato, sans-serif; color: rgb(0, 0, 0); text-align: justify;\">Você já ouviu falar em&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">WYSIWYG?</strong>&nbsp;Acho que não! Pois bem, ele é um acrônimo para \"<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">W</strong>hat&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">Y</strong>ou&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">S</strong>ee&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">I</strong>s&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">W</strong>hat&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">Y</strong>ou&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">G</strong>et\", traduzindo para o nosso amado português seria algo como, “O que você vê é o que você quer”. &nbsp;Este acrônimo faz referência aos editores de texto, pois conforme você vai formatando o texto, já pode ir conferindo o resultado em tempo real.</p><p style=\"margin: 0px auto; padding: 5px; font-size: 16px; font-family: Lato, sans-serif; color: rgb(0, 0, 0); text-align: justify;\">A parte teórica nós já sabemos, mas caso queira se aprofundar mais, recomendo que confira os links de referência no final da página.</p><p style=\"margin: 0px auto; padding: 5px; font-size: 16px; font-family: Lato, sans-serif; color: rgb(0, 0, 0); text-align: justify;\">Atualmente existem vários editores&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">WYSIWYG</strong>&nbsp;disponíveis para download, inclusive aqui no SatellaSoft foi disponibilizado um modelo totalmente gratuito, você pode conferir em:&nbsp;<a href=\"http://satellasoft.com/?materia=simples-wysiwyg-editor\" target=\"_blank\" style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">http://satellasoft.com/?materia=simples-wysiwyg-editor</a>.</p><p style=\"margin: 0px auto; padding: 5px; font-size: 16px; font-family: Lato, sans-serif; color: rgb(0, 0, 0); text-align: justify;\"><img src=\"https://i.imgur.com/8tBs4Pb.jpg\" width=\"1092\"><br></p>				','PORTUGUES','ONLINE',' PDF','CONTATO@MINHALIBERDADE.COM','tecnologias-e-esportes-978x653.jpg',NULL,'https://www.satellasoft.com/?materia=transformando-textarea-em-um-editor-de-texto-com-ckeditor','https://globoesporte.globo.com/',NULL,1,3),(6,'AQUAMAN','				<div class=\"titlebar \" style=\"box-sizing: border-box; margin-bottom: 0.625rem; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><h2 class=\"titlebar-title titlebar-title-md\" style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: 1.5rem; display: inline-block; color: rgb(51, 51, 51); font-family: montserratSemiBold, Arial, sans-serif; text-transform: uppercase;\">SINOPSE E DETALHES</h2></div><div class=\"certificate\" style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><span class=\"certificate-text\" style=\"box-sizing: border-box; display: block; margin-bottom: 0.625rem; font-weight: 700;\">Não recomendado para menores de 12 anos</span></div><div class=\"content-txt \" itemprop=\"description\" style=\"box-sizing: border-box; font-size: 1rem; line-height: 1.4; margin-bottom: 1.25rem; color: rgb(51, 51, 51); font-family: Arial, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Filho do humano Tom Curry (Temuera Morrison) com a atlante Atlanna (Nicole Kidman), Arthur Curry (Jason Momoa) cresce com a vivência de um humano e as capacidades metahumanas de um atlante. Quando seu irmão Orm (Patrick Wilson) deseja se tornar o Mestre dos Oceanos, subjugando os demais reinos aquáticos para que possa atacar a superfície, cabe a Arthur a tarefa de impedir a guerra iminente. Para tanto, ele recebe a ajuda de Mera (Amber Heard), princesa de um dos reinos, e o apoio de Vulko (Willem Dafoe), que o treinou secretamente desde a adolescência.</div><img src=\"https://i.imgur.com/LjqLqQk.jpg\" width=\"1092\">','INGLES','ONLINE','video aulas','AQUAMAM@AQUAM.COM.BR','maxresdefault (2).jpg',NULL,'wYqyWgUPEqw','http://www.adorocinema.com/filmes/filme-208692/',NULL,4,3);
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

-- Dump completed on 2018-12-17 18:59:46
