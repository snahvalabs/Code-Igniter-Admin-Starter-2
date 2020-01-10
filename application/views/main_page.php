<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>CIAS2 | Main Page</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="<?php echo base_url(); ?>assets/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url(); ?>assets/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url(); ?>assets/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  </head>
  <body class="hold-transition login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="#"><b>Kartu</b>Hore</a>
        <img class="profile-user-img img-responsive img-circle" src="<?php echo base_url(); ?>assets/dist/img/logo.png" alt="User profile picture">
      </div><!-- /.login-logo -->


      <div class="login-box-body">
      <center>
          <a href="<?php echo base_url() ?>registrasi">Registrasi</a>   |   <a href="<?php echo base_url() ?>login">Login</a><br>

        <form>
            <input type="button"  value="Registration" onclick="window.location.href='<?php echo base_url().'registration';?>'" />
            <input type="button" class="btn btn-primary btn-block btn-flat btn-color" value="Login" onclick="window.location.href='<?php echo base_url().'login';?>'" />
        </form>
      </center>
      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

    <script src="<?php echo base_url(); ?>assets/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="<?php echo base_url(); ?>assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
  </body>
</html>