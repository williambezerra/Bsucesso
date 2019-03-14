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
$idblog     = setPost("idblog");


 
 //verifico o preenchimento
if( empty( $idblog)  )
{
		echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='reset' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Preencha os campos obrigatorios(*).
                  </div>";
}

else{
 

			//VERIFICA A EXISTENCIA DA CATEGORIA PELO NOME 
		$recebeDB = mysqli_query($conn, "SELECT linckimagem1blog, titulo FROM blog WHERE idblog ='".$idblog."'") or die (mysqli_error($conn));
		$dbImg =  mysqli_fetch_array($recebeDB);
		$verifica = $dbImg['linckimagem1blog'];
		$verificahtml = $dbImg['titulo'];

		// VERIFICA OS COMENTARIOS PARA EXCLUIR
		$recebeCom = mysqli_query($conn, "SELECT fkartigo FROM comentarios WHERE fkartigo ='".$idblog."'") or die (mysqli_error($conn));
		$dbCom =  mysqli_fetch_array($recebeCom);
		$verificaCom = $dbCom['fkartigo'];


		
		// Script para deletar arquivos
		// unlink -> função do php para deletar arquivo 
		$arquivo = "../img/blog/".$verifica ;
		$arquivoHtml  = "../pages/".$verificahtml.".html";
		if (!unlink($arquivo) )
		{
			msg("Exclusão não realizada! Verifique os dados.");	
		}
		else
		{
			if($verificaCom !=0){
				
				unlink($arquivoHtml);
				msg("Imagem : $arquivo, deletada com sucesso!");	
				msg("HTML : $arquivoHtml, deletada com sucesso!");	
				mysqli_query($conn, "delete from comentarios where fkartigo ='$idblog' ")  or die(mysql_error($conn));
				mysqli_query($conn, "delete from blog where idblog ='$idblog' ")  or die(mysql_error($conn));
					msg("Exclusão realizada com sucesso.");					
			}
			else{
			
				unlink($arquivoHtml);
				msg("Imagem : $arquivo, deletada com sucesso!");	
				msg("HTML : $arquivoHtml, deletada com sucesso!");	
				
					mysqli_query($conn, "delete from blog where idblog ='$idblog' ")  or die(mysql_error($conn));
					msg("Exclusão realizada com sucesso.");	
			}	
	
		}



		
	}

?>