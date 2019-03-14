<?PHP

if(!isset($_SESSION)){session_start();}



if( isset( $_GET['logout'] ) ){
	unset($_SESSION['registro']);
	unset($_SESSION['limite']);
	unset($_SESSION['logado']);
	session_destroy();
	header("Location: index.php");
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>GERENCIADOR - Bibliotea de Sucesso</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
  

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Ruda:400,900,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script>  
	

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/prettyphoto/css/prettyphoto.css" rel="stylesheet">
  <link href="lib/hover/hoverex-all.css" rel="stylesheet">
  <link href="lib/jetmenu/jetmenu.css" rel="stylesheet">
  <link href="lib/owl-carousel/owl-carousel.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="css/colors/blue.css">
  

<!-- EDITOR DE TEXTO -->
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
	<script type="text/javascript" >tinymce.init({ selector:'textarea' });</script>


  
  <!--
  <script type="text/javascript">
        bkLib.onDomLoaded(function() { nicEditors.allTextAreas() }); // convert all text areas to rich text editor on that page

        bkLib.onDomLoaded(function() {
             new nicEditor().panelInstance('area1');
        }); // convert text area with id area1 to rich text editor.

        bkLib.onDomLoaded(function() {
             new nicEditor({fullPanel : true}).panelInstance('area2');
        }); // convert text area with id area2 to rich text editor with full panel.
</script>

-->

	

  <!-- =======================================================
    Template Name: MaxiBiz
    Template URL: https://templatemag.com/maxibiz-bootstrap-business-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body>


  <header class="header">
    <div class="container">
      <div class="site-header clearfix">
        <div class="col-lg-3 col-md-3 col-sm-12 title-area">
          <div class="site-title" id="title">
            <a href="gerenciador.php" title="">
              <h4>GERENCIADOR - <span>B.SUCESSO</span></h4>			  
            </a>
				  Bem vindo: <b><?=$_SESSION['user'] ?></b>

          </div>
        </div>

    
       			  


        <!-- title area -->
        <div class="col-lg-9 col-md-12 col-sm-12">
          <div id="nav" class="right">
            <div class="container clearfix">
              <ul id="jetmenu" class="jetmenu blue">

                <li><a href="#">Produto</a>
                  <ul class="dropdown">
                    <li><a href="?pagina=categoria">Categoria</a></li>
                    <li><a href="?pagina=listcategoria">Lista Categorias</a></li>
                    <li><a href="?pagina=cadproduto">Novo Produto</a></li>
                    <li><a href="?pagina=listproduto">Lista Produtos</a></li>
  
                  </ul>
                </li>				

                <li><a href="#">Posts</a>
                  <ul class="dropdown">
                    <li><a href="?pagina=cadposts">Novo Posts</a></li>
                    <li><a href="?pagina=listposts">Listagem</a></li>

                  </ul>
                </li>				
				
                <li><a href="#">Blog</a>
                  <ul class="dropdown">
                    <li><a href="?pagina=cadartigoblog">Novo Artigo</a></li>
                    <li><a href="?pagina=listBlog">Listagem</a></li>

                  </ul>
                </li>

                <li><a href="#">Usuario</a>
                  <ul class="dropdown">
                    <li><a href="?pagina=usuario">Novo</a></li>
                    <li><a href="?pagina=listusuario">Listagem</a></li>
                    <li><a href="?pagina=altsenha">Alterar Senha</a></li>

                  </ul>
                </li>
                <li><a href="?logout=1">SAIR</a>
                </li>	        
              </ul>
            </div>
          </div>
          <!-- nav -->
        </div>
        <!-- title area -->
      </div>
      <!-- site header -->
    </div>
    <!-- end container -->
  </header>
  <!-- end header -->

<!-- ******************  INICIO DO CONTEUDO ****************************************  --> 
 
 
 
			<?php
			

		
				# SCRIPT DE QUERY STRING DESENVOLVIDO POR LEDSON OLIVEIRA .
				$pag	= @$_GET['pagina']; # Variável que recebe a página.
				$pasta	= "pages"; # Pasta onde as páginas irão ficar.



	 
	if($_SESSION['nivel'] !=2 && ($pag == "listusuario" || $pag == "listproduto" || $pag == "listBlog" || $pag == "listcategoria"
			|| $pag == "categoria" || $pag == "cadproduto" || $pag == "usuario") ){
		
								echo "<br>
						<center><div class='alert alert-warning alert-dismissable'>
									<button type='reset' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
									<h4><i class='icon fa fa-danger'></i> Atenção</h4>
									Área Restrita!
								  </div></center>";		
		
	}
	else{
	
		
					if( !isset($pag) ){
						include $pasta."/"."inicioG.html";
					}
					else if( !file_exists( $pasta."/".$pag.".html" ) ){
						
						echo "<br>
						<center><div class='alert alert-warning alert-dismissable'>
									<button type='reset' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
									<h4><i class='icon fa fa-warning'></i> Atenção</h4>
									Página não encontrada , favor entrar em contato com o administrador.
								  </div></center>";			
					}
					else{
						include $pasta."/".$pag.".html";	
					}	
	}	
			?>			
 
 
  
<!-- ************************* FIM DA PAGINA QUE SE MODIFICA  ******************************* -->
  

  <div class="dmtop">Scroll to Top</div>

  <!-- JavaScript Libraries -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="lib/php-mail-form/validate.js"></script>
  <script src="lib/prettyphoto/js/prettyphoto.js"></script>
  <script src="lib/isotope/isotope.min.js"></script>
  <script src="lib/hover/hoverdir.js"></script>
  <script src="lib/hover/hoverex.min.js"></script>
  <script src="lib/unveil-effects/unveil-effects.js"></script>
  <script src="lib/owl-carousel/owl-carousel.js"></script>
  <script src="lib/jetmenu/jetmenu.js"></script>
  <script src="lib/animate-enhanced/animate-enhanced.min.js"></script>
  <script src="lib/jigowatt/jigowatt.js"></script>
  <script src="lib/easypiechart/easypiechart.min.js"></script>

  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>

</body>
</html>
