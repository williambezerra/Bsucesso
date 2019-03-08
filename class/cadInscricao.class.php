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
$nome     = setPost("nome");
$email = setPost("email");
$interesse = setPost("interesse");
		

 
 //verifico o preenchimento
if( empty( $nome)  || empty($email) )
{	
		msg("Preencha os campos obrigatorios(*). Nome e E-mail");	
}

else{
 

	//VERIFICA A EXISTENCIA DA CATEGORIA PELO NOME 
 	$recebeemail = mysqli_query($conn, "SELECT email FROM inscricao WHERE email ='".$email."'") or die (mysqli_error($conn));
	$dbemail =  mysqli_fetch_array($recebeemail);
	$verificadado = $dbemail['email'];


		if($verificadado == $email){

		msg("Parabéns você já esta inscrito!");			
		
		
		}
		else{		
		//SE  A CATEGORIA NAO EXISTE, CASDASTRA NOVA 	
	
				mysqli_query($conn, "insert into inscricao(nome, email, interesse)
				values ('$nome', '$email', '$interesse')")  or die(mysql_error($conn));
				
			msg("Obrigado pela inscrição!");															 		

		}
	}

?>