<?PHP
$nome = $_POST["nome_arquivo"];
$codigo = '<html>'.$_POST["codigo_do_arquivo"].'</html>'; // Faça outra concatenação com o código HTML

$dir_arq = $nome.'.html'; // Isso é uma concatenação

if (file_exists($dir_arq)) {
  echo "O arquivo \"$dir_arq\" já existe."; // Usa a variável que você já criou com o nome do arquivo
} 
else {
	
  $arq = fopen("$dir_arq", "x+");
  if(fwrite($dir_arq,$codigo)){ // Aqui você tinha usado a variável errada $arq em vez de $dir_arq
    echo "Arquivo criado com sucesso!";
  } else {
    echo "erro ao criar o arquivo";
  }
  
}
?>