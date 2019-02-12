<?PHP

	

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

# FORMATA VARIÀVEIS GLOBAIS POST & GET

function setPost($str){
	$str	=   $_POST[$str];
	return $str;	
	
}

function setGET($str){
	$str	= $_GET[$str];
	return $str;	
	
}

function replace($src, $nova, $var){
	$format	= str_replace($src, $nova, $var);
	return $format;
}

# FORMATA MENSAGENS & REDIRECIONAMENTOS

function msg($str){
	$str	= "<script>alert('".$str."');history.back(1);</script>";
	echo $str;
	
}

function redirecione($str){
	$str	= "<script>window.location='".$str."'</script>";
	echo $str;
	
}
/*
# FORMATA FUNÇÕES DO MYSQL

function query($str){
	
	# SUBSTITUI A FUNÇÃO MYSQL_QUERY   //  EXEMPLO DE USO Query(STRING);
	
	$str	= mysqli_query($conn, $str);
	return $str;
	
}

function nRows($str){
	
	# SUBSTITUI A FUNÇÃO MYSQL_NUM_ROWS   //  EXEMPLO DE USO nRows(STRING);
	
	$str	= mysqli_num_rows($str);
	return $str;
	
}

function afRows($str){
	
	# SUBSTITUI A FUNÇÃO MYSQL_AFFECTED_ROWS   //  EXEMPLO DE USO afRows(STRING);
	
	$str	= mysqli_affected_rows($str);
	return $str;
	
}



function fetArray($str){
	
	# SUBSTITUI A FUNÇÃO MYSQL_FETCH_ARRAY   //  EXEMPLO DE USO fetArray(STRING);
	
	$str	= mysqli_fetch_array($str);
	return $str;
	
}
*/
function reformaData($str){
	
	$str = explode("-",$str);
	
	return $str['2'] . " / " . $str['1'] . " / " . $str['0'];

}



?>