<?PHP
/*
	@ ARQUIVO PARA ALTERAR SENHA DO USUARIOA POR ELE MESMO
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

$senha 			= setPost("senha");
$Csenha 		= setPost("csenha");

$idlogin = 	$_SESSION['idusuario'];
 
 //verifico o preenchimento
if(empty( $senha) || empty( $Csenha))
{
				echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='reset' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                  Preencha os campos obrigatorios(*)
                  </div>";
				  
}

else{
 
	if($senha != $Csenha){
		
				echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='reset' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    As senhas devem ser iguais!
                  </div>";
				
	}
	else{
		
		mysqli_query($conn, "UPDATE login SET senha='".crypt_password($senha)."' where idlogin='$idlogin'")  or die(mysqli_error($conn));

														 		
					echo "<div class='alert alert-success alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4>	<i class='icon fa fa-check'></i> Sucesso!</h4>
                  Alteração realizada com sucesso
                  </div>";		
	
									
	}
}


?>