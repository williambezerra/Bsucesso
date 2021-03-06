<!DOCTYPE html>
<html lang="pt" >
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>Biblioteca de Sucesso</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
  
  <meta name="viewport" content="width=device-width, initial-scale=1">


  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Ruda:400,900,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/prettyphoto/css/prettyphoto.css" rel="stylesheet">
  <link href="lib/hover/hoverex-all.css" rel="stylesheet">
  <link href="lib/jetmenu/jetmenu.css" rel="stylesheet">
  <link href="lib/owl-carousel/owl-carousel.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="css/colors/blue.css">
  
  <!-- GALERIA PRATELEIRA -->
  
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
    <link rel="stylesheet" href="gallery-clean.css">
	
	<!-- BANNER ROTATIVO-->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  


  
  <!-- =======================================================
    Template Name: MaxiBiz
    Template URL: https://templatemag.com/maxibiz-bootstrap-business-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
  
  
  
  
</head>

<body>
  <div class="topbar clearfix">
    <div class="container">
      <div class="col-lg-12 text-right">
        <div class="social_buttons">
          <a href="#" data-toggle="tooltip" data-placement="bottom" title="Instagra"><i class="fa fa-instagram"></i></a>
          <a href="#" data-toggle="tooltip" data-placement="bottom" title="Facebook"><i class="fa fa-facebook"></i></a>
        </div>
      </div>
    </div>
    <!-- end container -->
  </div>
  <!-- end topbar -->

  <header class="header">
    <div class="container">
	 <div class="site-header clearfix">
	 	  
        <div class="col-lg-4 col-md-3">

           <a href="index.php" title="">
			
			<!--BIBLIOTECA DE <span>SUCESSO</span> -->
			
		 <img alt="" src="img/Bsucesso2.png" width="50%" align="height">  
				<br>
				
            </a>

        </div>
	

		
        <!-- title area -->
        <div class="col-lg-8 col-md-8 col-sm-4">
          <div id="nav" class="right">
            <div class="container clearfix">
			
              <ul id="jetmenu" class="jetmenu blue">
                <li class="active"><a href="?pagina=inicio">Home</a>
                </li>
                <li><a href="?pagina=prateleira">Prateleira</a>
                  <ul class="dropdown">

                  </ul>
                </li>				
                <li><a href="?pagina=posts">Posts</a>
                </li>                
                <li><a href="#">Loja</a>
                  <ul class="dropdown">
                  </ul>
                </li>

                <li><a href="?pagina=listartigos">Blog</a>
                </li>
				<li><a href="?pagina=sobre">Sobre</a>
                </li> 	
				<li><a href="?pagina=contato">Contato</a>
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

 <body>
<!-- ******************  INICIO DO CONTEUDO ****************************************  --> 

 
			<?php
			
				# SCRIPT DE QUERY STRING DESENVOLVIDO POR LEDSON OLIVEIRA .
				$pag	= @$_GET['pagina']; # Variável que recebe a página.
				$pasta	= "pages"; # Pasta onde as páginas irão ficar.

	
		
					if( !isset($pag) ){
						include $pasta."/"."inicio.html";
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
				
			?>		
					
					
						
 
 
<!-- ************************* FIM DA PAGINA QUE SE MODIFICA  ******************************* -->
  
  <footer class="footer">
   <!-- <div class="container">
      <div class="widget col-lg-3 col-md-3 col-sm-12">
        <h4 class="title">About us</h4>
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"s standard dummy text ever since the 1500s..</p>
        <a class="button small" href="#">read more</a>
      </div>
      <!-- end widget --
      <div class="widget col-lg-3 col-md-3 col-sm-12">
        <h4 class="title">Recent Posts</h4>
        <ul class="recent_posts">
          <li>
            <a href="home1.html#">
						<img src="img/recent_post_01.png" alt="" />Our New Dashboard Is Here</a>
            <a class="readmore" href="#">read more</a>
          </li>
          <li>
            <a href="home1.html#">
						<img src="img/recent_post_02.png" alt="" />Design Is In The Air</a>
            <a class="readmore" href="#">read more</a>
          </li>
        </ul>
        <!-- recent posts --
      </div>
      <!-- end widget --
      <div class="widget col-lg-3 col-md-3 col-sm-12">
        <h4 class="title">Get In Touch</h4>
        <ul class="contact_details">
          <li><i class="fa fa-envelope-o"></i> info@yoursite.com</li>
          <li><i class="fa fa-phone-square"></i> +34 5565 6555</li>
          <li><i class="fa fa-home"></i> Some Fine Address, 887, Madrid, Spain.</li>
          <li><a href="#"><i class="fa fa-map-marker"></i> View large map</a></li>
        </ul>
        <!-- contact_details --
      </div>
      <!-- end widget --
      <div class="widget col-lg-3 col-md-3 col-sm-12">
        <h4 class="title">Flickr Stream</h4>
        <ul class="flickr">
          <li><a href="#"><img alt="" src="img/flickr_01.jpg"></a></li>
          <li><a href="#"><img alt="" src="img/flickr_02.jpg"></a></li>
          <li><a href="#"><img alt="" src="img/flickr_03.jpg"></a></li>
          <li><a href="#"><img alt="" src="img/flickr_04.jpg"></a></li>
          <li><a href="#"><img alt="" src="img/flickr_05.jpg"></a></li>
          <li><a href="#"><img alt="" src="img/flickr_06.jpg"></a></li>
          <li><a href="#"><img alt="" src="img/flickr_07.jpg"></a></li>
          <li><a href="#"><img alt="" src="img/flickr_08.jpg"></a></li>
        </ul>
      </div>
      <!-- end widget --
    </div> -->
    <!-- end container -->

    <div class="copyrights">
      <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-12 columns footer-left">
          <p>Copyright © 2019 - Todos os direitos reservados.</p>
          <div class="credits">
            <!--
              You are NOT allowed to delete the credit link to TemplateMag with free version.
              You can delete the credit link only if you bought the pro version.
              Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/maxibiz-bootstrap-business-template/
              Licensing information: https://templatemag.com/license/
            -->
            
          </div>
        </div>
        <!-- end widget -->
        <div class="col-lg-6 col-md-6 col-sm-12 columns text-right">
          <div class="footer-menu right">
            <ul class="menu">
              <li><a href="?pagina=inicio">Home</a></li>
              <li><a href="?pagina=prateleira">Prateleira</a></li>
              <li><a href="?pagina=posts">Posts</a></li>
              <li><a href="#">Loja</a></li>

              <li><a href="?pagina=listartigos">Blog</a></li>
			  <li><a href="?pagina=sobre">Sobre</a></li>
			  <li><a href="?pagina=login" data-toggle="tooltip" data-placement="bottom" title="Gerenciador"><i class="fa fa-cogs"></i></a></li>
            </ul>
			      
          </div>
        </div>
        <!-- end large-6 -->
      </div>
      <!-- end container -->
    </div>
    <!-- end copyrights -->
  </footer>
  <!-- end footer -->
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

  <!--  GALERIA PRATELEIRA-->
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>
<script>
    baguetteBox.run('.tz-gallery');
</script>
  
</body>
</html>
