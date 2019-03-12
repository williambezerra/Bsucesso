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
$idlogin     = setPost("idlogin");
$image     = setPost("img1");


 
 //verifico o preenchimento
if( empty( $idlogin)  )
{
		echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='reset' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Preencha os campos obrigatorios(*).
                  </div>";
}

else{
 

	//VERIFICA A EXISTENCIA RELACIONAMENTO NA TABELA PRODUTO 
 	$recebeidcategoria = mysqli_query($conn, "SELECT fklogin FROM produto WHERE fklogin ='".$idlogin."'") or die (mysqli_error($conn));
	$dbidcategoria =  mysqli_fetch_array($recebeidcategoria);
	$verificadadoP = $dbidcategoria['fklogin'];


		//VERIFICA A EXISTENCIA RELACIONAMENTO NA TABELA BLOG
 	$recebeidcategoria = mysqli_query($conn, "SELECT fklogin FROM blog WHERE fklogin ='".$idlogin."'") or die (mysqli_error($conn));
	$dbidcategoria =  mysqli_fetch_array($recebeidcategoria);
	$verificadadoB = $dbidcategoria['fklogin'];

	
		if($verificadadoP == $idlogin || $verificadadoB == $idlogin){
		
		
					msg("Não foi possivel excluir! Usuário vinculado.");
		/*echo "<div class='alert alert-danger alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4><i class='icon fa fa-ban'></i> Erro</h4>
                    Categoria já existente!
                  </div>";*/
		
		}
		else{		
		//SE  A CATEGORIA NAO EXISTE, CASDASTRA NOVA 	
	
				mysqli_query($conn, "delete from login where idlogin='$idlogin' ")  or die(mysql_error($conn));
	 
	 
					if($image !="fun2.png"){
						$arquivo = "../img/usuario/".$image ;					
						unlink($arquivo);
					}
					
					msg("Exclusão realizada com sucesso.");	
					
					/*echo "<div class='alert alert-success alert-dismissable'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
                    <h4>	<i class='icon fa fa-check'></i> Sucesso!</h4>
                    Alteração realizada com sucesso.
                  </div>";*/
		}
	}

?>