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
$idproduto     = setPost("idproduto");


 
 //verifico o preenchimento
if( empty( $idproduto)  )
{
		echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='reset' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Preencha os campos obrigatorios(*).
                  </div>";
}

else{
 

			//VERIFICA A EXISTENCIA DA CATEGORIA PELO NOME 
		$recebeDB = mysqli_query($conn, "SELECT linkimagem1 FROM produto WHERE idproduto ='".$idproduto."'") or die (mysqli_error($conn));
		$dbImg =  mysqli_fetch_array($recebeDB);
		$verifica = $dbImg['linkimagem1'];
		
				// Script para deletar arquivos
		// unlink -> função do php para deletar arquivo 
		$arquivo = "../img/produto/".$verifica ;
		if (!unlink($arquivo))
		{
			msg("Erro ao deletar Imagem: $arquivo.");	
		}
		else
		{
			msg("Imagem deletada: $arquivo com sucesso!");	
			
		}


			mysqli_query($conn, "delete from produto where idproduto ='$idproduto' ")  or die(mysql_error($conn));
	 
				msg("Exclusão realizada com sucesso.");	
					
					/*echo "<div class='alert alert-success alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4>	<i class='icon fa fa-check'></i> Sucesso!</h4>
                    Alteração realizada com sucesso.
                  </div>";*/
		
	}

?>