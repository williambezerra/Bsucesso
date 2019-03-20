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
  `nota` varchar(1) NOT NULL,
  `ipavaliador` varchar(45) DEFAULT NULL,
  `fkproduto` int(11) NOT NULL,
  PRIMARY KEY (`idavaliacao`),
  KEY `fkproduto_avaliacao_idx` (`fkproduto`),
  CONSTRAINT `fkproduto_avaliacao` FOREIGN KEY (`fkproduto`) REFERENCES `produto` (`idproduto`)
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
  CONSTRAINT `blog_login` FOREIGN KEY (`fklogin`) REFERENCES `login` (`idlogin`)
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'ANIMAIS E PLANTAS','CORES: MARROM, TUDO PARA CUIDADOS, TRATAMENTOS E ORIENTAÇÕES'),(2,'APPS E SOFTWARE','AZUL CLARO'),(3,'CASA E CONSTRUÇÃO','MARROM, DICAS PARA SUA CASA, PARA OBRAS E REFORMAS DENTRE OUTROS'),(4,'CULINÁRIA E GASTRONOMIA',''),(5,'DESENVOLVIMENTO PESSOAL',''),(6,'DESIGN',''),(7,'DIREITO',''),(8,'ECOLOGIA E MEIO AMBIENTE',''),(9,'EDUCACIONAL',''),(10,'ENTRETENIMENTO',''),(11,'ESPIRITUALIDADE',''),(12,'FINANÇAS E INVESTIMENTOS',''),(13,'GERAL – MEU NEGÓCIO',''),(14,'HOBBIES',''),(15,'IDIOMAS',''),(16,'MODA E BELEZA',''),(17,'MÚSICA E ARTES',''),(18,'NEGÓCIOS E CARREIRA',''),(19,'RELACIONAMENTOS',''),(20,'SAÚDE E ESPORTES',''),(21,'SEXUALIDADE',''),(22,'TECNOLOGIA DA INFORMAÇÃO','');
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
  `data` date NOT NULL,
  `fkartigo` int(11) NOT NULL,
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
-- Table structure for table `inscricao`
--

