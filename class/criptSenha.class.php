<?php

function crypt_password($senha){
$salt = md5("0x00ff99c");
$codifica = crypt($senha,$salt); # Primeira criptografia com 64 Bits
$codifica = hash('sha512',$codifica); # Segunda criptografia com 128 Bits
return $codifica;

}


?>