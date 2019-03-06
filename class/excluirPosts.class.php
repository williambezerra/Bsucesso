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
$idposts     = setPost("idposts");


 
 //verifico o preenchimento
if( empty( $idposts)  )
{
		echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='reset' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Preencha os campos obrigatorios(*).
                  </div>";
}

else{
 

			//VERIFICA A EXISTENCIA DA CATEGORIA PELO NOME 
		$recebeDB = mysqli_query($conn, "SELECT linkimage FROM posts WHERE idposts ='".$idposts."'") or die (mysqli_error($conn));
		$dbImg =  mysqli_fetch_array($recebeDB);
		$verifica = $dbImg['linkimage'];
		
				// Script para deletar arquivos
		// unlink -> função do php para deletar arquivo 
		$arquivo = "../img/posts/".$verifica ;
		if (!unlink($arquivo))
		{
			msg("Exclusão não realizada! Verifique os dados.");	
		}
		else
		{
			msg("Imagem : $arquivo, deletada com sucesso!");	
			
			mysqli_query($conn, "delete from posts where idposts ='$idposts' ")  or die(mysql_error($conn));
	 
				msg("Exclusão realizada com sucesso.");	
					
					/*echo "<div class='alert alert-success alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4>	<i class='icon fa fa-check'></i> Sucesso!</h4>
                    Alteração realizada com sucesso.
                  </div>";*/
			
		}



		
	}

?>