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
  `dtpublica` varchar(10) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `conteudo` longtext NOT NULL,
  `linckimagem1blog` longtext NOT NULL,
  `linckvendablog` longtext,
  `fklogin` int(11) NOT NULL,
  PRIMARY KEY (`idblog`),
  KEY `blog_login_idx` (`fklogin`),
  CONSTRAINT `blog_login` FOREIGN KEY (`fklogin`) REFERENCES `login` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'2018/05/01','NOVO ARTIGO','<H3 STYLE=\"BOX-SIZING: BORDER-BOX; MARGIN: 0PX 0PX 10PX; PADDING: 0PX; FONT-FAMILY: RUDA, SANS-SERIF; LINE-HEIGHT: 24PX; COLOR: #696E74;\">OL&AACUTE; PESSOAL</H3>\n<H3 STYLE=\"BOX-SIZING: BORDER-BOX; MARGIN: 0PX 0PX 10PX; PADDING: 0PX; FONT-FAMILY: RUDA, SANS-SERIF; LINE-HEIGHT: 24PX; COLOR: #696E74;\">O BIBLIOTECA DE SUCESSO FOI CRIADO PARA AUXILIAR PESSOAS NA AQUISI&CCEDIL;&ATILDE;O DE CURSOS E TREINAMENTOS ONLINE, VISTO QUE, O GRANDE CRESCIMENTO DO SEGUIMENTO DIGITAL AUMENTOU DE FORMAS EXTREMANTE SIGNIFICATIVAS E MUITO POSITIVA.</H3>','tecnologias-e-esportes-978x653.jpg','',3),(2,'2018/12/28','O QUE E O BIBLIOTECA DE SUCESSO!','<H3 STYLE=\"BOX-SIZING: BORDER-BOX; MARGIN: 0PX 0PX 10PX; PADDING: 0PX; FONT-FAMILY: RUDA, SANS-SERIF; LINE-HEIGHT: 24PX; COLOR: #696E74;\">OL&AACUTE; PESSOAL</H3>\r\n<H3 STYLE=\"BOX-SIZING: BORDER-BOX; MARGIN: 0PX 0PX 10PX; PADDING: 0PX; FONT-FAMILY: RUDA, SANS-SERIF; LINE-HEIGHT: 24PX; COLOR: #696E74;\">O BIBLIOTECA DE SUCESSO FOI CRIADO PARA AUXILIAR PESSOAS NA AQUISI&CCEDIL;&ATILDE;O DE CURSOS E TREINAMENTOS ONLINE, VISTO QUE, O GRANDE CRESCIMENTO DO SEGUIMENTO DIGITAL AUMENTOU DE FORMAS EXTREMANTE SIGNIFICATIVAS E MUITO POSITIVA.</H3>\r\n<H3 STYLE=\"BOX-SIZING: BORDER-BOX; MARGIN: 0PX 0PX 10PX; PADDING: 0PX; FONT-FAMILY: RUDA, SANS-SERIF; LINE-HEIGHT: 24PX; COLOR: #696E74;\">O MERCADO ATUAL CONTA COM MILHARES DE CURSOS E TREINAMENTO EM TODAS A &AACUTE;REAS QUE VOC&ECIRC; POSSA IMAGINAR. &EACUTE; DEVIDO ESTA GAMA DE OP&CCEDIL;&OTILDE;ES QUE O BIBLIOTECA DE SUCESSO SE POSICIONA PARA DAR UMA &LDQUO;M&ATILDE;OZINHA&RDQUO; NAS SUAS ESCOLHAS, E QUE ESSAS ESCOLHAS SEJAM AS MELHORES POSS&IACUTE;VEL PARA QUE VOC&ECIRC; CONSIGA CHEGAR NOS SEUS OBJETIVOS SEJA ELE PESSOAL OU PROFISSIONAL OU OS DOIS, POR QUE N&ATILDE;O?</H3>\r\n<H3 STYLE=\"BOX-SIZING: BORDER-BOX; MARGIN: 0PX 0PX 10PX; PADDING: 0PX; FONT-FAMILY: RUDA, SANS-SERIF; LINE-HEIGHT: 24PX; COLOR: #696E74;\">NOSSA EQUIPE FILTRA OS MELHORES CURSOS E TREINAMENTOS DIGITAIS DISPON&IACUTE;VEL EM PLATAFORMAS E PARCEIROS PARA QUE OS RENDIMENTOS QUE VOC&ECIRC; ALMEJA SEJA OS MELHORES POSS&IACUTE;VEIS.</H3>\r\n<H3 STYLE=\"BOX-SIZING: BORDER-BOX; MARGIN: 0PX 0PX 10PX; PADDING: 0PX; FONT-FAMILY: RUDA, SANS-SERIF; LINE-HEIGHT: 24PX; COLOR: #696E74;\">ENT&ATILDE;O MEUS AMIGOS (AS), &LDQUO;SEJA UMA VERS&ATILDE;O MELHOR DE VOC&ECIRC;. AGORA! &RDQUO;.</H3>','maxresdefault (6).jpg','http://www.adorocinema.com/filmes/filme-208692/',3),(3,'2019/01/12','8 ETAPAS DA RIQUEZA: QUEM PASSOU POR ELAS, ENRIQUECEU!','<P><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\">EXISTE ALGO EM COMUM ENTRE AS PESSOAS QUE SA&IACUTE;RAM DE UMA CONDI&CCEDIL;&ATILDE;O DE VIDA SIMPLES E ALCAN&CCEDIL;ARAM A INDEPEND&ECIRC;NCIA FINANCEIRA: TODAS, SEM EXCE&CCEDIL;&ATILDE;O, TIVERAM QUE PASSAR PELAS 8 ETAPAS QUE EU TE CONTO NESTE V&IACUTE;DEO. SE AT&EACUTE; HOJE VOC&ECIRC; ACHAVA QUE S&OACUTE; A SORTE ERA CAPAZ DE TIRAR UMA PESSOA DA &LDQUO;VIDA COMUM&RDQUO; J&AACUTE; TE AVISO&HELLIP; ESTE V&IACUTE;DEO PODE DOER! D&OACUTE;I NO COME&CCEDIL;O, MAS DEPOIS VOC&ECIRC; PERCEBE O QUANTO APRENDEU! SE VOC&ECIRC; N&ATILDE;O QUER FICAR NEM MAIS UM DIA PERDENDO DINHEIRO NO BANCO, ABRA A SUA CONTA NA MODAL MAIS, A CORRETORA DE VALORES QUE ACREDITA NA EDUCA&CCEDIL;&ATILDE;O FINANCEIRA. ABRA SUA CONTA DE GRA&CCEDIL;A NA MODALMAIS, A CORRETORA 100% ONLINE QUE APOIA A EDUCA&CCEDIL;&ATILDE;O FINANCEIRA NO BRASIL: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?EVENT=VIDEO_DESCRIPTION&AMP;V=NGAWQDUE32I&AMP;REDIR_TOKEN=CGH8-4PJUR7IHEU0IAML6WH6JCF8MTU0NZM5NZYWMKAXNTQ3MZEXMJAY&AMP;Q=HTTP%3A%2F%2FBIT.DO%2FEXB6Q\" REL=\"NOFOLLOW\">HTTP://BIT.DO/EXB6Q</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> --- * ASSINE O CANAL!* E SAIBA COMO ECONOMIZAR E MULTIPLICAR O SEU DINHEIRO O ANO TODO: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?EVENT=VIDEO_DESCRIPTION&AMP;V=NGAWQDUE32I&AMP;REDIR_TOKEN=CGH8-4PJUR7IHEU0IAML6WH6JCF8MTU0NZM5NZYWMKAXNTQ3MZEXMJAY&AMP;Q=HTTPS%3A%2F%2FGOO.GL%2FJQ6APF\" REL=\"NOFOLLOW\">HTTPS://GOO.GL/JQ6APF</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> CADASTRE O SEU E-MAIL E RECEBA O CONTE&UACUTE;DO MAIS RICO DO BRASIL! </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?EVENT=VIDEO_DESCRIPTION&AMP;V=NGAWQDUE32I&AMP;REDIR_TOKEN=CGH8-4PJUR7IHEU0IAML6WH6JCF8MTU0NZM5NZYWMKAXNTQ3MZEXMJAY&AMP;Q=HTTPS%3A%2F%2FGOO.GL%2FWS455V\" REL=\"NOFOLLOW\">HTTPS://GOO.GL/WS455V</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> BAIXE NOSSOS MATERIAIS EXCLUSIVOS E DE GRA&CCEDIL;A: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?EVENT=VIDEO_DESCRIPTION&AMP;V=NGAWQDUE32I&AMP;REDIR_TOKEN=CGH8-4PJUR7IHEU0IAML6WH6JCF8MTU0NZM5NZYWMKAXNTQ3MZEXMJAY&AMP;Q=HTTPS%3A%2F%2FGOO.GL%2FVKZ4YZ\" REL=\"NOFOLLOW\">HTTPS://GOO.GL/VKZ4YZ</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> PRA MAIS DICAS DE ENRIQUECIMENTO L&IACUTE;CITO, CONSUMO CONSCIENTE, PECHINCHAS E ECONOMIA SIMPLIFICADA ACESSE A HOME. DICAS EM TEXTOS QUE VOC&ECIRC; ENTENDE: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?EVENT=VIDEO_DESCRIPTION&AMP;V=NGAWQDUE32I&AMP;REDIR_TOKEN=CGH8-4PJUR7IHEU0IAML6WH6JCF8MTU0NZM5NZYWMKAXNTQ3MZEXMJAY&AMP;Q=HTTP%3A%2F%2FWWW.MEPOUPENAWEB.COM\" REL=\"NOFOLLOW\">HTTP://WWW.MEPOUPENAWEB.COM</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> INSTAGRAM: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?EVENT=VIDEO_DESCRIPTION&AMP;V=NGAWQDUE32I&AMP;REDIR_TOKEN=CGH8-4PJUR7IHEU0IAML6WH6JCF8MTU0NZM5NZYWMKAXNTQ3MZEXMJAY&AMP;Q=HTTP%3A%2F%2FINSTAGRAM.COM%2FNATHALIAARCURI\" REL=\"NOFOLLOW\">HTTP://INSTAGRAM.COM/NATHALIAARCURI</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> (DICAS DI&AACUTE;RIAS) FACEBOOK: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?EVENT=VIDEO_DESCRIPTION&AMP;V=NGAWQDUE32I&AMP;REDIR_TOKEN=CGH8-4PJUR7IHEU0IAML6WH6JCF8MTU0NZM5NZYWMKAXNTQ3MZEXMJAY&AMP;Q=HTTP%3A%2F%2FFACEBOOK.COM.BR%2FMEPOUPENAWEB\" REL=\"NOFOLLOW\">HTTP://FACEBOOK.COM.BR/MEPOUPENAWEB</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> TWITTER: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?EVENT=VIDEO_DESCRIPTION&AMP;V=NGAWQDUE32I&AMP;REDIR_TOKEN=CGH8-4PJUR7IHEU0IAML6WH6JCF8MTU0NZM5NZYWMKAXNTQ3MZEXMJAY&AMP;Q=HTTP%3A%2F%2FWWW.TWITTER.COM%2FNATHALIAARCURI\" REL=\"NOFOLLOW\">HTTP://WWW.TWITTER.COM/NATHALIAARCURI</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> OU&CCEDIL;A O ME POUPE 89! TOCANDO O TERROR NA SUA VIDA FINANCEIRA TODAS AS SEGUNDAS - &AGRAVE;S 9HS DA MANH&ATILDE; NA R&AACUTE;DIO ROCK: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?EVENT=VIDEO_DESCRIPTION&AMP;V=NGAWQDUE32I&AMP;REDIR_TOKEN=CGH8-4PJUR7IHEU0IAML6WH6JCF8MTU0NZM5NZYWMKAXNTQ3MZEXMJAY&AMP;Q=HTTPS%3A%2F%2FGOO.GL%2F37KFRP\" REL=\"NOFOLLOW\">HTTPS://GOO.GL/37KFRP</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> TEM MAIS D&UACUTE;VIDA? COMENTE AQUI OU MANDE EMAIL! D&UACUTE;VIDAS: CONTATO@MEPOUPENAWEB.COM COMERCIAL: ATENDIMENTO@MEPOUPENAWEB.COM CAIXA POSTAL: 28235 CEP: 01234-970 RECEBA AS NOSSAS MENSAGENS ATRAV&EACUTE;S DO TELEGRAM: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?EVENT=VIDEO_DESCRIPTION&AMP;V=NGAWQDUE32I&AMP;REDIR_TOKEN=CGH8-4PJUR7IHEU0IAML6WH6JCF8MTU0NZM5NZYWMKAXNTQ3MZEXMJAY&AMP;Q=HTTP%3A%2F%2FT.ME%2FMEPOUPENAWEB\" REL=\"NOFOLLOW\">HTTP://T.ME/MEPOUPENAWEB</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> GOSTOU DO V&IACUTE;DEO? CURTA, COMPARTILHA E ASSINE O CANAL PRA N&ATILDE;O PERDER O QUE VEM POR AI! ENRIQUECER FAZ PARTE DA VIDA! SONHE, MUDE DE ATITUDE, CUIDE DO SEU DINHEIRO E SEJA FELIZ! ASSINE O CANAL DE GRA&CCEDIL;A E RECEBA AS DICAS DE FINAN&CCEDIL;AS SEM FRESCURA TODA SEMANA!</SPAN></P>','maxresdefault (5).jpg','',1),(4,'2019-01-12','TOP 4 INVESTIMENTOS MELHORES QUE A POUPANÇA! CDB, LCI, LCA E… ISSO NINGUÉM TE CONTA','<P><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\">ESTE ANO O BRASILEIRO VAI DEIXAR DE GANHAR MAIS DE 6 BILH&OTILDE;ES DE REAIS POR DEIXAR O DINHEIRO NA POUPAN&CCEDIL;A. SIM, &EACUTE; VERDADE. ESSE DINHEIRO PODERIA ESTAR RENDENDO MUITO MAIS E COM GANHOS GARANTIDOS ACIMA DA POUPAN&CCEDIL;A. DEIXA A NATH (EU, NO CASO) TE CONTAR UMA COISA, MAS PROMETE QUE N&ATILDE;O DIZ QUE FUI QUE TE CONTEI, T&AACUTE;? EXISTEM DEZENAS DE CDBS ESPALHADOS POR A&IACUTE;, VOC&ECIRC; SABIA? ALGUNS DELES CHEGAM A RENDER 50% A MAIS QUE A POUPAN&CCEDIL;A! E SABE POR QUE O SEU BANCO S&OACUTE; TE OFERECE O MESMO CDB FRAQUINHO? PORQUE ELE S&OACUTE; TEM UM! A&IACUTE; PARECE QUE A POUPAN&CCEDIL;A &EACUTE; MELHOR DO QUE QUALQUER OUTRO INVESTIMENTO E ISSO &EACUTE; ILUS&ATILDE;O! NESSE V&IACUTE;DEO EU TE MOSTRO DE UM JEITO BEM SIMPLES QUAIS S&ATILDE;O OS INVESTIMENTOS QUE EU PEGO QUANDO QUERO SEGURAN&CCEDIL;A SEM ABRIR M&ATILDE;O DE GANHAR MAIS DINHEIRO QUE NA POUPAN&CCEDIL;A. HOJE VOC&ECIRC; VAI APRENDER TUDO SOBRE LCI, LCA, CDB E TESOURO DIRETO (O QUERIDINHO DA NATH), OS INVESTIMENTOS MAIS SIMPLES QUE SUBSTITUEM A POUPAN&CCEDIL;A PRA PROJETOS COMO A RESERVA DE EMERG&ECIRC;NCIA, O CASAMENTO, A COMPRA DO CARRO, DA CASA, DA APOSENTADORIA E MUITO MAIS. QUER MAIS V&IACUTE;DEOS SOBRE ESSE ASSUNTO? SE INSCREVE NO CANAL E COMENTA AQUI EMBAIXO SOBRE QUAL DELES VOC&ECIRC; QUER SABER MAIS! SE ESSE V&IACUTE;DEO TE ABRIU OS OLHOS, COMPARTILHA COM TODO MUNDO QUE TAMB&EACUTE;M PRECISA DESSE COL&IACUTE;RIO DA RIQUEZA! A GENTE PRECISA CONTAR PRA TODO MUNDO QUE ISSO EXISTE! ABRA SUA CONTA NA MODALMAIS DE GRA&CCEDIL;A DE QUALQUER LUGAR DO PA&IACUTE;S COM ESTE LINK: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?V=UQXU26FJQKQ&AMP;EVENT=VIDEO_DESCRIPTION&AMP;REDIR_TOKEN=-VWLTH6WXD6XYPM04D_NN1CMEKD8MTU0NZQWNJIXNKAXNTQ3MZE5ODE2&AMP;Q=HTTP%3A%2F%2FCLICKY.ME%2FMEPOUPE\" REL=\"NOFOLLOW\">HTTP://CLICKY.ME/MEPOUPE</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> --- * ASSINE O CANAL!* E SAIBA COMO ECONOMIZAR E MULTIPLICAR O SEU DINHEIRO O ANO TODO! CADASTRE O SEU E-MAIL E RECEBA O CONTE&UACUTE;DO MAIS RICO DO BRASIL! </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?V=UQXU26FJQKQ&AMP;EVENT=VIDEO_DESCRIPTION&AMP;REDIR_TOKEN=-VWLTH6WXD6XYPM04D_NN1CMEKD8MTU0NZQWNJIXNKAXNTQ3MZE5ODE2&AMP;Q=HTTPS%3A%2F%2FGOO.GL%2FWS455V\" REL=\"NOFOLLOW\">HTTPS://GOO.GL/WS455V</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> PRA MAIS DICAS DE ENRIQUECIMENTO L&IACUTE;CITO, CONSUMO CONSCIENTE, PECHINCHAS E ECONOMIA SIMPLIFICADA ACESSE A HOME. DICAS EM TEXTOS QUE VOC&ECIRC; ENTENDE: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?V=UQXU26FJQKQ&AMP;EVENT=VIDEO_DESCRIPTION&AMP;REDIR_TOKEN=-VWLTH6WXD6XYPM04D_NN1CMEKD8MTU0NZQWNJIXNKAXNTQ3MZE5ODE2&AMP;Q=HTTP%3A%2F%2FWWW.MEPOUPENAWEB.COM\" REL=\"NOFOLLOW\">HTTP://WWW.MEPOUPENAWEB.COM</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> INSTAGRAM: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?V=UQXU26FJQKQ&AMP;EVENT=VIDEO_DESCRIPTION&AMP;REDIR_TOKEN=-VWLTH6WXD6XYPM04D_NN1CMEKD8MTU0NZQWNJIXNKAXNTQ3MZE5ODE2&AMP;Q=HTTP%3A%2F%2FINSTAGRAM.COM%2FNATHALIAARCURI\" REL=\"NOFOLLOW\">HTTP://INSTAGRAM.COM/NATHALIAARCURI</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> (DICAS DI&AACUTE;RIAS) FACEBOOK: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?V=UQXU26FJQKQ&AMP;EVENT=VIDEO_DESCRIPTION&AMP;REDIR_TOKEN=-VWLTH6WXD6XYPM04D_NN1CMEKD8MTU0NZQWNJIXNKAXNTQ3MZE5ODE2&AMP;Q=HTTP%3A%2F%2FFACEBOOK.COM.BR%2FMEPOUPENAWEB\" REL=\"NOFOLLOW\">HTTP://FACEBOOK.COM.BR/MEPOUPENAWEB</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> TWITTER: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?V=UQXU26FJQKQ&AMP;EVENT=VIDEO_DESCRIPTION&AMP;REDIR_TOKEN=-VWLTH6WXD6XYPM04D_NN1CMEKD8MTU0NZQWNJIXNKAXNTQ3MZE5ODE2&AMP;Q=HTTP%3A%2F%2FWWW.TWITTER.COM%2FNATHALIAARCURI\" REL=\"NOFOLLOW\">HTTP://WWW.TWITTER.COM/NATHALIAARCURI</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> OU&CCEDIL;A O ME POUPE 89! TOCANDO O TERROR NA SUA VIDA FINANCEIRA TODAS AS SEGUNDAS - AS 9HS DA MANH&ATILDE; NA R&AACUTE;DIO ROCK: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?V=UQXU26FJQKQ&AMP;EVENT=VIDEO_DESCRIPTION&AMP;REDIR_TOKEN=-VWLTH6WXD6XYPM04D_NN1CMEKD8MTU0NZQWNJIXNKAXNTQ3MZE5ODE2&AMP;Q=HTTP%3A%2F%2FWWW.RADIOROCK.COM.BR%2FME-POUPE\" REL=\"NOFOLLOW\">HTTP://WWW.RADIOROCK.COM.BR/ME-POUPE</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> TEM MAIS D&UACUTE;VIDA? COMENTE AQUI OU MANDE EMAIL! D&UACUTE;VIDAS: CONTATO@MEPOUPENAWEB.COM COMERCIAL: ATENDIMENTO@MEPOUPENAWEB.COM CAIXA POSTAL: 28235 CEP: 01234-970 RECEBA AS NOSSAS MENSAGENS ATRAV&EACUTE;S DO TELEGRAM: </SPAN><A CLASS=\"YT-SIMPLE-ENDPOINT STYLE-SCOPE YT-FORMATTED-STRING\" STYLE=\"TEXT-DECORATION-LINE: NONE; DISPLAY: INLINE-BLOCK; CURSOR: POINTER; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\" SPELLCHECK=\"FALSE\" HREF=\"HTTPS://WWW.YOUTUBE.COM/REDIRECT?V=UQXU26FJQKQ&AMP;EVENT=VIDEO_DESCRIPTION&AMP;REDIR_TOKEN=-VWLTH6WXD6XYPM04D_NN1CMEKD8MTU0NZQWNJIXNKAXNTQ3MZE5ODE2&AMP;Q=HTTP%3A%2F%2FT.ME%2FMEPOUPENAWEB\" REL=\"NOFOLLOW\">HTTP://T.ME/MEPOUPENAWEB</A><SPAN STYLE=\"COLOR: #0A0A0A; FONT-FAMILY: ROBOTO, ARIAL, SANS-SERIF; WHITE-SPACE: PRE-WRAP;\"> GOSTOU DO V&IACUTE;DEO? CURTA, COMPARTILHA E ASSINE O CANAL PRA N&ATILDE;O PERDER O QUE VEM POR AI! ENRIQUECER FAZ PARTE DA VIDA! SONHE, MUDE DE ATITUDE, CUIDE DO SEU DINHEIRO E SEJA FELIZ! ASSINE O CANAL DE GRA&CCEDIL;A E RECEBA AS DICAS DE FINAN&CCEDIL;AS SEM FRESCURA TODA SEMANA!</SPAN></P>','XX-sinais-que-você-está-perdendo-dinheiro-com-seu-marketing-digital (1).png','',3),(21,'2019-02-12','NINHO DO URUBU PASSA POR VISTORIA PARA APURAR SUPOSTAS IRREGULARIDADES','<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; line-height: 24px; text-align: justify;\"><span style=\"color: #696e74; font-family: Ruda, sans-serif;\">Autoridades realizam uma inspe&ccedil;&atilde;o no centro de treinamento do Flamengo, o Ninho do Urubu, na manh&atilde; desta ter&ccedil;a-feira (12), para definir se h&aacute; necessidade de interdi&ccedil;&atilde;o. O Corpo de Bombeiros e a Prefeitura do Rio chegaram ao local antes das 10h. A Pol&iacute;cia Civil e o Minist&eacute;rio do Trabalho tamb&eacute;m participam. O objetivo &eacute; apurar poss&iacute;veis irregularidades no local, onde dez garotos morreram e outros tr&ecirc;s ficaram feridos em um inc&ecirc;ndio na &uacute;ltima sexta-feira (8).</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; line-height: 24px; text-align: justify;\"><span style=\"color: #696e74; font-family: Ruda, sans-serif;\">O caso est&aacute; sendo investigado pela 42&ordf;DP (Recreio dos Bandeirantes). Os investigadores devem ouvir os depoimentos de funcion&aacute;rios do Flamengo que estavam no local na hora do inc&ecirc;ndio. O gerente de patrim&ocirc;nio do clube e outros tr&ecirc;s profissionais devem falar aos policiais. A expectativa &eacute; que eles esclare&ccedil;am quais eram as equipes que prestavam servi&ccedil;os ao Ninho do Urubu e sobre as condi&ccedil;&otilde;es das instala&ccedil;&otilde;es.</span></p>','montagem.jpg','https://g1.globo.com/rj/rio-de-janeiro/noticia/2019/02/12/ninho-do-urubu-deve-passar-por-vistoria-nessa-terca-feira3.ghtml',3),(22,'2019-02-13','Toyota lançará carro híbrido com motor flex no Brasil até o final do ano','<p style=\"text-align: justify;\">A Toyota vai lan&ccedil;ar o primeiro carro h&iacute;brido com motor flex no Brasil no &uacute;ltimo trimestre deste ano. A confirma&ccedil;&atilde;o foi feita pelo presidente-executivo da montadora na Am&eacute;rica Latina, Steve St. Angelo, nesta ter&ccedil;a-feira (12), em S&atilde;o Paulo.</p>\r\n<p style=\"text-align: justify;\">O executivo n&atilde;o confirmou qual modelo ser&aacute; o respons&aacute;vel por estrear a tecnologia. O favorit&iacute;ssimo ao posto &eacute; o sed&atilde; Corolla, cuja nova gera&ccedil;&atilde;o chega tamb&eacute;m neste ano.</p>\r\n<p style=\"text-align: justify;\">Desde o in&iacute;cio do ano passado a fabricante japonesa testa um Prius com a tecnologia que usa um motor el&eacute;trico e outro a combust&atilde;o, que pode ser abastecido com gasolina ou etanol.</p>','toyota-corolla-xse-88-030f0290088a05db.jpg','',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'SAúDE E ESPORTE','TUDO RELACIONADO A DIETAS, TREINAMENTO FISICOS, ESPORTES GERAL, CONDICIONAMENTO FISICO, DENTRE OUTROS'),(2,'FINANCAS E INVESTIMENTOS','SAÚDE FINANCEIRA, CONTROLE DA GASTOS, NOVOS INVETIMENTOS, DINHEIRO FACÍL, COMO GANHAR DINHEIRO'),(3,'DESENVOLVIMENTO PESSOAL','BUSCA PELA MELHOR VERSÃO DE VOCÊ MESMO'),(4,'MEU NEGÓCIO','EMPREEDIMENTOS INDIVIDUAIS E OUTROS'),(5,'NUTRIÇÃO','DIETAS FIT, E MAIS');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `idcomentarios` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `email` varchar(100) NOT NULL,
  `conteudo` varchar(200) NOT NULL,
  `fkartigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcomentarios`,`nome`,`email`,`conteudo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `idposts` int(11) NOT NULL AUTO_INCREMENT,
  `linkimage` varchar(200) NOT NULL,
  `fkcategoria` int(11) NOT NULL,
  PRIMARY KEY (`idposts`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'que-as-criancas-sirvam-de-inspiracao.jpg',3),(2,'frases-de-academia-mensagens-de-motivacao-e-dedicacao-11.jpg',1),(3,'e36488eef6d9b4943be69b9bc58fd731.png',1),(4,'Frases-Sobre-Nutrição-e-Alimentação-7.jpg',5),(5,'Frases-Sobre-Nutrição-e-Alimentação-3.jpg',5),(6,'frases-de-academia-mensagens-de-motivacao-e-dedicacao-6.jpg',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
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
  `destaque` int(11) NOT NULL,
  `avaliacaoB` longtext,
  `fkcategoria` int(11) NOT NULL,
  `fklogin` int(11) NOT NULL,
  PRIMARY KEY (`idproduto`,`fkcategoria`,`fklogin`),
  KEY `produto_categoria_idx` (`fkcategoria`),
  KEY `produto_login_idx` (`fklogin`),
  CONSTRAINT `produto_categoria` FOREIGN KEY (`fkcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `produto_login` FOREIGN KEY (`fklogin`) REFERENCES `login` (`idlogin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (2,'FDDDDDD',' conteudo\r\n				','IDIOMA','FORMA','forma','EMAIL','maxresdefault (2).jpg','','https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091','https://app-vlc.hotmart.com/products/view/38d5ca7b-3c88-4382-a2ad-1092db6c9091',NULL,1,NULL,1,3),(4,'WILLIAM','<p style=\"text-align: left;\"><span style=\"color: #333333; font-family: opensans, helvetica, arial, sans-serif; font-size: 20px; letter-spacing: -0.5px;\">O deputado federal Onyx Lorenzoni (DEM-RS) foi nomeado, nesta segunda-feira (5), ministro extraordin&aacute;rio do governo de transi&ccedil;&atilde;o do presidente eleito&nbsp;</span><a style=\"box-sizing: inherit; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 20px; line-height: inherit; font-family: opensans, helvetica, arial, sans-serif; vertical-align: baseline; color: #c4170c; letter-spacing: -0.5px; background-color: #ffffff;\" href=\"http://g1.globo.com/politica/politico/jair-bolsonaro.html\">Jair Bolsonaro</a><span style=\"color: #333333; font-family: opensans, helvetica, arial, sans-serif; font-size: 20px; letter-spacing: -0.5px;\">&nbsp;(PSL). A nomea&ccedil;&atilde;o, assinada pelo presidente Michel Temer e o ministro Eliseu Padilha, foi publicada na edi&ccedil;&atilde;o desta segunda do&nbsp;</span><a style=\"box-sizing: inherit; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: bold; font-stretch: inherit; font-size: 20px; line-height: inherit; font-family: opensans, helvetica, arial, sans-serif; vertical-align: baseline; color: #c4170c; letter-spacing: -0.5px; background-color: #ffffff;\" href=\"http://pesquisa.in.gov.br/imprensa/jsp/visualiza/index.jsp?jornal=529&amp;pagina=1&amp;data=05/11/2018\" target=\"_blank\" rel=\"noopener\">\"Di&aacute;rio Oficial da Uni&atilde;o\"</a><span style=\"color: #333333; font-family: opensans, helvetica, arial, sans-serif; font-size: 20px; letter-spacing: -0.5px;\">.</span></p>\r\n<h3 style=\"text-align: left;\"><span style=\"font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; color: #333333; letter-spacing: -0.03125rem;\">Um dos principais articuladores da candidatura de Bolsonaro e um dos coordenadores da campanha, Onyx Lorenzoni j&aacute; foi anunciado pelo presidente eleito como futuro chefe da Casa Civil.</span></h3>\r\n<h3 style=\"text-align: left;\"><span style=\"font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; color: #333333; letter-spacing: -0.03125rem;\">D</span><span style=\"font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; color: #333333; letter-spacing: -0.03125rem;\">esde que </span><a style=\"box-sizing: inherit; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #c4170c;\" href=\"https://g1.globo.com/politica/eleicoes/2018/noticia/2018/10/28/jair-bolsonaro-e-eleito-presidente-e-interrompe-serie-de-vitorias-do-pt.ghtml\">Bolsonaro venceu a elei&ccedil;&atilde;o presidencial no &uacute;ltimo domingo (28)</a><span style=\"font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; color: #333333; letter-spacing: -0.03125rem;\">, Onyx passou a comandar o processo de transi&ccedil;&atilde;o do novo governo. Na &uacute;ltima semana, ele se reuniu quase diariamente com o presidente eleito no Rio de Janeiro, onde Bolsonaro reside com a fam&iacute;lia.</span></h3>\r\n<h3 style=\"text-align: left;\"><span style=\"font-family: inherit; font-size: inherit; font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; color: #333333; letter-spacing: -0.03125rem;\">O futuro presidente poder&aacute; indicar at&eacute; 50 pessoas para cargos tempor&aacute;rios na equipe de transi&ccedil;&atilde;o. Entre esses nomes est&aacute; o de Onyx Lorenzoni, que se licenciar&aacute; do mandato de deputado a partir do ano que vem para assumir o comando da Casa Civil.</span></h3>','PORTUGUES','ONLINE',' PDF','SUPORTE@SUPORTE','maxresdefault (4).jpg',NULL,'https://g1.globo.com/politica/noticia/2018/11/05/onyx-lorenzoni-e-nomeado-ministro-extraordinario-de-bolsonaro.ghtml','https://g1.globo.com/politica/noticia/2018/11/05/onyx-lorenzoni-e-nomeado-ministro-extraordinario-de-bolsonaro.ghtml',NULL,1,NULL,2,3),(5,'CORRIDA LEGAL','<p style=\"margin: 0px auto; padding: 5px; font-size: 16px; font-family: Lato, sans-serif; color: rgb(0, 0, 0); text-align: justify;\"><span style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif; line-height: 1.6em;\">A necessidade de uma ferramenta que nos possibilita fazer diversos tipos de edição de texto vai muito além do Word ou Open Office para computador, esta necessidade alcança as páginas WEB.</span></p><p style=\"margin: 0px auto; padding: 5px; font-size: 16px; font-family: Lato, sans-serif; color: rgb(0, 0, 0); text-align: justify;\">Você já ouviu falar em&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">WYSIWYG?</strong>&nbsp;Acho que não! Pois bem, ele é um acrônimo para \"<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">W</strong>hat&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">Y</strong>ou&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">S</strong>ee&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">I</strong>s&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">W</strong>hat&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">Y</strong>ou&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">G</strong>et\", traduzindo para o nosso amado português seria algo como, “O que você vê é o que você quer”. &nbsp;Este acrônimo faz referência aos editores de texto, pois conforme você vai formatando o texto, já pode ir conferindo o resultado em tempo real.</p><p style=\"margin: 0px auto; padding: 5px; font-size: 16px; font-family: Lato, sans-serif; color: rgb(0, 0, 0); text-align: justify;\">A parte teórica nós já sabemos, mas caso queira se aprofundar mais, recomendo que confira os links de referência no final da página.</p><p style=\"margin: 0px auto; padding: 5px; font-size: 16px; font-family: Lato, sans-serif; color: rgb(0, 0, 0); text-align: justify;\">Atualmente existem vários editores&nbsp;<strong style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">WYSIWYG</strong>&nbsp;disponíveis para download, inclusive aqui no SatellaSoft foi disponibilizado um modelo totalmente gratuito, você pode conferir em:&nbsp;<a href=\"http://satellasoft.com/?materia=simples-wysiwyg-editor\" target=\"_blank\" style=\"margin-right: auto; margin-left: auto; font-size: 1em; font-family: Lato, sans-serif;\">http://satellasoft.com/?materia=simples-wysiwyg-editor</a>.</p><p style=\"margin: 0px auto; padding: 5px; font-size: 16px; font-family: Lato, sans-serif; color: rgb(0, 0, 0); text-align: justify;\"><img src=\"https://i.imgur.com/8tBs4Pb.jpg\" width=\"1092\"><br></p>				','PORTUGUES','ONLINE',' PDF','CONTATO@MINHALIBERDADE.COM','maxresdefault (2).jpg',NULL,'https://www.satellasoft.com/?materia=transformando-textarea-em-um-editor-de-texto-com-ckeditor','https://globoesporte.globo.com/',NULL,1,NULL,1,3),(6,'AQUAMAN - O Rei dos mares','<h1>SINOPSE E DETALHES</h1>\r\n<div class=\"certificate\" style=\"box-sizing: border-box; color: #000000; font-family: Arial, sans-serif; font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\"><span class=\"certificate-text\" style=\"box-sizing: border-box; display: block; margin-bottom: 0.625rem; font-weight: bold;\">N&atilde;o recomendado para menores de 12 anos</span></div>\r\n<h3 style=\"text-align: justify;\">Filho do humano Tom Curry (Temuera Morrison) com a atlante Atlanna (Nicole Kidman), Arthur Curry (Jason Momoa) cresce com a viv&ecirc;ncia de um humano e as capacidades metahumanas de um atlante. Quando seu irm&atilde;o Orm (Patrick Wilson) deseja se tornar o Mestre dos Oceanos, subjugando os demais reinos aqu&aacute;ticos para que possa atacar a superf&iacute;cie, cabe a Arthur a tarefa de impedir a guerra iminente. Para tanto, ele recebe a ajuda de Mera (Amber Heard), princesa de um dos reinos, e o apoio de Vulko (Willem Dafoe), que o treinou secretamente desde a adolesc&ecirc;ncia.</h3>\r\n<p>&nbsp;</p>','INGLES-PORTUGUES','ONLINE - PDF','video aulas - PDF','AQUAMAM@AQUAM.COM.US','maxresdefault (2).jpg',NULL,'WWWWWWW','WWWWWWWWWWW',NULL,1,NULL,4,3),(7,'FORMAÇÃO DE ESPECIALISTA EM e-SOCIAL','<div align=\"justify\"><span style=\"font-family: arial; font-size: large;\"><span style=\"color: #343a42; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"><span style=\"font-size: x-large;\"><strong>NOVA TURMA | FORMA&Ccedil;&Atilde;O DE ESPECIALISTA EM ESOCIAL</strong> </span><br /></span></span></div>\r\n<div align=\"justify\"><span style=\"font-family: arial; font-size: large;\"><span style=\"color: #343a42; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;</span></span></div>\r\n<div align=\"justify\"><span style=\"font-family: arial; font-size: large;\"><span style=\"color: #343a42; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Com esta Forma&ccedil;&atilde;o voc&ecirc; ter&aacute; mais CONHECIMENTO e SEGURAN&Ccedil;A quanto &agrave; aplica&ccedil;&atilde;o das regras Trabalhistas e Previdenci&aacute;rias exigidas no eSocial, tornando-se um profissional COMPLETO e INSUBSTITU&Iacute;VEL! Al&eacute;m disso, tenha crescimento e reconhecimento profissional, atualiza&ccedil;&atilde;o de seu curr&iacute;culo e ainda receba conte&uacute;dos do que h&aacute; de mais ATUALIZADO sobre o eSocial! FORMA&Ccedil;&Atilde;O MAIS COMPLETA DO MERCADO, com mais de 3.500 alunos inscritos - 17 M&oacute;dulos - Mais de 450 aulas - B&ocirc;nus Exclusivos - Grupos de Estudos - Suporte e Atualiza&ccedil;&atilde;o de acordo com mudan&ccedil;as do eSocial - Acesso por 01 ano - Certificado de Conclus&atilde;o de 60h - Reconhecido pela ABED</span></span></div>','PORTUGUÊS (BRASIL)','MEMBERSHIP (SITE DE MEMBROS)','Cursos Online, Área de Membros, Serviços de Assinatura','CONTATO@NITH.COM.BR','maxresdefault (3).jpg',NULL,'VBCLfcjHgpg','https://cursoesocial.com.br/?ref=U7458705F',NULL,2,NULL,3,3),(8,'BRUMADINHO: EXAMES DETECTAM EXCESSO DE METAIS','<p>Exames realizados em bombeiros que trabalham nas buscas por corpos de desaparecidos em Brumadinho, detectaram a presen&ccedil;a de metais em n&iacute;veis acima do recomendado por amostra, de acordo com nota do governo do estado de Minas Gerais.</p>\r\n<p>At&eacute; o momento tr&ecirc;s exames detectaram a altera&ccedil;&atilde;o na quantidade de alum&iacute;nio no sangue. Um quarto exame apontou a presen&ccedil;a de cobre. O governo garante que a altera&ccedil;&atilde;o n&atilde;o significa uma intoxica&ccedil;&atilde;o aguda pelos dois tipos de metais e os bombeiros n&atilde;o apresentam nenhum sintoma adverso.</p>\r\n<p>Ainda segundo a assessoria do executivo estadual, os profissionais n&atilde;o foram afastados dos trabalhos, apenas n&atilde;o est&atilde;o mais em contato direto com a lama. Espera-se que com a interrup&ccedil;&atilde;o da exposi&ccedil;&atilde;o, os n&iacute;veis no sangue sejam normalizados.</p>\r\n<p><strong>1-</strong> O monitoramento de metais tamb&eacute;m tem sido feito no leito do rio Paraopeba e tamb&eacute;m em amostra da lama de rejeitos. A a&ccedil;&atilde;o faz parte de um conjunto de medidas para resguardar a sa&uacute;de da popula&ccedil;&atilde;o e dos envolvidos nas buscas. A barragem da mina C&oacute;rrego do Feij&atilde;o se rompeu no dia 25 de janeiro. De acordo com o &uacute;ltimo boletim da Defesa Civil, 169 mortes foram confirmadas. Outras 141 pessoas est&atilde;o desaparecidas.</p>','PORTUGUÊS (BRASIL)','ONLINE','Cursos Online, Área de Membros, Serviços de Assinatura','CONTATO@NITH.COM.BR','filmes-2016.jpg',NULL,'','https://g1.globo.com/mg/minas-gerais/noticia/2019/02/20/brumadinho-exames-detectam-excesso-de-metais-no-organismo-de-quatro-bombeiros-que-trabalham-nas-buscas.ghtml',NULL,1,'<p>Mais um analise para voc&ecirc;s, nossos companheiros embusca do sucesso.</p>\r\n<p>vamos ao que interessa, o curso asssim demominado pelo seu produtor oferece varias tecnicas excluisivas para que voce possa iniciar no mudos dos investimentos,&eacute; voce&nbsp; nao precisa ser nenhum especialista.&nbsp;</p>\r\n<p>A necessidade e querer adquirir o conhecimento para que todas as tecnicas j&aacute; modeladas por aquel que obtiveram resultados positivos.</p>\r\n<p>Vamos deixar bem claro, e sempre estamos alertando a todos sobre a necessidade de adquirir conheciemento, n&atilde;o existem produtos milagrosos mais sim estr&aacute;tegias modeladas e encurtamento do caminho para que voce aprenda o que realmete interessa para chegar ate resultados iguais ou melhor que os obtidos pelos produtores.</p>\r\n<p><em><strong>O veredido:</strong></em></p>\r\n<p>o curso e bem completo, o material oferecido conta com videos, pdfs e tira duvidas em um canal exclusivo para membros, e o BIBLIOTECA DE SUCESSO recomenda o curso para aqueles que realmente querem se destacar e realemento obter resultados positivos sem iluss&atilde;o.</p>\r\n<p><em><strong>\"Sacrificio baixo, resultados baixo!\"</strong></em></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>',5,3);
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

-- Dump completed on 2019-02-23 17:03:04
