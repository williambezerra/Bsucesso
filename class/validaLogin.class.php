<?PHP

if(!isset($_SESSION)){session_start();}
//session_start();

//sleep(1);

include_once ("mysql.class.php");
include_once "criptSenha.class.php";

$usuario		= setPost("login");
$senha           = setPost("senha");

$usuario  = mb_strtoupper($usuario);


//BUSCA NO BANDO FISCALIZECENTER OS DADOS DE USUARIO E BANCO              '".crypt_password($senha)."'"

//$query = "SELECT  *	FROM login	WHERE usuario = '".$usuario."' AND senha = '".crypt_password($senha)."' ";
$buscaLogin		= mysqli_query($conn, "SELECT  *	
										FROM login	WHERE usuario = '".$usuario."' AND senha = '".crypt_password($senha)."' " ) or die (mysqli_error($conn));

								$verificaLoginSet	=  mysqli_num_rows ($buscaLogin );
								$recebidfunc =  mysqli_fetch_array($buscaLogin);
									
									$idlogin = $recebidfunc['idlogin'];
									$nivel = $recebidfunc['nivel'];

	
if( empty( $usuario ) or empty( $senha ) ){
	
	echo " <div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Preencha todos os campos.
                  </div>";
	session_destroy();
		
}else if( $verificaLoginSet <= 0 || $idlogin <=0 ){
	
	echo " <div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Login ou Senha invalidos.
                  </div>";
	session_destroy();
		
}

else{
	
	if(!isset( $_SESSION['logado'] ) ){
				
			
		$usuario = mb_strtoupper($usuario); // DEIXA O USUARIO EM CAIXA ALTA
		
		//sessao do tempo para expirar 
		$tempolimite = 120; // equivalente a segundos
		$_SESSION['registro'] = time();
		$_SESSION['limite'] = $tempolimite;
		$_SESSION['logado']		= 1;

		$_SESSION['user']		= $usuario;
		$_SESSION['idusuario']   = $idlogin;
		$_SESSION['nivel']   = $nivel;

			
		
		redirecione("../Bsucesso/gerenciador.php");
		
		
	}else{
		
		redirecione("../Bsucesso/index.php");
			
	}
	
}

?>