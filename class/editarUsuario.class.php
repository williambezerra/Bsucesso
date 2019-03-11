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
$nmcompleto 	= $_POST['nmcompleto'];
$usuario 		= $_POST['usuario'];
$Senha 			= $_POST['Senha'];
$Csenha 		= $_POST['Csenha'];
$email 			= $_POST['email'];
$nivel 			= $_POST['nivel'];
$img1 			= $_FILES['img1']['name'];
	

//transforma tudo em caixa alta		
$usuario  = mb_strtoupper($usuario);
$email  = mb_strtoupper($email);



 
 //verifico o preenchimento
if( empty( $nmcompleto) || empty( $usuario) || empty( $Senha) || empty( $Csenha) || empty( $nivel) )
{
		
		msg("Preencha os campos obrigatorios(*)");
		/*echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='reset' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Preencha os campos obrigatorios(*).
                  </div>"; */
}

else{
 
	if($Senha != $Csenha){
		
		msg("As senhas devem ser iguais!");
		
	}
	else{

		//VERIFICA A EXISTENCIA DA CATEGORIA PELO NOME 
		$recebeusuario = mysqli_query($conn, "SELECT idlogin, usuario FROM login WHERE usuario ='".$usuario."'") or die (mysqli_error($conn));
		$dbusuario =  mysqli_fetch_array($recebeusuario);
		$verificadado = $dbusuario['idlogin'];

		if($verificadado != $idlogin){
		
		
				msg("Usuário já cadastrado!");
		
		/*echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Produto já cadastrado!
                  </div>";*/
		
		}
		else{		
		//SE  O PRODUTO NAO EXISTE, CASDASTRA NOVO

			
			//VERFICAÇÃO PARA O UPLOAD DE IMAGEM
			$arquivo 	= $_FILES['img1']['name'];
			
			//Pasta onde o arquivo vai ser salvo
			$_UP['pasta'] = '../img/usuario/';
			
			//Tamanho máximo do arquivo em Bytes
			$_UP['tamanho'] = 1024*1024*100; //5mb
			
			//Array com a extensões permitidas
			$_UP['extensoes'] = array('png', 'jpg', 'jpeg', 'gif');
			
			//Renomeiar
			$_UP['renomeia'] = false;
			
			//Array com os tipos de erros de upload do PHP
			$_UP['erros'][0] = 'Não houve erro';
			$_UP['erros'][1] = 'O arquivo no upload é maior que o limite do PHP';
			$_UP['erros'][2] = 'O arquivo ultrapassa o limite de tamanho especificado no HTML';
			$_UP['erros'][3] = 'O upload do arquivo foi feito parcialmente';
			$_UP['erros'][4] = 'Não foi feito o upload do arquivo';
			
			//Verifica se houve algum erro com o upload. Sem sim, exibe a mensagem do erro
			if($_FILES['img1']['error'] != 0){
				die("Não foi possivel fazer o upload, erro: <br />". $_UP['erros'][$_FILES['img1']['error']]);
				exit; //Para a execução do script
			}
			
			//Faz a verificação da extensao do arquivo
			$extensao = strtolower(end(explode('.', $_FILES['img1']['name'])));
			if(array_search($extensao, $_UP['extensoes'])=== false){		
				
				msg("A imagem não foi cadastrada extesão inválida.");
				
					/*echo " <div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    A imagem não foi cadastrada extesão inválida.
                  </div>";*/
				

			}
			
			//Faz a verificação do tamanho do arquivo
			else if ($_UP['tamanho'] < $_FILES['img1']['size']){
				
				msg("Arquivo muito grande.");
				
            /*	echo " <div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Arquivo muito grande.
                  </div>";*/
				
			}
			
			//O arquivo passou em todas as verificações, hora de tentar move-lo para a pasta foto
			else{
				//Primeiro verifica se deve trocar o nome do arquivo
				if($_UP['renomeia'] == true){
					//Cria um nome baseado no UNIX TIMESTAMP atual e com extensão .jpg
					$nome_final = time().'.jpg';
				}else{
					//mantem o nome original do arquivo
					$nome_final = $_FILES['img1']['name'];
				}
				//Verificar se é possivel mover o arquivo para a pasta escolhida
				if(move_uploaded_file($_FILES['img1']['tmp_name'], $_UP['pasta']. $nome_final)){
					//Upload efetuado com sucesso, exibe a mensagem


		if(empty($img1)){
			
				mysqli_query($conn, "UPDATE login SET nome='$nmcompleto', usuario='$usuario',
					email='$email', nivel='$nivel' where idlogin='$idlogin' ")  or die(mysqli_error($conn));
					
						msg("Alteração realizada com sucesso.");	
		}	
		else{
			
			mysqli_query($conn, "UPDATE login SET nome='$nmcompleto', usuario='$usuario',
					email='$email', nivel='$nivel', imgusu='$nome_final' 
						where idlogin='$idlogin'")  or die(mysqli_error($conn));
						
						msg("Alteração realizada com sucesso.");	
		}		
	

	 
	
					
					/*echo "<div class='alert alert-success alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4>	<i class='icon fa fa-check'></i> Sucesso!</h4>
                    Cadastro realizado com sucesso.
                  </div>";*/
										
					
				}else{
					//Upload não efetuado com sucesso, exibe a mensagem
					
				msg("Imagem não foi cadastrada com Sucesso.");	
				
					/*echo " <div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Imagem não foi cadastrada com Sucesso.
                  </div>";*/

				}
			}
				

		}
	}
}











if(!isset($_SESSION)){session_start();}

sleep(1);

include_once "mysql.class.php";

// puxo todas a variaves
$idcategoria     = setPost("idcategoria");
$nmcategoria     = setPost("nmcategoria");
$descricategoria = setPost("descategoria");
		

//transforma tudo em caixa alta		
$nmcategoria      = mb_strtoupper($nmcategoria);
$descricategoria  = mb_strtoupper($descricategoria);


 
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
 	$recebeidcategoria = mysqli_query($conn, "SELECT idcategoria,nmcategoria FROM categoria WHERE nmcategoria ='".$nmcategoria."'") or die (mysqli_error($conn));
	$dbidcategoria =  mysqli_fetch_array($recebeidcategoria);
	$verificadado = $dbidcategoria['idcategoria'];


		if($verificadado != $idcategoria){
		
		
					msg("Categoria já existente!");
		/*echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Categoria já existente!
                  </div>";*/
		
		}
		else{		
		//SE  A CATEGORIA NAO EXISTE, CASDASTRA NOVA 	
	
				mysqli_query($conn, "update categoria set nmcategoria='$nmcategoria', descategoria='$descricategoria'
									where idcategoria='$idcategoria' ")  or die(mysql_error($conn));
	 
					msg("Alteração realizada com sucesso.");	
					
					/*echo "<div class='alert alert-success alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4>	<i class='icon fa fa-check'></i> Sucesso!</h4>
                    Alteração realizada com sucesso.
                  </div>";*/
		}
	}

?>