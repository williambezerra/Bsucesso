<?PHP
/*
	@ ARQUIVO PARA VALIDAR CADASTRO DE PRODUTO
	@ PROJETO - BIBLIOTECA DE SUCESSO V.1
	@ TODOS OS DIREITOS RESERVADOS
	@ CRÉDITOS : WILLIAM BEZERRA
	@ CONTATO - WILLIAMBEZERRADESOUSA@GMAIL.COM

*/
if(!isset($_SESSION)){session_start();}

sleep(1);

include_once "mysql.class.php";

// puxo todas a variaves

$nmproduto 		= $_POST['nmproduto'];
$idioma 		= $_POST['idioma'];
$facesso 		= $_POST['facesso'];
$formato 		= $_POST['formato'];
$emailsuporte 	= $_POST['emailsuporte'];
$sobrep 		= $_POST['sobrep'];
$img1 			= $_FILES['img1']['name'];
//$img2			= $_FILES['img2']['name'];
$video 			= $_POST['video'];
$venda 			= $_POST['venda'];
$categoria 		= $_POST['categoria'];
$fklogin = 	$_SESSION['idusuario'];
	

//transforma tudo em caixa alta		
$nmproduto      = mb_strtoupper($nmproduto);
$idioma  = mb_strtoupper($idioma);
$facesso  = mb_strtoupper($facesso);
$emailsuporte  = mb_strtoupper($emailsuporte);




 
 //verifico o preenchimento
if( empty( $nmproduto) || empty( $idioma) || empty( $facesso) || empty( $formato) || empty( $emailsuporte) || empty( $sobrep)
		|| empty( $img1) || empty( $venda) || empty($categoria))
{
		
		msg("Preencha os campos obrigatorios(*)");
		/*echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='reset' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Preencha os campos obrigatorios(*).
                  </div>"; */
}

else{
 

	//VERIFICA A EXISTENCIA DA CATEGORIA PELO NOME 
 	$recebeproduto = mysqli_query($conn, "SELECT nmproduto FROM produto WHERE nmproduto ='".$nmproduto."'")  or die (mysqli_error($conn));
	$dbnmproduto =  mysqli_fetch_array($recebeproduto);
	$verificadado = $dbnmproduto['nmproduto'];


		if($verificadado == $nmproduto){
		
		
				msg("Produto já cadastrado!");
		
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
			$_UP['pasta'] = '../img/produto/';
			
			//Tamanho máximo do arquivo em Bytes
			$_UP['tamanho'] = 1024*1024*100; //5mb
			
			//Array com a extensões permitidas
			$_UP['extensoes'] = array('png', 'jpg', 'jpeg', 'gif', 'PNG', 'JPG', 'JPEG', 'GIF');
			
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
					
					
				mysqli_query($conn,"insert into produto(nmproduto, sobre, idioma, formaacesso, formato, emailsuporte, linkimagem1,
						linkvideo, linkvenda, fkcategoria, fklogin)
				values ('$nmproduto', '$sobrep', '$idioma', '$facesso', '$formato', '$emailsuporte',
							'$nome_final', '$video', '$venda', '$categoria', '$fklogin' )")  or die(mysqli_error($conn));
	 
					msg("Cadastro realizado com sucesso.");		
					
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

?>