

<?PHP
/*
	@ MÓDULO PARA LISTAR CATEGORIA MATERIAL
	@ PROJETO - FISCALIZE V.1
	@ TODOS OS DIREITOS RESERVADOS
	@ CRÉDITOS :WILLIAM BEZERRA
	@ CONTATO - WILLIAMBEZERRADESOUSA@GMAIL.COM

*/


function listar($limit){	
	include ("mysql.class.php");

	$query		= mysqli_query( $conn,"SELECT idblog, dtpublica, titulo, conteudo, linckimagem1blog, linckvendablog, login.nome ,login.usuario, login.imgusu 
										FROM blog
										inner join login on login.idlogin = blog.fklogin 
										order by idblog desc, dtpublica desc LIMIT 0 , $limit") or die (mysqli_error ($conn));
	
	for( $i = 0; mysqli_num_rows( $query ) > $i ; $i++ ){
		
		$result	= mysqli_fetch_array($query);

		$data = date('d/m/Y', strtotime($result["dtpublica"]));

		$coment		= mysqli_query( $conn,"SELECT idblog, dtpublica, titulo,  count(comentarios.nome) qtdcome
										FROM blog
										inner join login on login.idlogin = blog.fklogin 
                                        inner join comentarios on comentarios.fkartigo = blog.idblog
										where idblog='".$result["idblog"]."'") or die (mysqli_error ($conn));
		$Rcoment	= mysqli_fetch_array($coment);
		
		$html = '
			
		        <div class="blog-media">
          <div id="myCarousel" class="carousel slide">
            <div class="carousel-inner">
              <div class="item active">
                <img src="img/blog/'.$result["linckimagem1blog"].'" alt="">
              </div>

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
          <div class="author-wrap">
            <span class="inside">
								<a href="#"><img class="img-responsive" alt="" src="img/usuario/'.$result["imgusu"].'"></a>
							</span>
          </div>
          <h3 class="general-title">'.$result["titulo"].'</h3>
          <div class="post-meta">
            <p>
              Publicado: <span class="publish-on">'.$data.'</span>
          
              <span class="sep">/</span> Comentários: <a href="#"> '.$Rcoment["qtdcome"].'</a>
            </p>
          </div>
		  		    <a href="?pagina='.$result["titulo"].'"> <button type="submit" class="btn btn-primary" id="btn" >Ler Agora ...</button></a>
        </header>

        <div class="post-desc">
		 <!-- ***********************  conteudo  **************** -->
          <p>  </p>
		  

		  
		   <!-- ***********************  conteudo  **************** -->
        </div>
		
		
		
		
		
					
						 
		';
		
		echo $html;
		
	}
	
	
}

?>