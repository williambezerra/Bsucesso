<!DOCTYPE html>
<html >
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>Bibliotea de Sucesso</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Ruda:400,900,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/prettyphoto/css/prettyphoto.css" rel="stylesheet">
  <link href="lib/hover/hoverex-all.css" rel="stylesheet">
  <link href="lib/jetmenu/jetmenu.css" rel="stylesheet">
  <link href="lib/owl-carousel/owl-carousel.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="css/colors/blue.css">  
  


  <!-- =======================================================
    Template Name: MaxiBiz
    Template URL: https://templatemag.com/maxibiz-bootstrap-business-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
  
      <script src="site/js/jquery.api.js"></script>
    <script type="text/javascript">
    
	$(function(){
 
    $("#btn").click(function(){
 
        var a = $("input[name=user]").val();
        var b = $("input[name=password]").val();
 
        $.ajax({
             
            type: "POST",
            data: { login:a, senha:b },
             
            url: "class/validaLogin.class.php",
            dataType: "html",
            success: function(result){
                $("#ok").html('');
                $("#ok").append(result);
            },
            beforeSend: function(){
                $('#loading').css({display:"block"});
            },
            complete: function(msg){
                $('#loading').css({display:"none"});
            }
        });
         
    });
    });
    
    </script>
  
  
</head>

<body>	

  <section class="section1">
    <div class="container clearfix">
      <div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
        <div class="col-lg-6 col-md-6 col-sm-12">
          <h4 class="title">
                    	<span>Bem Vindo!</span>
                    </h4>
         <!-- <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"s standard dummy text ever since the 1500s.</p>
          <p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
          <p class="withpadding">Still not registered? <a href="#">Click Here</a> to register now.</p> -->
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12">
          <h4 class="title">
                    	<span>Dados de Login</span>
                    </h4>
          <form method="post" >
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" name="user" >
              </div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control" name="password">
              </div>
            </div>
            <div class="form-group">

			  
			 <p><center><div id="loading" style="display: none;"><img src="loading.gif"></div> <div id="ok"></div></center>
			  
            </div>
            <div class="form-group">

              <input type="button" value="ACESSAR" id="btn" > 
			 

            </div>
          </form>
		  
		  
		    <form method="post">
          <div class="form-group has-feedback">
            <input type="text" class="form-control" id="username" name="user" required>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" id="password" name="password" required>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
         
            <div class="col-xs-12">
              <input type="button" value="ACESSAR" id="btn" class="btn btn-primary btn-block btn-flat">
            </div><!-- /.col -->
          </div>
        </form>
		
        </div>
        <!-- end login -->
      </div>
      <!-- end content -->
    </div>
    <!-- end container -->
  </section>
  <!-- end section -->

  </body>
</html>