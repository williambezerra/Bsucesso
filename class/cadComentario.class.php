<?PHP
/*
	@ ARQUIVO PARA VALIDAR CADASTRO DE CATEGORIAS 
	@ PROJETO - BIBLIOTECA DE SUCESSO V.1
	@ TODOS OS DIREITOS RESERVADOS
	@ CRÉDITOS : WILLIAM BEZERRA
	@ CONTATO - WILLIAMBEZERRADESOUSA@GMAIL.COM

*/
if(!isset($_SESSION)){session_start();}

sleep(1);

include_once "mysql.class.php";

// puxo todas a variaves

$idblog 		= $_POST['idblog'];
$nome 		= $_POST['nome'];
$email 		= $_POST['email'];
$mensagem 		= $_POST['mensagem'];

$data = date('Y-m-d');
 
 //verifico o preenchimento
if( empty( $nome)|| empty( $email) || empty( $mensagem)  )
{
		msg("Preencha os campos obrigatorios(*)");
}

else{
 	
				mysqli_query($conn, "insert into comentarios(nome, email, conteudo,data, fkartigo)
				values ('$nome', '$email', '$mensagem ','$data','$idblog' )")  or die(mysql_error($conn));
	 
														 		
			msg("Valeu pelo comentário!");	
		
	}

?>