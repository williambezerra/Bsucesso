<?PHP

if(!isset($_SESSION)){session_start();}

# DADOS DO MYSQL
	$host				= "localhost";
	$user				= "root";	
	$password			= "mysql";
	$db					= "bsucesso";


	/* ================================================================================================== */
	//header('Content-Type: text/html; charset=utf-8');

	$conn = mysqli_connect($host, $user, $password, $db);
	
	//$select				= mysqli_select_db($conexao, $db);

	//mysql_query("SET NAMES 'utf8'");
	//mysql_query('SET character_set_connection=utf8');
	//mysql_query('SET character_set_client=utf8');
	//mysql_query('SET character_set_results=utf8');

	/*if( $conexao <= "" ){
		die( "<div class='alert alert-danger alert-dismissable'>
						<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
						<h4><i class='icon fa fa-ban'></i> MYSQL</h4>
						Não foi possivel se connectar com banco de dados!
					  </div>" );
		
	}else if( $select <= 0 ){
		die( " <div class='alert alert-danger alert-dismissable'>
						<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
						<h4><i class='icon fa fa-ban'></i> MYSQL</h4>
						Não foi possivel selecionar o banco de dados!
					  </div>" );
		
	}
*/


?>