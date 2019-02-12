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

	$query		= mysqli_query( $conn,"SELECT idcategoria, nmcategoria,descategoria 
								FROM categoria ORDER BY nmcategoria LIMIT 0 , $limit") or die (mysqli_error ($conn));
	
	for( $i = 0; mysqli_num_rows( $query ) > $i ; $i++ ){
		
		$result	= mysqli_fetch_array($query);
		
		$html = '
						<tr>
                        <td>'.$result["idcategoria"].'</td>
                        <td >'.$result["nmcategoria"].'</td>
                        <td >'.$result["descategoria"].'</td>
						<td width="8%">					
				
				<button type="button" class="btn btn-xs btn-warning" data-toggle="modal"
				data-target="#exampleModal'.$result["idcategoria"].'" ><i class="fa fa-pencil" title="EDITAR"></i></button>
				&nbsp;&nbsp;&nbsp;
				
				<button type="button" class="btn btn-xs btn-danger" data-toggle="modal"
				data-target="#excluirModal'.$result["idcategoria"].'" ><i class="fa fa-trash" title="EXCLUIR"></i></button>
			</td>
                         </tr>     

						 
					  <!-- MODAL EDITAR -->
			  
		<div class="modal fade" id="exampleModal'.$result["idcategoria"].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Editar Categoria de Materias </h4>
			  </div>
			<div class="modal-body">
				<form method="POST" action="class/editarCategoria.class.php" enctype="multipart/form-data">
				
					<div class="form-group">
					<label for="recipient-name" class="control-label">Categoria(*)</label>
					<input type="text" class="form-control" id="nmcategoria" name="nmcategoria" value="'.$result["nmcategoria"].'">
				  </div>
				  
				  <div class="form-group">
					<label for="recipient-name" class="control-label">Descrição</label>
					<input type="text" class="form-control" id="descategoria" name="descategoria" value="'.$result["descategoria"].'">
				  </div>				  
				
					<input type="hidden" class="form-control" id="idcategoria"  name="idcategoria" value="'.$result["idcategoria"].'">
				
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-warning" id="button">Alterar</button>
			 
				</form>
			</div>
			  
			</div>
		  </div>
		</div>  
			<!-- FIM DO MODAL EDITAR --> 
			
			
			  <!-- MODAL EXCLUIR -->
			  
		<div class="modal fade" id="excluirModal'. $result["idcategoria"].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Confirmar Exclusão? </h4>
			  </div>
			<div class="modal-body">
				<form method="POST" action="class/excluirCategoria.class.php" enctype="multipart/form-data">
								
					<div class="form-group">
					<label for="recipient-name" class="control-label">Categoria(*)</label>
					<input type="text" class="form-control" id="nmcategoria" name="nmcategoria" value="'.$result["nmcategoria"].'" disabled>
						
				  </div>
			  
					
					<input type="hidden" class="form-control" id="idcategoria"  name="idcategoria" value="'.$result["idcategoria"].'">
				
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