<?PHP
/*
	@ ARQUIVO PARA VALIDAR EDITAR CATEGORIAS 
	@ PROJETO - BIBLIOTECA DE SUCESSO V.1
	@ TODOS OS DIREITOS RESERVADOS
	@ CRÉDITOS : WILLIAM BEZERRA
	@ CONTATO - WILLIAMBEZERRADESOUSA@GMAIL.COM

*/
if(!isset($_SESSION)){session_start();}

sleep(1);

include_once "mysql.class.php";

// puxo todas a variaves
$idcategoria     = setPost("idcategoria");


 
 //verifico o preenchimento
if( empty( $nmcategoria)  )
{
		echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='reset' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Preencha os campos obrigatorios(*).
                  </div>";
}

else{
 

	//VERIFICA A EXISTENCIA DA CATEGORIA PELO NOME 
 	$recebeidcategoria = mysqli_query($conn, "SELECT fkcategoria FROM produto WHERE fkcategoria ='".$idcategoria."'") or die (mysqli_error($conn));
	$dbidcategoria =  mysqli_fetch_array($recebeidcategoria);
	$verificadado = $dbidcategoria['idcategoria'];


		if($verificadado == $idcategoria){
		
		
					msg("Não foi possivel excluir! Categoria está vinculada ao um produto.");
		/*echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Categoria já existente!
                  </div>";*/
		
		}
		else{		
		//SE  A CATEGORIA NAO EXISTE, CASDASTRA NOVA 	
	
				mysqli_query($conn, "delete from categoria where idcategoria='$idcategoria' ")  or die(mysql_error($conn));
	 
					msg("Exclusão realizada com sucesso.");	
					
					/*echo "<div class='alert alert-success alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4>	<i class='icon fa fa-check'></i> Sucesso!</h4>
                    Alteração realizada com sucesso.
                  </div>";*/
		}
	}

?>