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

	$query		= mysqli_query( $conn,"SELECT idlogin ,nome, usuario, email, nivel, imgusu FROM login") or die (mysqli_error ($conn));
	
	for( $i = 0; mysqli_num_rows( $query ) > $i ; $i++ ){
		
		$result	= mysqli_fetch_array($query);
		
				switch($result["nivel"]){
					case 1: $nivel ="AUTOR";
					break;
					case 2:$nivel ="ADMINISTRADOR";
					break;
					default: $nivel="INVAL";
				}
		
		$html = '
						<tr>
                        <td>'.$result["idlogin"].'</td>
                        <td >'.$result["nome"].'</td>
                        <td >'.$result["usuario"].'</td>
                        <td >'.$result["email"].'</td>
                        <td >'.$nivel.'</td>
						<td width="10%" align="center"><img  src="img/usuario/'.$result["imgusu"].'" width="50%" ></td>
						<td width="12%">					
				
				<button type="button" class="btn btn-xs btn-warning" data-toggle="modal"
				data-target="#exampleModal'.$result["idlogin"].'" ><i class="fa fa-pencil" title="EDITAR"></i></button>
				&nbsp;&nbsp;&nbsp;
				
				<button type="button" class="btn btn-xs btn-primary" data-toggle="modal"
				data-target="#alterSenha'.$result["idlogin"].'" ><i class="fa fa-lock" title="ALTER SENHA"></i></button>
				&nbsp;&nbsp;&nbsp;
								
				
				<button type="button" class="btn btn-xs btn-danger" data-toggle="modal"
				data-target="#excluirModal'.$result["idlogin"].'" ><i class="fa fa-trash" title="EXCLUIR"></i></button>
			</td>
                         </tr>     

						 
					  <!-- MODAL EDITAR -->
			  
		<div class="modal fade" id="exampleModal'.$result["idlogin"].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Editar Usuário </h4>	
			  </div>
			<div class="modal-body">
				<form method="POST" action="class/editarUsuario.class.php" enctype="multipart/form-data">
				
          <label for="email">Nome Completo <span class="required">*</span></label>
			<input type="text" name="nmcompleto" id="nmcompleto" class="form-control" value="'.$result["nome"].'" >
          <label for="email">Usuário <span class="required">*</span></label>
			<input type="text" name="usuario" id="usuario" class="form-control" value="'.$result["usuario"].'" >

          <label for="fname">E-mail</label>
			<input type="text" name="email" id="email" class="form-control" value="'.$result["email"].'" >
		  <label for="fname">Nivel <span class="required">*</span></label>
		  
            <select class="form-control" name="nivel" >
					<option value="'.$result["nivel"].'">'.$result["nivel"].' - '.$nivel.'</option>
					<option value="1">01 - AUTOR</option>
					<option value="2">02 - ADMINISTRADOR</option>
	
		    </select> 
			

          <label for="email"> Foto </label>
          <input type="file" name="img1" id="img1" class="form-control"  >	
		
			<img class="aligncenter" width="20%" height="90%" src="img/usuario/'.$result["imgusu"].'" alt="">
			
			<input type="hidden" class="form-control" id="idlogin"  name="idlogin" value="'.$result["idlogin"].'">	
			<input type="hidden" class="form-control" id="imgusu"  name="imgusu" value="'.$result["imgusu"].'">	
				
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-warning" id="button">Alterar</button>
			 
				</form>
			</div>
			  
			</div>
		  </div>
		</div>  
			<!-- FIM DO MODAL EDITAR --> 
			
			
			
			
			  <!-- MODAL ALTERAR SENHA -->
			  
		<div class="modal fade" id="alterSenha'.$result["idlogin"].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Alterar Senha do Usuário </h4>	
			  </div>
			<div class="modal-body">
				<form method="POST" action="class/editarSenha.class.php" enctype="multipart/form-data">
				
          <label for="email">Nome Completo <span class="required">*</span></label>
			<input type="text" name="nmcompleto" id="nmcompleto" class="form-control" value="'.$result["nome"].'" disabled >
          <label for="email">Usuário <span class="required">*</span></label>
			<input type="text" name="usuario" id="usuario" class="form-control" value="'.$result["usuario"].'" disabled>
	
			 <label for="email">Senha <span class="required">*</span></label>	
			<input type="password" name="Senha" id="Senha" class="form-control" >
		
		
			<img class="aligncenter" width="20%" height="90%" src="img/usuario/'.$result["imgusu"].'" alt="">
			
			<input type="hidden" class="form-control" id="idlogin"  name="idlogin" value="'.$result["idlogin"].'">	
			<input type="hidden" class="form-control" id="imgusu"  name="imgusu" value="'.$result["imgusu"].'">	
				
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					<button type="submit" class="btn btn-warning" id="button">Alterar</button>
			 
				</form>
			</div>
			  
			</div>
		  </div>
		</div>  
			<!-- FIM DO MODAL EDITAR --> 
			
			
			
			  <!-- MODAL EXCLUIR -->
			  
		<div class="modal fade" id="excluirModal'. $result["idlogin"].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
		  <div class="modal-dialog" role="document">
			<div class="modal-content">
			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="exampleModalLabel">Confirmar Exclusão? </h4>
			  </div>
			<div class="modal-body">
				<form method="POST" action="class/excluirUsu.class.php" enctype="multipart/form-data">
								
					<div class="form-group">
					<label for="recipient-name" class="control-label">Usuário(*)</label>
					<input type="text" class="form-control" id="usuario" name="usuario" value="'.$result["usuario"].'" disabled>
						
				  </div>
			  
					
					<input type="hidden" class="form-control" id="idlogin"  name="idlogin" value="'.$result["idlogin"].'">
					<input type="hidden" class="form-control" id="img1"  name="img1" value="'.$result["imgusu"].'">
				
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