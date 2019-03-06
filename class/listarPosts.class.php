

    <script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
	<script type="text/javascript" >tinymce.init({ selector:'textarea' });</script>

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

	$query		= mysqli_query( $conn,"select idposts,linkimage, nmcategoria
								from posts
								inner join categoria as cat on cat.idcategoria = posts.fkcategoria LIMIT 0 , $limit") or die (mysqli_error ($conn));
	
	for( $i = 0; mysqli_num_rows( $query ) > $i ; $i++ ){
		
		$result	= mysqli_fetch_array($query);
		

		$html = '
						<tr>
                        <td>'.$result["idposts"].'</td>
                        <td >'.$result["nmcategoria"].'</td>
						<td width="20%" align="center"> <img  src="img/posts/'.$result["linkimage"].'" width="25%" >  </td>						

						<td width="8%">					
				
				<button type="button" class="btn btn-xs btn-warning" data-toggle="modal"
				data-target="#exampleModal'.$result["idposts"].'" ><i class="fa fa-pencil" title="EDITAR"></i></button>
				&nbsp;&nbsp;&nbsp;
				
				<button type="button" class="btn btn-xs btn-danger" data-toggle="modal"
				data-target="#excluirModal'.$result["idposts"].'" ><i class="fa fa-trash" title="EXCLUIR"></i></button>
			</td>
                         </tr>     

						 
					  <!-- MODAL EDITAR -->
			  
		<div class="modal fade" id="exampleModal'.$result["idposts"].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Editar Posts </h4>
			  </div>
			<div class="modal-body">
				<form method="POST" action="class/editarProduto.class.php" enctype="multipart/form-data">
											  

				  <div class="col-sm-6">
					<label for="recipient-name" class="control-label">Catégoria</label>
					<input type="text" class="form-control" id="nmcategoria" name="nmcategoria" value="'.$result["nmcategoria"].'">
				  </div>
				  
				 <div class="form-group">
				 <img class="aligncenter" width="40%" height="90%" src="img/posts/'.$result["linkimage"].'" alt="">
				
				  </div>	
				
				
					<input type="hidden" class="form-control" id="idposts"  name="idposts" value="'.$result["idposts"].'">
				
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-warning" id="button">Alterar</button>
			 
				</form>
			</div>
			  
			</div>
		  </div>
		</div>  
			<!-- FIM DO MODAL EDITAR --> 
			
			
			  <!-- MODAL EXCLUIR -->
			  
		<div class="modal fade" id="excluirModal'. $result["idposts"].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Confirmar Exclusão? </h4>
			  </div>
			<div class="modal-body">
				<form method="POST" action="class/excluirPosts.class.php" enctype="multipart/form-data">
								
					<div class="form-group">
					<label for="recipient-name" class="control-label">IdPosts(*)</label>
					<input type="text" class="form-control" id="idposts" name="idposts" value="'.$result["idposts"].'" disabled>
						
				  </div>
				  
				  				 <div class="form-group">
				 <img class="aligncenter" width="40%" height="90%" src="img/posts/'.$result["linkimage"].'" alt="">
				
				  </div>	
			  
					
					<input type="hidden" class="form-control" id="idposts"  name="idposts" value="'.$result["idposts"].'">
				
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