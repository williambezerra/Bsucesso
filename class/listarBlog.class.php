

<?PHP
/*
	@ MÓDULO PARA LISTAR CATEGORIA MATERIAL
	@ PROJETO - FISCALIZE V.1
	@ TODOS OS DIREITOS RESERVADOS
	@ CRÉDITOS :WILLIAM BEZERRA
	@ CONTATO - WILLIAMBEZERRADESOUSA@GMAIL.COM

*/

if(!isset($_SESSION)){session_start();}

function listar($limit){	
	include ("mysql.class.php");

	$query		= mysqli_query( $conn,"SELECT idblog, dtpublica, titulo, conteudo, linckimagem1blog, linckvendablog, login.nome ,login.usuario, login.imgusu 
										FROM blog
										inner join login on login.idlogin = blog.fklogin 
										ORDER BY idblog desc") or die (mysqli_error ($conn));
	
	for( $i = 0; mysqli_num_rows( $query ) > $i ; $i++ ){
		
		$result	= mysqli_fetch_array($query);
		
		 $data = date('d/m/Y', strtotime($result["dtpublica"]));
		
		$html = '
						<tr>
                        <td>'.$result["idblog"].'</td>
                        <td >'.$result["titulo"].'</td>
                        <td >'.$data.'</td>
                        <td >'.$result["usuario"].'</td>
						<td width="20%" align="center"> <img  src="img/blog/'.$result["linckimagem1blog"].'" width="25%" >  </td>						

						<td width="8%">					
				
				<button type="button" class="btn btn-xs btn-warning" data-toggle="modal"
				data-target="#exampleModal'.$result["idblog"].'" ><i class="fa fa-pencil" title="EDITAR"></i></button>
				&nbsp;&nbsp;&nbsp;
				
				<button type="button" class="btn btn-xs btn-danger" data-toggle="modal"
				data-target="#excluirModal'.$result["idblog"].'" ><i class="fa fa-trash" title="EXCLUIR"></i></button>
			</td>
                         </tr>     

						 
					  <!-- MODAL EDITAR -->
			  
		<div class="modal fade" id="exampleModal'.$result["idblog"].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Editar Artigo </h4>
			  </div>
			<div class="modal-body">
				<form method="POST" action="class/editarArtigo.class.php" enctype="multipart/form-data">
								
				<div class="col-sm-6">
					<label for="recipient-name" class="control-label">Autor</label>
					<input type="text" class="form-control" id="nome" name="nome" value="'.$result["nome"].'" disabled>
				  </div>
				<div class="col-sm-6">
				 <img class="aligncenter" width="25%" height="90%" src="img/usuario/'.$result["imgusu"].'" alt="">
				  </div>	
				<p>

				<div class="form-group">
					<label for="recipient-name" class="control-label">Data Publicação(*)</label>
					<input type="date" class="form-control" id="titulo" name="titulo" value="'.$result["dtpublica"].'">
				  </div>
				  
					<div class="form-group">
					<label for="recipient-name" class="control-label">Titulo(*)</label>
					<input type="text" class="form-control" id="titulo" name="data" value="'.$result["titulo"].'">
				  </div>
			
				  
					<div class="form-group">
                
		
				
				
				<textarea style="width: 100%; height: 200px; font-size: 50px; line-height: 50px; border: 50px solid #dddddd; padding: 50px;" name="sobrep"  > '.$result["conteudo"].'
				</textarea>
                 
					</div>					  		  

				  <div class="col-sm-6">
					<label for="recipient-name" class="control-label">Link Imagem</label>
					<input type="file" class="form-control" id="linkimagem" name="linkimagem">
				  </div>				  


				  <div class="col-sm-6">
					<label for="recipient-name" class="control-label">Link Venda</label>
					<input type="text" class="form-control" id="venda" name="venda" value="'.$result["linckvendablog"].'">
				  </div>
				  
				 <div class="form-group">
				 <img class="aligncenter" width="40%" height="90%" src="img/blog/'.$result["linckimagem1blog"].'" alt="">
				  </div>	
				  				  
				
				
					<input type="hidden" class="form-control" id="idblog"  name="idblog" value="'.$result["idblog"].'">
				
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-warning" id="button">Alterar</button>
			 
				</form>
			</div>
			  
			</div>
		  </div>
		</div>  
			<!-- FIM DO MODAL EDITAR --> 
			
			
			  <!-- MODAL EXCLUIR -->
			  
		<div class="modal fade" id="excluirModal'. $result["idblog"].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Confirmar Exclusão? </h4>
			  </div>
			<div class="modal-body">
				<form method="POST" action="class/excluirArtigo.class.php" enctype="multipart/form-data">
								
					<div class="form-group">
					<label for="recipient-name" class="control-label">Titulo(*)</label>
					<input type="text" class="form-control" id="titulo" name="titulo" value="'.$result["titulo"].'" disabled>
						
				  </div>
			  
					
					<input type="hidden" class="form-control" id="idblog"  name="idblog" value="'.$result["idblog"].'">
				
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-danger" id="button">Excluir</button>
			 
				</form>
			</div>
			  
			</div>
		  </div>
		</div>  
			<!-- FIM DO MODAL EXCLUIR -->  							 
						 
		';
		
		echo $html;
		
	}
	
	
}

?>