<?PHP
/*
	@ ARQUIVO PARA VALIDAR CADASTRO DE ARTIGO
	@ PROJETO - BIBLIOTECA DE SUCESSO V.1
	@ TODOS OS DIREITOS RESERVADOS
	@ CRÉDITOS : WILLIAM BEZERRA
	@ CONTATO - WILLIAMBEZERRADESOUSA@GMAIL.COM

*/
if(!isset($_SESSION)){session_start();}

sleep(1);

include_once "mysql.class.php";

// puxo todas a variaves

$data 	 		= $_POST['data'];
$titulo 		= $_POST['titulo'];
$artigo 		= $_POST['artigo'];
$img1 			= $_FILES['img1']['name'];
//$img2			= $_FILES['img2']['name'];
$venda 			= $_POST['venda'];
$fklogin = 	$_SESSION['idusuario'];

 
 //verifico o preenchimento
if( empty( $titulo) || empty( $artigo) || empty( $img1) )
{
		
		msg("Preencha os campos obrigatorios(*)");
		/*echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='reset' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Preencha os campos obrigatorios(*).
                  </div>"; */
}

else{
 

	//VERIFICA A EXISTENCIA DA CATEGORIA PELO NOME 
 	$recebeartigo = mysqli_query($conn, "SELECT titulo FROM blog WHERE titulo ='".$titulo."'")  or die (mysqli_error($conn));
	$dbnmartigo =  mysqli_fetch_array($recebeartigo);
	$verificadado = $dbnmartigo['titulo'];


		if($verificadado == $titulo){
		
		
				msg("Titulo já utilizado!");
		
		/*echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Produto já cadastrado!
                  </div>";*/
		
		}
		else{		
		//SE  O PRODUTO NAO EXISTE, CASDASTRA NOVO

			
			//VERFICAÇÃO PARA O UPLOAD DE IMAGEM
			$arquivo 	= $_FILES['img1']['name'];
			
			//Pasta onde o arquivo vai ser salvo
			$_UP['pasta'] = '../img/blog/';
			
			//Tamanho máximo do arquivo em Bytes
			$_UP['tamanho'] = 1024*1024*100; //5mb
			
			//Array com a extensões permitidas
			$_UP['extensoes'] = array('png', 'jpg', 'jpeg', 'gif', 'PNG', 'JPG', 'JPEG', 'GIF');
			
			//Renomeiar
			$_UP['renomeia'] = false;
			
			//Array com os tipos de erros de upload do PHP
			$_UP['erros'][0] = 'Não houve erro';
			$_UP['erros'][1] = 'O arquivo no upload é maior que o limite do PHP';
			$_UP['erros'][2] = 'O arquivo ultrapassa o limite de tamanho especificado no HTML';
			$_UP['erros'][3] = 'O upload do arquivo foi feito parcialmente';
			$_UP['erros'][4] = 'Não foi feito o upload do arquivo';
			
			//Verifica se houve algum erro com o upload. Sem sim, exibe a mensagem do erro
			if($_FILES['img1']['error'] != 0){
				die("Não foi possivel fazer o upload, erro: <br />". $_UP['erros'][$_FILES['img1']['error']]);
				exit; //Para a execução do script
			}
			
			//Faz a verificação da extensao do arquivo
			$extensao = strtolower(end(explode('.', $_FILES['img1']['name'])));
			if(array_search($extensao, $_UP['extensoes'])=== false){		
				
				msg("A imagem não foi cadastrada extesão inválida.");
				
					/*echo " <div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    A imagem não foi cadastrada extesão inválida.
                  </div>";*/
				

			}
			
			//Faz a verificação do tamanho do arquivo
			else if ($_UP['tamanho'] < $_FILES['img1']['size']){
				
				msg("Arquivo muito grande.");
				
            /*	echo " <div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Arquivo muito grande.
                  </div>";*/
				
			}
			
			//O arquivo passou em todas as verificações, hora de tentar move-lo para a pasta foto
			else{
				//Primeiro verifica se deve trocar o nome do arquivo
				if($_UP['renomeia'] == true){
					//Cria um nome baseado no UNIX TIMESTAMP atual e com extensão .jpg
					$nome_final = time().'.jpg';
				}else{
					//mantem o nome original do arquivo
					$nome_final = $_FILES['img1']['name'];
				}
				//Verificar se é possivel mover o arquivo para a pasta escolhida
				if(move_uploaded_file($_FILES['img1']['tmp_name'], $_UP['pasta']. $nome_final)){
					//Upload efetuado com sucesso, exibe a mensagem
					
					
				mysqli_query($conn,"insert into blog(dtpublica, titulo, conteudo, linckimagem1blog,linckvendablog, fklogin)
				values ('$data', '$titulo', '$artigo', '$nome_final', '$venda', '$fklogin' )")  or die(mysqli_error($conn));
	 
				/*  --------------------------  CRIA ARQUIVO HTML    */
	 	 
	 
					msg("Artigo publicado com sucesso.");	




	
$query		= mysqli_query( $conn,"SELECT idblog, dtpublica, titulo, conteudo, linckimagem1blog, linckvendablog, 
								login.nome ,login.usuario, login.imgusu 
								 FROM blog
									inner join login on login.idlogin = blog.fklogin 
									WHERE titulo='$titulo'")	or die (mysqli_error ($conn));
									
		$result	= mysqli_fetch_array($query);

		$Rdata = date("d/m/Y", strtotime($result["dtpublica"]));
		
		$Rtitulo = $result["titulo"];
		$Rconteudo = $result["conteudo"];
		$Rlinckimagem1blog = $result["linckimagem1blog"];
		$Rlinckvendablog = $result["linckvendablog"];
		$Rnome = $result["nome"];
		$Rusuario = $result["usuario"];
		$Rimgusu = $result["imgusu"];


	$codigo ='<section class="post-wrapper-top">
									<div class="container">
									  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
										<h2>'.$Rtitulo.'</h2>
									  </div>
									</div>
								  </section>
								  <!-- end post-wrapper-top -->
								  <section class="section1">
									<div class="container clearfix">
									  <div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix">
										<!-- SLIDE POST -->
										<article class="blog-wrap">
										  <div class="blog-media">
											<div id="myCarousel" class="carousel slide">
											  <div class="carousel-inner">
												<div class="item active">
												  <img src="img/blog/'.$Rlinckimagem1blog.'" alt="">
												</div>
												<!-- end item -->
												<div class="item">
												  <img src="img/slides_03.jpg" alt="">
												</div>
												<! -- end item -->
											  </div>
											  <!-- carousel inner -->
											  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
																<span class="icon-prev"></span>
															</a>
											  <a class="right carousel-control" href="#myCarousel" data-slide="next">
																<span class="icon-next"></span>
															</a>
											</div>
											<!-- end carousel -->
										  </div>
										  <header class="page-header blog-title">
											<h3 class="general-title">'.$Rtitulo.'</h3>
											<div class="post-meta">
											  <p>
												Publicado em: <span class="publish-on">'.$Rdata.'</span>
												<span class="sep">/</span> Comentários: <a href="#"> 4 Opniões</a>
											  </p>
											</div>
										  </header>
										  <div class="post-desc">
											<p>
												'.$Rconteudo.'
											</p>
										  </div>
										</article>
										<div class="author_box clearfix">
										  <img class="img-circle alignleft" width="100" src="img/usuario/'.$Rimgusu.'" alt="">
										  <h4>Postado por: <a href="#">'.$Rnome.'</a></h4>
												<p></p>
										  <div class="social_buttons">
											<a href="single-with-sidebar.html#" data-toggle="tooltip" data-placement="bottom" title="Facebook"><i class="fa fa-facebook"></i></a>
											<a href="single-with-sidebar.html#" data-toggle="tooltip" data-placement="bottom" title="Twitter"><i class="fa fa-twitter"></i></a>
											<a href="single-with-sidebar.html#" data-toggle="tooltip" data-placement="bottom" title="Google+"><i class="fa fa-google-plus"></i></a>
											<a href="single-with-sidebar.html#" data-toggle="tooltip" data-placement="bottom" title="Dribbble"><i class="fa fa-dribbble"></i></a>
										  </div>
										</div>
										<!-- end author_box -->
										<div id="comments_wrapper">
										  <h4 class="title">2 Comentários</h4>
										  <ul class="comment-list">
											<li>
											  <article class="comment">
												<img src="img/team_06.png" alt="avatar" class="comment-avatar">
												<div class="comment-content">
												  <h4 class="comment-author">
																		Mark Spine <small class="comment-meta">January 12, 2014</small>
																		<span class="comment-reply"><a href="#" class="comment-reply button small">Subir</a></span>
																	</h4> t has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.
												</div>
											  </article>
											  <!-- End .comment -->
											</li>
											<li>
											  <article class="comment">
												<img src="img/team_01.png" alt="avatar" class="comment-avatar">
												<div class="comment-content">
												  <h4 class="comment-author">
																		Leonard Smith <small class="comment-meta">January 12, 2014</small>
																		<span class="comment-reply"><a href="#" class="comment-reply button small">Subir</a></span>
																	</h4> Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia.
												</div>
											  </article>
											  <!-- End .comment -->
											</li>
										  </ul>
										  <!-- End .comment-list -->
										  <div class="clearfix"></div>
										  <div class="comments_form">
											<h4 class="title">Deixe seu comentário</h4>
											<form id="comments_form" action="" name="comments_form" class="row" method="post">
											  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<input type="text" name="nome" id="nome" class="form-control" placeholder="Nome">
												<input type="text" name="email" id="email" class="form-control" placeholder="Email">
												
												<select class="form-control" name="categoria">
												<option value="">SELECIONE ...</option>
													<?PHP
														include_once "class/mysql.class.php";

														$busca		= mysqli_query($conn,"SELECT  idcategoria, nmcategoria, descategoria 
																					FROM categoria	 ") or die(mysqli_error($conn));

														for( $i = 0; mysqli_num_rows($busca) > $i; $i++ ){
																
															$retorno	=  mysqli_fetch_array ($busca);
																
														echo "<option value="'.$retorno['idcategoria'].'">'.$retorno['nmcategoria'].'</option> ";
																
															}
													?>

												</select>
												<textarea class="form-control" name="mensagem" id="comments" rows="6" placeholder="Sua mensagem ..."></textarea>
												<button  type="button" value="ENVIAR"  id="btn" class="button small">Enviar</button>
											  </div>
											  		<center><div id="loading" style="display: none;"><img src="loading.gif"></div> <div id="ok"></div></center>
											</form>
										  </div>
										  <!-- end comments_Form -->
										</div>
										<!-- div comments -->

									  </div>
									  <!-- end content -->

									  <!-- SIDEBAR -->
									<div id="sidebar" class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

									  <div class="widget">
										<h4 class="title">
														<span>Inscreva-se</span>
													</h4>
										<form id="subscribe" action="mc.php" name="subscribe" method="post">
										  <input type="text" name="name" id="name" class="form-control" placeholder="No	me">
										  <input type="text" name="email" id="email" class="form-control" placeholder="Email">
										  <div class="pull-right">
											<input type="submit" value="Enviar" id="submit" class="button">
										  </div>
										</form>
									  </div>


									  <div class="widget">
										<h4 class="title">
														<span>Tags</span>
													</h4>

										<div class="tagcloud">
										  <a href="#" class="" title="12 topics">Sucesso</a>
										  <a href="#" class="" title="2 topics">Ganhar</a>
										  <a href="#" class="" title="21 topics">Cursos</a>
										  <a href="#" class="" title="5 topics">Você que Faz</a>
										  <a href="#" class="" title="62 topics">Positovo</a>
										  <a href="#" class="" title="12 topics">Produtividade</a>
										  <a href="#" class="" title="88 topics">Buscar</a>
										  <a href="#" class="" title="15 topics">Criatividade</a>
										  <a href="#" class="" title="31 topics">Vontade</a>
										  <a href="#" class="" title="16 topics">Luta</a>
										  <a href="#" class="" title="32 topics">Treinamentos</a>
										  <a href="#" class="" title="12 topics">Dinheiro</a>
										  <a href="#" class="" title="44 topics">Pessoal</a>
										</div>
									  </div>

									</div>
									<!-- end sidebar -->
									</div>
									<!-- end container -->
								  </section>
								  <!-- end section -->'; // Faça outra concatenação com o código HTML
								  
					$dir_arq = "../pages/$Rtitulo.html"; // Isso é uma concatenação
					if (file_exists($dir_arq)) {
					  echo "O arquivo \"$dir_arq\" já existe."; // Usa a variável que você já criou com o nome do arquivo
					} else {
					  $arq = fopen($dir_arq, "w");
					  if(fwrite($arq,$codigo)){ // Aqui você tinha usado a variável errada $arq em vez de $dir_arq
						msg("Arquivo criado com sucesso!");
					  } else {
						msg("erro ao criar o arquivo");
					  }
					}					
					
					/*echo "<div class='alert alert-success alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4>	<i class='icon fa fa-check'></i> Sucesso!</h4>
                    Cadastro realizado com sucesso.
                  </div>";*/
										
					
				}else{
					//Upload não efetuado com sucesso, exibe a mensagem
					
				msg("Imagem não foi cadastrada com Sucesso.");	
				
					/*echo " <div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Imagem não foi cadastrada com Sucesso.
                  </div>";*/

				}
			}
				

		}
	}

?>