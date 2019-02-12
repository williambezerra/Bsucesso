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
$nmcategoria     = setPost("categoria");
$descricategoria = setPost("descricao");
		

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
 	$recebenmcategoria = mysqli_query($conn, "SELECT nmcategoria FROM categoria WHERE nmcategoria ='".$nmcategoria."'") or die (mysqli_error($conn));
	$dbnmcategoria =  mysqli_fetch_array($recebenmcategoria);
	$verificadado = $dbnmcategoria['nmcategoria'];


		if($verificadado == $nmcategoria){
		
		echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Categoria já existente!
                  </div>";
		
		}
		else{		
		//SE  A CATEGORIA NAO EXISTE, CASDASTRA NOVA 	
	
				mysqli_query($conn, "insert into categoria(nmcategoria, descategoria)
				values ('$nmcategoria', '$descricategoria')")  or die(mysql_error($conn));
	 
														 		
					echo "<div class='alert alert-success alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4>	<i class='icon fa fa-check'></i> Sucesso!</h4>
                    Cadastro realizado com sucesso.
                  </div>";
		}
	}

?>