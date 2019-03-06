<?PHP
/*
	@ MÓDULO PARA LISTAR CATEGORIA MATERIAL
	@ PROJETO - FISCALIZE V.1
	@ TODOS OS DIREITOS RESERVADOS
	@ CRÉDITOS :WILLIAM BEZERRA
	@ CONTATO - WILLIAMBEZERRADESOUSA@GMAIL.COM

*/
	
	include ("mysql.class.php");

	
	$categoria	= setPost("categoria");
	$busca	= setPost("busca");
	$query  = "";
	
	if($categoria != 0 && $busca!= "") {
	
		$query		= mysqli_query( $conn,"select idproduto, nmproduto, sobre, idioma, formaacesso, formato, emailsuporte, 
									linkimagem1, linkimagem2, linkvideo, linkvenda,linkpgproduto , valor , destaque, avaliacaoB ,nmcategoria, usuario
									from produto
									inner join categoria as cat on cat.idcategoria = produto.fkcategoria
									inner join login on login.idlogin = produto.fklogin
									where idcategoria='$categoria'and nmproduto LIKE '%$busca%'		") or die (mysqli_error ($conn));
									
	}
	elseif($categoria !=0 && $busca==""){
		$query		= mysqli_query( $conn,"select idproduto, nmproduto, sobre, idioma, formaacesso, formato, emailsuporte, 
									linkimagem1, linkimagem2, linkvideo, linkvenda,linkpgproduto , valor ,destaque, avaliacaoB ,nmcategoria, usuario
									from produto
									inner join categoria as cat on cat.idcategoria = produto.fkcategoria
									inner join login on login.idlogin = produto.fklogin
									where idcategoria='$categoria'	") or die (mysqli_error ($conn));		
		
	}	
	
	elseif($categoria ==0 && $busca!=""){
		
		$query		= mysqli_query( $conn,"select idproduto, nmproduto, sobre, idioma, formaacesso, formato, emailsuporte, 
									linkimagem1, linkimagem2, linkvideo, linkvenda,linkpgproduto , valor , destaque, avaliacaoB ,nmcategoria, usuario
									from produto
									inner join categoria as cat on cat.idcategoria = produto.fkcategoria
									inner join login on login.idlogin = produto.fklogin
									where nmproduto LIKE '%$busca%'		") or die (mysqli_error ($conn));	
		
	}

	
	
		if( empty($query)){
		
		echo " <center><div class='alert alert-warning alert-dismissable'>
                 <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                   <h4><i class='icon fa fa-ban'></i> Atenção</h4>
                   Não temos crusos com essa especificação!
               </div></center>";
		
		}
		else{
		
		
			if(mysqli_num_rows( $query )==0){
				
						echo " <center><div class='alert alert-warning alert-dismissable'>
                 <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                   <h4><i class='icon fa fa-ban'></i> Atenção</h4>
                   Não temos crusos com essa especificação!
               </div></center>";
				
			}
			else{
				for( $i = 0; mysqli_num_rows( $query ) > $i ; $i++ ){
					
					$result	= mysqli_fetch_array($query);
					
					$conteudo = substr($result["sobre"], 0, 15);  
					
		
					$html = '
					
							<div class="col-sm-8 col-md-3">
							 <div class="thumbnail">
							 <input type="button" value="Detalhes" id="btn" class="button" data-toggle="modal"
						data-target="#exampleModal'.$result["idproduto"].'" > 
								
									<img src="img/produto/'.$result["linkimagem1"].'"  alt="Park">
						
								<div class="caption">
									<h5><b>'.$result["nmproduto"].'</b></h5>
									<font size="2">'.$result["nmcategoria"].'</font><br>

								</div>
							 </div>
							</div>
			


			<!-- MODAL EDITAR -->
						  
					<div class="modal fade" id="exampleModal'.$result["idproduto"].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
					  <div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
						  <div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="exampleModalLabel">Prévia: <B>'.$result["nmproduto"].'</B> 
							<a href="'.$result["linkpgproduto"].'" target="_blank"> <button type="button" class="btn btn-success  pull-right" id="button"><i class="fa fa-file"></i> Acessar página do Treinametno</button></a>
							</h4>
							
						  </div>
						<div class="modal-body">
							<form method="POST" enctype="multipart/form-data">
						
						
			<!-- IMAGEM DO PRODUTO -->

					<img class="aligncenter" width="90%" height="90%" src="img/produto/'.$result["linkimagem1"].'" alt="">

			<!-- ************* -->
								
			<section class="marketplace-top">
			  
				  <div class="content col-lg-12 col-md-12 col-sm-12 clearfix " >
					
					<h2>'.$result["nmproduto"].' </h2> 
					<p align="justify"> 
					
						'.$result["sobre"].'

					</p>
						
				<a href="'.$result["linkvenda"].'"  target="_blank"> <center> <button type="button" class="btn btn-success btn-lg" id="btn"><i class="fa fa-check"> </i> Quero o Treinametno</button> </center> </a>				
							
				  </div>
				  <!-- end content -->
			  </section>
			  <!-- end section -->	
				
					


					<div class="video-responsive">
						<iframe src="https://www.youtube.com/embed/'.$result["linkvideo"].'" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
					

				
				
						<a href="'.$result["linkpgproduto"].'"  target="_blank"> <center> <button type="button" class="btn btn-danger btn-lg" id="btn"><i class="fa fa-database"> </i> MAIS INOFORMAÇÕES DO CURSO</button> </center> </a>
						
							<P>
							<P>
							
							
						<div class="col-lg-3 col-md-3 col-sm-12">
									<div class="theme_details">
											<div class="item_price">
												<h3><span><small>R$</small></span></h3>
							  </div> 
							  <!-- item_price -->
							  <hr> 
							  
							  <div class="buttons">
								<a class="button btn-block large" href="'.$result["linkvenda"].'" target="_blank"><i class="fa fa-download"></i> Adquirir </a>
							  </div>
							  <!-- buttons -->
							<!--  <hr>
							  <div class="rating text-center">
							<h2>4 <i class="fa fa-heart"></i></h2>
								<p>Nota 1/5</p>
							  </div>
							  <!-- rating -- -->
							</div>
							<!-- theme_details -->
						  </div>
						  <!-- col-lg-3 -->	
					<div class="theme_overviews clearfix">
					   
					   <div class="col-lg-4 col-md-4 col-sm-12">
						<div class="services">
						  <div class="icon-container">
							<i class="fa fa-language"></i>
						  </div>
						  <header>
							<h3>Idioma</h3>
						  </header>
						  '.$result["idioma"].'
						</div>
					  </div>	

					  <div class="col-lg-4 col-md-4 col-sm-12">
						<div class="services">
						  <div class="icon-container">
							<i class="fa fa-desktop"></i>
						  </div>
						  <header>
							<h3>Forma de Acesso</h3>
						  </header>
						  '.$result["formaacesso"].'
						</div>
					  </div>
					  
					  <div class="col-lg-4 col-md-4 col-sm-12">
						<div class="services">
						  <div class="icon-container">
							<i class="fa fa-folder"></i>
						  </div>
						  <header>
							<h3>Formato</h3>
						  </header>
								'.$result["formato"].'
						</div>
					  </div>		  

					  <div class="col-lg-4 col-md-4 col-sm-12">
						<div class="services">
						  <div class="icon-container">
							<i class="fa fa-envelope"></i>
						  </div>
						  <header>
							<h3>E-mail Suporte</h3>
						  </header>
								'.$result["emailsuporte"].'
						</div>
					  </div>
					  
					  <div class="col-lg-4 col-md-4 col-sm-12">
						<div class="services">
						  <div class="icon-container">
							<i class="fa fa-key"></i>
						  </div>
						  <header>
							<h3>Segurança</h3>
						  </header>
								Agrantida pela plataforma de vendas
						</div>
						</div>		  

					  <div class="col-lg-4 col-md-4 col-sm-12">
						<div class="services">
						  <div class="icon-container">
							<i class="fa fa-dollar "></i>
						  </div>
						  <header>
							<h3>Pagamento</h3>
						  </header>
								Cartão de credito, Boleto
						</div>
					  </div>				
						
												
					  </div>
							

						  
							

							</form>
						</div>
						  
						</div>
					  </div>
							   
						<section class="section1">
							<div class="container clearfix">
							  <div class="content col-lg-12 col-md-12 col-sm-12 clearfix">

								<div class="general-title text-center">
								  <h3> Avaliação Bsucesso <i class="fa fa-trophy "></i></h3>
								  <hr>
								</div>

								<div class="col-lg-12 col-md-12 col-sm-12 first">
								  <div class="testimonial">
									<img class="alignleft img-circle" src="img/Bsucesso.fw.png" alt="">
										
										'.$result["avaliacaoB"].'
										
									<div class="testimonial-meta">
									  <h4>Biblioteca de Sucesso <small><a href="#">Feadback</a></small></h4>
									</div>
								  </div>
								  <!-- end dmbox -->
								</div>


							  </div>
							  <!-- end content -->
							</div>
							<!-- end container -->
						  </section>
						  <!-- end section -->
						  <!-- end section -->
					  
					  
					  
					</div>  
						<!-- FIM DO MODAL EDITAR --> 					
									 
					';
					
					echo $html;
					
				}
			}
		}								
	


?>