DROP TABLE IF EXISTS `inscricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inscricao` (
  `idinscricao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `email` varchar(100) NOT NULL,
  `interesse` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idinscricao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscricao`
--

LOCK TABLES `inscricao` WRITE;
/*!40000 ALTER TABLE `inscricao` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscricao` ENABLE KEYS */;
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
INSERT INTO `login` VALUES (1,'Bsucesso','BSUCESSO','','c2dbc5ddbc8e1f850a7095d4ff6c5957644f69f4d0116f5f1c35d7423e492fcba20f171fc8d46c4c39ce80dff721bd2747f6c8f9236753f71780f0c731e7adfe',2,'fun2.png');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
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
  `valor` varchar(10) NOT NULL,
  `destaque` int(11) NOT NULL,
  `avaliacaoB` longtext,
  `fkcategoria` int(11) NOT NULL,
  `fklogin` int(11) NOT NULL,
  PRIMARY KEY (`idproduto`,`fkcategoria`,`fklogin`),
  KEY `produto_categoria_idx` (`fkcategoria`),
  KEY `produto_login_idx` (`fklogin`),
  CONSTRAINT `produto_categoria` FOREIGN KEY (`fkcategoria`) REFERENCES `categoria` (`idcategoria`),
  CONSTRAINT `produto_login` FOREIGN KEY (`fklogin`) REFERENCES `login` (`idlogin`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'BISCOITOS NATURAIS PARA CACHORROS','<h2>Alegria e Sa&uacute;de Para Seu C&atilde;o</h2>\r\n<p style=\"text-align: justify;\">&middot;&nbsp; &nbsp; &nbsp; &nbsp; S&oacute; voc&ecirc; mesmo sabe a alegria que o seu c&atilde;o fica toda vez que voc&ecirc; entrega um petisco para ele, por&eacute;m se voc&ecirc; d&aacute; petiscos industrializados para ele, voc&ecirc; est&aacute; literalmente minando a sa&uacute;de do seu c&atilde;ozinho.</p>\r\n<p style=\"text-align: justify;\">&middot;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Agora voc&ecirc; pode unir os dois, a alegria do seu c&atilde;o em receber um petisco e dando mais sa&uacute;de a ele, produzindo seus pr&oacute;prios Biscoitos 100% Saud&aacute;veis</p>\r\n<h2>Porque Voc&ecirc; Deveria Fazer Biscoitos Saud&aacute;veis Para Seu Cachorro</h2>\r\n<p style=\"text-align: justify;\">&middot;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Isso porque a maioria das receitas s&atilde;o ricas em fibras e cont&eacute;m uma diversidade grande de vitaminas, que melhora consideravelmente a sa&uacute;de do c&atilde;o.</p>\r\n<p style=\"text-align: justify;\">&middot;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Praticamente todos os petiscos industrializados que vemos por a&iacute; precisam de corantes e conservantes para serem mantidos por bastante tempo nas prateleiras e, isso significa que voc&ecirc; est&aacute; minando a sa&uacute;de do seu c&atilde;o, cada vez que d&aacute; um petisco industrializado</p>\r\n<p style=\"text-align: justify;\">&middot;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;C&atilde;es mais alegres e saud&aacute;veis s&atilde;o menos bagunceiros e mais carinhosos.</p>\r\n<p style=\"text-align: justify;\">Diversos estudos comprovam isso.</p>\r\n<p style=\"text-align: justify;\">&middot;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;E tem mais: estimular a saliva&ccedil;&atilde;o, reduzir o mau h&aacute;lito, eliminar toxinas, regular a glicemia, reduzir n&aacute;useas e gastrites, etc.</p>\r\n<p style=\"text-align: justify;\">Muitas das receitas que voc&ecirc; vai aprender, ajudar&atilde;o a melhorar consideravelmente a sa&uacute;de do seu c&atilde;o.</p>\r\n<p>&nbsp;</p>\r\n<h2>Sua Instrutora Neste Curso</h2>\r\n<p><strong>Carol Dias</strong> &eacute; apaixonada por c&atilde;es e &eacute; tutora da Valentina e da Lisbela.</p>\r\n<p style=\"text-align: justify;\">Apaixonada desde sempre por c&atilde;es e seu universo, Carol Dias, m&atilde;e, publicit&aacute;ria, tutora da Valentina e da Lisbela, se encantou com todos os benef&iacute;cios que uma alimenta&ccedil;&atilde;o natural pode trazer para a vida dos c&atilde;es, ap&oacute;s uma temporada em Londres, onde teve contato pela primeira vez com esta dieta.</p>\r\n<p style=\"text-align: justify;\">Desde ent&atilde;o, o que era algo impens&aacute;vel na vida dela, foi para a cozinha preparar deliciosos biscoitos caseiros para suas cachorrinhas, que hoje recebem uma alimenta&ccedil;&atilde;o 100% natural.</p>\r\n<p style=\"text-align: justify;\">Com poucas habilidades na cozinha, Carol Dias errou muito, testou e aprimorou receitas que hoje fazem sucesso com seus c&atilde;es e todo seu grupo de amigos cachorreiros.</p>\r\n<p>&nbsp;</p>\r\n<h2>&nbsp;Assinado Por Nossa Veterin&aacute;ria</h2>\r\n<p>&nbsp;</p>\r\n<p>Respons&aacute;vel T&eacute;cnica: <strong>Dra. Mariana Godoy - CRMV: 25771</strong></p>\r\n<p>&nbsp;</p>\r\n<p>\"Quando voc&ecirc; alimenta seu cachorro com alimentos saud&aacute;veis, como Biscoitos Saud&aacute;veis, voc&ecirc; d&aacute; a ele a oportunidade de ter uma vida mais longa, saud&aacute;vel e feliz ao seu lado.\"</p>\r\n<p>- Dra Mariana Godoy</p>\r\n<p>&nbsp;</p>\r\n<h2>Super modulos para que voc&ecirc; aprenda TUDOOOO!</h2>\r\n<p><strong>M&oacute;dulo 1:</strong> Cozinhar &eacute; Um ato de Amor</p>\r\n<p><strong>M&oacute;dulo 2:</strong> ​Preparando Sua Base De Conhecimento</p>\r\n<p><strong>M&oacute;dulo 3:</strong> O que voc&ecirc; precisa saber antes de colocar a m&atilde;o na massa</p>\r\n<p><strong>M&oacute;dulo 4:</strong> Receitas de biscoitos para seu c&atilde;o se deliciar</p>\r\n<p><strong>M&oacute;dulo 5:</strong> Receitas de biscoitos para seu c&atilde;o se deliciar</p>','PORTUGUÊS (BRASIL)','MEMBERSHIP (SITE DE MEMBROS)','Cursos Online, Área de Membros, Serviços de Assinatura','CONTATO@CACHORROSINCRIVEIS.COM.BR','biscoitos_cachorros.jpg',NULL,'ZqL_8hHvWp4','https://go.hotmart.com/X12480546D?ap=4767','https://go.hotmart.com/X12480546D?ap=4767','397',2,'<p class=\"MsoNormal\" style=\"text-align: justify;\">Falem meus amigos!</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\">Bom estamos aqui hoje para apresentar um produto muito bacana que est&aacute; de parab&eacute;ns, visto que apresenta uma ideia muito inovadora de como a gente pode alimentar nossos c&atilde;ozinhos.</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\">Nesse curso voc&ecirc; vai aprender variar t&eacute;cnicas e dicas de preparo de alimentos saud&aacute;veis e incr&iacute;veis para seus Pet&rsquo;s.</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\">O mais importante e que temos o acompanhamento de uma profissional veterin&aacute;rias que verifica todas receitas para que nada de ruim aconte&ccedil;a.</p>\r\n<p class=\"MsoNormal\" style=\"text-align: justify;\">&ldquo;seja diferente, fa&ccedil;a a diferen&ccedil;a&rdquo;</p>',1,1),(2,'ACADEMIA DO IMPORTADOR','<h2 style=\"text-align: justify;\">Importar Significa Pagar o Pre&ccedil;o Justo Por Um Produto de Qualidade</h2>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<h3 style=\"text-align: justify;\"><strong>Al&eacute;m de ser uma alternativa para voc&ecirc; fugir do sistema tribut&aacute;rio brasileiro e ainda ter a chance de come&ccedil;ar a empreender</strong></h3>\r\n<p style=\"text-align: justify;\">O mercado americano &eacute; um dos maiores do mundo com uma enorme variedade produtos e, consequentemente, o sistema de vendas online, &eacute; um dos mais avan&ccedil;ados e desenvolvidos. Mesmo n&atilde;o enviando diretamente para o Brasil, &eacute; poss&iacute;vel fazer a compra nas lojas online americana atrav&eacute;s do sistema de direcionamento. E isso &eacute; muito mais simples do que voc&ecirc; imagina e sempre ser&aacute; mais vantajoso importar um produto de marca do que comprar em qualquer loja do Brasil.</p>\r\n<h2 style=\"text-align: justify;\">E N&atilde;o &Eacute; Somente Roupas. &Eacute; Poss&iacute;vel Importar Muitos Outros Produtos Com Desconto Como:</h2>\r\n<p style=\"text-align: justify;\">* BELEZA &amp; EST&Eacute;TICA</p>\r\n<p style=\"text-align: justify;\">* ELETR&Ocirc;NICOS</p>\r\n<p style=\"text-align: justify;\">* VESTU&Aacute;RIO</p>\r\n<p style=\"text-align: justify;\">* VARIADOS</p>\r\n<h2 style=\"text-align: justify;\">&ldquo;Quem Importa, Sempre Compra Mais Pagando Muito Menos.&rdquo;</h2>\r\n<p style=\"text-align: justify;\">Ol&aacute;, tudo bem? Me chamo Filipe Barcelos e sou o criador do ACADEMIA DO IMPORTADOR. Tenho grande orgulho de ser reconhecido como autoridade no Brasil quando falamos de importa&ccedil;&atilde;o. Desde 2014, j&aacute; ajudei mais de 60 mil alunos a importar e realizar o sonho de comprar aquele produto desejado ou empreender com seu pr&oacute;prio neg&oacute;cio de revenda.<br /><br />Mas n&atilde;o foi nada f&aacute;cil chegar at&eacute; aqui. Sou de uma fam&iacute;lia humilde e passamos por algumas dificuldades no passado. T&iacute;nhamos apenas o b&aacute;sico para sobreviver gra&ccedil;as &agrave; meus pais. No entanto, sempre sonhei em ter melhores condi&ccedil;&otilde;es de vida tanto pra mim e quanto pra minha fam&iacute;lia. Depois de anos trabalhando como assalariado, alcancei minha liberdade financeira estudando e empreendendo com importa&ccedil;&atilde;o.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<h2 style=\"text-align: justify;\">Aqui Est&atilde;o Alguns Dos Segredos Que Voc&ecirc; Vai Aprender Dentro Deste Treinamento:<br />T&eacute;cnica Exclusiva Dividida em 10 M&oacute;dulos</h2>\r\n<p>01 - Funcionamento do Curso</p>\r\n<p>02 - Utilidades</p>\r\n<p>03 - Cart&atilde;o de Cr&eacute;dito</p>\r\n<p>04 - Endere&ccedil;o Americano</p>\r\n<p>05 - Conhecendo as Lojas</p>\r\n<p>06 - Recomenda&ccedil;&otilde;es Pr&eacute; Compra</p>\r\n<p>07 - Passo a Passo da Compra</p>\r\n<p>08 - Informa&ccedil;&otilde;es Gerais</p>\r\n<p>09 - Enviando o Meu Pacote Para Minha Casa</p>\r\n<p>10 - Rastreio</p>\r\n<h2><strong>Voc&ecirc; Vai Ganhar Tamb&eacute;m Mais 06 B&ocirc;nus</strong></h2>','PORTUGUÊS (BRASIL)','MEMBERSHIP (SITE DE MEMBROS)','Cursos Online, Área de Membros, Serviços de Assinatura','FILIPE@ACADEMIADOIMPORTADOR.COM.BR','academia_do_importador.jpg',NULL,'ZdpjyIcvJEk','https://go.hotmart.com/X12531140S?ap=1217','https://go.hotmart.com/X12531140S','197 ',1,'<p style=\"text-align: justify;\">Falem meus amigos, como est&atilde;o voc&ecirc;s?<br /><br />Vamos para mais uma avalia&ccedil;&atilde;o de um excelente curso que vai te ajudar a ter produtos de alta qualidade com pre&ccedil;os bem abaixo do que costumamos ver aqui no Brasil, isso porque, estamos falando do <strong>Academia do Importador</strong>. O treinamento que vai de ensinar tudo que &eacute; preciso saber para comprar no exterior e fazer seu pedido chagarem na sua humilde resid&ecirc;ncia, t&aacute; bom, ou quer mais?&nbsp;&nbsp; A GENTE QUER SEMPRE MAIS!!<br /><br />Al&eacute;m de comprar produtos voc&ecirc; pode fazer uma reanda extra consider&aacute;vel dependendo da sua disposi&ccedil;&atilde;o.<br />S&atilde;o 10 m&oacute;dulos com t&eacute;cnicas e mais 6 b&ocirc;nus que voc&ecirc; vai encontrar.<br /><br />Se recomendamos? Com toda certeza meus amigos, aproveitem e o pre&ccedil;o do curso e muito acess&iacute;vel.<br /><br /><em>&ldquo;Nunca diga eu n&atilde;o consigo. Voc&ecirc; consegue sim, basta ter for&ccedil;a de vontade e f&eacute;.&rdquo;</em></p>',18,1),(3,'APRENDA VIOLÃO DESAFIO 10 DIAS','<h2 style=\"text-align: justify;\">O que &eacute; o APRENDA VIOL&Atilde;O DESAFIO 10 DIAS?</h2>\r\n<p style=\"text-align: justify;\">O <strong>APRENDA VIOL&Atilde;O DESAFIO 10 DIAS</strong> &eacute; um M&eacute;todo de Viol&atilde;o Totalmente Online, e que j&aacute; ajudou mais de 1500 alunos a realizarem o seu sonho de tocar. Tem como objetivo principal fazer com que o aluno aprenda sua primeira m&uacute;sica em 10 dias.</p>\r\n<p style=\"text-align: justify;\">&Eacute; chamado <strong>M&Eacute;TODO INVERSO DE APRENDIZADO.</strong></p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><em>E o que seria este m&eacute;todo?</em></p>\r\n<p style=\"text-align: justify;\">Antes de te explicar o que &eacute; o m&eacute;todo inverso de aprendizado, gostaria de te dizer porque que mais de 80% das pessoas que come&ccedil;am a aprender viol&atilde;o, desistem sem ao menos conseguir tocar sua primeira m&uacute;sica.</p>\r\n<p style=\"text-align: justify;\">E o motivo &eacute; porque m&uacute;sica &eacute; algo muito complexo, que exige anos e at&eacute; mesmo uma vida inteira de estudos. E aprender um instrumento, seja qual for, est&aacute; dentro desta complexidade. Tanto &eacute; que existem universidades preparando graduados, p&oacute;s graduados e at&eacute; doutores em m&uacute;sica.</p>\r\n<p style=\"text-align: justify;\">Ent&atilde;o muitos desistem no meio do caminho, pois no m&eacute;todo tradicional de ensino, logo no come&ccedil;o s&atilde;o aplicadas v&aacute;rias teorias, que s&atilde;o necess&aacute;rias e fundamentais, por&eacute;m que fazem com que o aluno se assuste e desista.</p>\r\n<p style=\"text-align: justify;\">Ent&atilde;o o que seria este famoso <strong>m&eacute;todo inverso</strong> que v&aacute;rias pessoas est&atilde;o comentando como o m&eacute;todo r&aacute;pido de aprendizagem?</p>\r\n<p style=\"text-align: justify;\">&Eacute; um m&eacute;todo onde tudo &eacute; aprendido de tr&aacute;s para frente, ou seja, voc&ecirc; aprender&aacute; primeiro a tocar as suas m&uacute;sicas, para depois se quiser, aprofundar nas teorias.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><em>Mais isso &eacute; poss&iacute;vel?</em></p>\r\n<p style=\"text-align: justify;\">Sim, apesar de pol&ecirc;mico!&nbsp;</p>\r\n<p style=\"text-align: justify;\">Pois os grandes estudiosos da m&uacute;sica n&atilde;o aceitam e criticam, porque eles querem que voc&ecirc; passe pelo mesmo processo tradicional de ensino.&nbsp;</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Por&eacute;m te digo. &Eacute; POSS&Iacute;VEL!!!!!</p>\r\n<p style=\"text-align: justify;\">Esse t&eacute;cnica ajuda o Iniciante a vencer as principais barreiras iniciais do aprendizado, e a evoluir gradativamente, tornando a sua jornada de estudos muito mais intuitiva e pr&aacute;tica.&nbsp;</p>\r\n<p style=\"text-align: justify;\">O aluno seguir&aacute; um verdadeiro passo a passo, sendo direcionado ao objetivo de executar as primeiras m&uacute;sicas no viol&atilde;o em apenas 10 Dias.&nbsp;</p>\r\n<p style=\"text-align: justify;\">Trata-se de um passo a passo muito eficaz simples e objetivo.&nbsp;</p>\r\n<p style=\"text-align: justify;\">E o melhor de tudo!&nbsp;</p>\r\n<p style=\"text-align: justify;\">Por ser um treinamento online, gravados em v&iacute;deo aulas, voc&ecirc; pode estudar no conforto da sua casa, e assistir as aulas quantas vezes quiser.</p>\r\n<p style=\"text-align: justify;\">Ent&atilde;o chega de sofrer com cursos tradicionais e que ensinam sempre a mesma coisa!&nbsp;</p>\r\n<p style=\"text-align: justify;\">Saia daqui sabendo que daqui a 10 dias j&aacute; estar&aacute; tocando sua primeira m&uacute;sica.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<h2 style=\"text-align: center;\">VANTAGENS EM ESTUDAR CONOSCO</h2>\r\n<h3 style=\"text-align: center;\"><strong>S&atilde;o in&uacute;meros benef&iacute;cios em um &uacute;nico curso.</strong></h3>\r\n<p>1 - Liberdade</p>\r\n<p>2 - Tempo</p>\r\n<p>3 - M&eacute;todo Inverso do Aprendizado</p>\r\n<p>4 - Suporte Imediato</p>\r\n<p>5 - Did&aacute;tica F&aacute;cil</p>\r\n<p>6 - Qualidade</p>\r\n<p>7 - Para Todos</p>\r\n<p>8 - Garantia</p>\r\n<p>&nbsp;</p>\r\n<h2>B&ocirc;nus Exclusivos</h2>\r\n<p>* Exerc&iacute;cio para destravar os dedos&nbsp;</p>\r\n<p style=\"text-align: justify;\">* 20 Mil M&uacute;sicas Cifradas</p>\r\n<p style=\"text-align: justify;\">* 1000 M&uacute;sicas Guias</p>','PORTUGUÊS (BRASIL)','MEMBERSHIP (SITE DE MEMBROS)','Cursos Online, Área de Membros, Serviços de Assinatura','DANTE@APRENDAVIOLAO.COM.BR','Aprenda_Violao_Desafio_10_Dias.jpg',NULL,'-FqGH2yjJ0o','https://go.hotmart.com/V12531099T','https://go.hotmart.com/V12531099T','197',2,'<p>Falem meus amigos, como est&atilde;o voc&ecirc;s&nbsp;</p>\r\n<p>Bom, essa avalia&ccedil;&atilde;o &eacute; sobre um curso que muita gente tem vontade de fazer mais poucos realmente se dedicam a correm atr&aacute;s dos seus objetivo e sonhos.</p>\r\n<p>O curso em quest&atilde;o vai te pegar pela m&atilde;o e de mostrar todos os passos para que voc&ecirc; possa aprender a tocar um viol&atilde;o com qualidade e efici&ecirc;ncia.</p>\r\n<p>V&iacute;deo aulas de alta qualidade com v&aacute;rios exemplos &eacute; estrat&eacute;gias de aprendizado, sem comentar os v&aacute;rios b&ocirc;nus que o produtor oferece.</p>\r\n<p>&nbsp;</p>\r\n<p><em>&ldquo;Transportai um punhado de terra todos os dias e fareis uma montanha&rdquo;</em></p>',17,1),(4,'AS 200 FRASES MAIS USADAS EM INGLÊS + AUDIO B','<h2 style=\"text-align: justify;\">Falar ingl&ecirc;s n&atilde;o tem nada a ver com quantos verbos voc&ecirc; sabe conjugar e sim com quantas situa&ccedil;&otilde;es voc&ecirc; consegue se virar!</h2>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Foi pensando nisso que eu e minha equipe pedag&oacute;gica criamos o livro: As 200 Frases Mais Usadas em Ingl&ecirc;s&hellip;</p>\r\n<p style=\"text-align: justify;\">Esse &eacute; um livro para voc&ecirc; come&ccedil;ar a sua nova jornada de Estudo Inteligente do ingl&ecirc;s.</p>\r\n<p style=\"text-align: justify;\">Minha equipe pedag&oacute;gica separou as frases mais utilizadas por brasileiros nas principais situa&ccedil;&otilde;es que tem que falar ingl&ecirc;s:</p>\r\n<p style=\"text-align: justify;\">1 - Viagens a lazer</p>\r\n<p style=\"text-align: justify;\">2 - Viagens a trabalho</p>\r\n<p style=\"text-align: justify;\">3 - Entrevistas</p>\r\n<p style=\"text-align: justify;\">4 - Liga&ccedil;&otilde;es telef&ocirc;nicas</p>\r\n<p style=\"text-align: justify;\">5 - Restaurantes</p>\r\n<p style=\"text-align: justify;\">6 - Compras</p>\r\n<p style=\"text-align: justify;\">7 - Pedir informa&ccedil;&otilde;es</p>\r\n<p style=\"text-align: justify;\">8 - E muitas outras situa&ccedil;&otilde;es&hellip;</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Esse &eacute; um material que foi criado para que voc&ecirc; possa estudar e consultar onde e quando quiser.</p>\r\n<p style=\"text-align: justify;\">&Eacute; um verdadeiro guia de bolso para voc&ecirc; usar at&eacute; em situa&ccedil;&otilde;es de emerg&ecirc;ncia.</p>\r\n<p style=\"text-align: justify;\">Esse &eacute; um material que foi criado para que voc&ecirc; possa estudar e consultar onde e quando quiser.</p>\r\n<p style=\"text-align: justify;\">&Eacute; um verdadeiro guia de bolso para voc&ecirc; usar at&eacute; em situa&ccedil;&otilde;es de emerg&ecirc;ncia.</p>\r\n<p style=\"text-align: justify;\">Mas uma coisa eu posso te garantir, absorva essas 200 frases em ingl&ecirc;s e voc&ecirc; j&aacute; poder&aacute; se considerar um intermedi&aacute;rio no ingl&ecirc;s, afinal&hellip;</p>\r\n<p style=\"text-align: justify;\">Quantas pessoas voc&ecirc; conhece que sabem falar 200 frases em ingl&ecirc;s, pode ser sincero&hellip;</p>\r\n<p style=\"text-align: justify;\">No seu trabalho, na sua casa ou at&eacute; mesmo no c&iacute;rculo de amigos.</p>\r\n<p style=\"text-align: justify;\">Saber 200 frases em ingl&ecirc;s vai te colocar em um grupo seleto!</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\">Mas n&atilde;o se engane, eu n&atilde;o estou dizendo que com 200 frases voc&ecirc; j&aacute; vai poder sair por a&iacute; se virando em qualquer situa&ccedil;&atilde;o em ingl&ecirc;s&hellip;</p>\r\n<p style=\"text-align: justify;\">O que estou querendo dizer &eacute; que 200 frases &eacute; um excelente come&ccedil;o, afinal, ningu&eacute;m acorda falando ingl&ecirc;s fluente.</p>\r\n<p style=\"text-align: justify;\">Falar ingl&ecirc;s &eacute; uma jornada e aquele seu amigo que fala ingl&ecirc;s muito bem, um dia s&oacute; soube 10 frases&hellip; um dia s&oacute; soube 100 frases&hellip; um dia soube 200 frases!</p>\r\n<h2 style=\"text-align: justify;\">Domine essas 200 frases e voc&ecirc; estar&aacute; com meio caminho andado.</h2>\r\n<p style=\"text-align: justify;\">Agora voc&ecirc; deve estar se perguntando&hellip;</p>\r\n<p style=\"text-align: justify;\">&ldquo;Okay Jober, eu entendi! Essas 200 frases v&atilde;o me ajudar&hellip; Mas qual &eacute; o valor?&rdquo;</p>\r\n<p style=\"text-align: justify;\">Pode ficar tranquilo, o valor &eacute; muito baixo&hellip; Ainda mais baixo quando voc&ecirc; ver o que eu preparei para voc&ecirc; HOJE&hellip;</p>\r\n<p style=\"text-align: justify;\">O valor do livro online em PDF &ldquo;As 200 Frases Mais Usadas em Ingl&ecirc;s&rdquo; &eacute; de apenas R$19,90 que podem ser parcelados em at&eacute; 4x de R$ 5,34&hellip;</p>\r\n<p style=\"text-align: justify;\">E por apenas mais 10 reais voc&ecirc; pode garantir a vers&atilde;o em PDF mais o audiobook, que &eacute; o &aacute;udio completo do livro para voc&ecirc; aprender tamb&eacute;m a fon&eacute;tica e pron&uacute;ncia das palavras e frases!</p>\r\n<p style=\"text-align: justify;\">O valor para voc&ecirc; ter acesso ao Livro Online em PDF + &Aacute;udio Book &eacute; de apenas R$29,90 e voc&ecirc; pode parcelar em at&eacute; 6x de R$ 5,51&hellip;</p>\r\n<p style=\"text-align: justify;\">Isso mesmo, voc&ecirc; n&atilde;o leu errado, apenas isso!</p>\r\n<p style=\"text-align: justify;\">Mas, ainda tem mais&hellip;</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p style=\"text-align: justify;\"><strong>E muitos outros b&ocirc;nus para voc&ecirc; desfrutar de novo m&eacute;todo de ensino!&nbsp;</strong></p>','PORTUGUÊS (BRASIL)','MEMBERSHIP (SITE DE MEMBROS)',' Cursos Online, Área de Membros, Serviços de Assinatura','JOBER@UNIVERSIDADEDOINGLES.COM.BR','univercidade_do_ingles.jpg',NULL,'zkUsKplbrBc','https://go.hotmart.com/T12541009G?ap=0681','https://go.hotmart.com/T12541009G','29',2,'<p style=\"text-align: justify;\">Meus amigos, como est&atilde;o voc&ecirc;s&nbsp;</p>\r\n<p style=\"text-align: justify;\">O curso que voc&ecirc;s est&atilde;o prestes a adquirir oferece um m&eacute;todo revolucion&aacute;rio para que voc&ecirc; aprenda ingl&ecirc;s de forma pratica e r&aacute;pida como nunca viu antes.</p>\r\n<p style=\"text-align: justify;\">Como sempre falamos aqui, nada cai do c&eacute;u de m&atilde;o beijada nas suas pernas n&eacute;?</p>\r\n<p style=\"text-align: justify;\">&Eacute; muito importante sua dedica&ccedil;&atilde;o para que voc&ecirc; chegue no seu sucesso!</p>\r\n<p style=\"text-align: justify;\">O curso todo e garantido, se n&atilde;o gostar ou n&atilde;o se adaptar ao m&eacute;todo voc&ecirc; pode solicitar a devolu&ccedil;&atilde;o conforme as garantias do curso e da plataforma de vendas.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>\r\n<p><em>&ldquo;&Eacute; fazendo que se aprende a fazer aquilo que se deve aprender a fazer - Arist&oacute;teles&rdquo;</em></p>',15,1);
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

-- Dump completed on 2019-03-20 17:51:52
