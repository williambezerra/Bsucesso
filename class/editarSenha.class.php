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
include_once "criptSenha.class.php";

// puxo todas a variaves

$idlogin 	= $_POST['idlogin'];
$senha 	    = $_POST['Senha'];



 
 //verifico o preenchimento
if( empty( $senha) )
{
		msg("Preencha os campos obrigatorios(*)");
}

else{
 									
	mysqli_query($conn, "UPDATE login SET senha='".crypt_password($senha)."' where idlogin='$idlogin'")  or die(mysqli_error($conn));
											
	msg("Alteração realizada com sucesso.");	
								
}


?>