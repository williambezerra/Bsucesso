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