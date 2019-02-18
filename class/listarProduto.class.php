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
	$query		= mysqli_query( $conn,"select idproduto, nmproduto, sobre, idioma, formaacesso, formato, emailsuporte, 
								linkimagem1, linkimagem2, linkvideo, linkvenda, destaque, nmcategoria, usuario
								from produto
								inner join categoria as cat on cat.idcategoria = produto.fkcategoria
								inner join login on login.idlogin = produto.fklogin LIMIT 0 , $limit") or die (mysqli_error ($conn));
	
	for( $i = 0; mysqli_num_rows( $query ) > $i ; $i++ ){
		
		$result	= mysqli_fetch_array($query);
		
		
					switch($result["destaque"]){
					case 1: $destaque ="SIM";
					break;
					case 2:$destaque ="NÃO";
					break;
					default: $destaque="INVAL";
				}
					
		$html = '
						<tr>
                        <td>'.$result["idproduto"].'</td>
                        <td >'.$result["nmcategoria"].'</td>
                        <td >'.$result["nmproduto"].'</td>
                        <td >'.$result["emailsuporte"].'</td>
                        <td >'.$destaque.'</td>
						<td width="20%" align="center"> <img  src="img/produto/'.$result["linkimagem1"].'" width="25%" >  </td>						
						<td width="8%">					
				
				<button type="button" class="btn btn-xs btn-warning" data-toggle="modal"
				data-target="#exampleModal'.$result["idproduto"].'" ><i class="fa fa-pencil" title="EDITAR"></i></button>
				&nbsp;&nbsp;&nbsp;
				
				<button type="button" class="btn btn-xs btn-danger" data-toggle="modal"
				data-target="#excluirModal'.$result["idproduto"].'" ><i class="fa fa-trash" title="EXCLUIR"></i></button>
			</td>
                         </tr>     
						 
					  <!-- MODAL EDITAR -->
			  
		<div class="modal fade" id="exampleModal'.$result["idproduto"].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Editar Produto </h4>
			  </div>
			<div class="modal-body">
				<form method="POST" action="class/editarProduto.class.php" enctype="multipart/form-data">
								
				
					<div class="form-group">
					<label for="recipient-name" class="control-label">Nome(*)</label>
					<input type="text" class="form-control" id="nmproduto" name="nmproduto" value="'.$result["nmproduto"].'">
				  </div>
				  
					<div class="form-group">
                
		
				
				
				<textarea style="width: 100%; height: 200px; font-size: 50px; line-height: 50px; border: 50px solid #dddddd; padding: 50px;" name="sobrep"  > '.$result["sobre"].'
				</textarea>
                 
					</div>					  
							  
				  <div class="col-sm-6">
					<label for="recipient-name" class="control-label">Idioma</label>
					<input type="text" class="form-control" id="idioma" name="idioma" value="'.$result["idioma"].'" maxlength="20" >
					</div>
					
				   <div class="col-sm-6">	
					<label for="recipient-name" class="control-label">Forma de Acesso</label>
					<input type="text" class="form-control" id="facesso" name="facesso" value="'.$result["formaacesso"].'"  maxlength="80" >
				  </div>
				  
				  <div class="col-sm-6">
					<label for="recipient-name" class="control-label">Formato</label>
					<input type="text" class="form-control" id="formato" name="formato" value="'.$result["formato"].'" maxlength="80">
				  </div>				  
				  
				  <div class="col-sm-6">
					<label for="recipient-name" class="control-label">Email Suporte</label>
					<input type="text" class="form-control" id="emailsuporte" name="emailsuporte" value="'.$result["emailsuporte"].'" maxlength="80">
				  </div>				  
				  <div class="col-sm-6">
					<label for="recipient-name" class="control-label">Link Imagem 1</label>
										
					<input type="file" class="form-control" id="img1" name="img1" >
				  </div>					  
				  <div class="col-sm-6">
					<label for="recipient-name" class="control-label">Link Imagem 2</label>
					<input type="file" class="form-control" id="linkimagem2" name="linkimagem2" value="'.$result["linkimagem2"].'" disabled>
				  </div>				  
				  <div class="col-sm-6">
					<label for="recipient-name" class="control-label">Link Video</label>
					<input type="text" class="form-control" id="video" name="video" value="'.$result["linkvideo"].'">
				  </div>					  
				  <div class="col-sm-6">
					<label for="recipient-name" class="control-label">Link Venda</label>
					<input type="text" class="form-control" id="venda" name="venda" value="'.$result["linkvenda"].'">
				  </div>
				  
				 <div class="form-group">
				 <img class="aligncenter" width="40%" height="90%" src="img/produto/'.$result["linkimagem1"].'" alt="">
				
				  </div>	
				
				
					<input type="hidden" class="form-control" id="idproduto"  name="idproduto" value="'.$result["idproduto"].'">
				
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-warning" id="button">Alterar</button>
			 
				</form>
			</div>
			  
			</div>
		  </div>
		</div>  
			<!-- FIM DO MODAL EDITAR --> 
			
			
			  <!-- MODAL EXCLUIR -->
			  
		<div class="modal fade" id="excluirModal'. $result["idproduto"].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Confirmar Exclusão? </h4>
			  </div>
			<div class="modal-body">
				<form method="POST" action="class/excluirProduto.class.php" enctype="multipart/form-data">
								
					<div class="form-group">
					<label for="recipient-name" class="control-label">Categoria(*)</label>
					<input type="text" class="form-control" id="nmproduto" name="nmproduto" value="'.$result["nmproduto"].'" disabled>
						
				  </div>
			  
					
					<input type="hidden" class="form-control" id="idproduto"  name="idproduto" value="'.$result["idproduto"].'">
				
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