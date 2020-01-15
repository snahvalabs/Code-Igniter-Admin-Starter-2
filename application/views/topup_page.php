<?php
$name = $saldoInfo->name;
$email = $saldoInfo->email;
$mobile = $saldoInfo->mobile;
$saldo = number_format($saldoInfo->saldo,2,',','.');
$update = $saldoInfo->updateDate;
?>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-user-circle"></i> Top Up
        <small>Add more digital money</small>
      </h1>
    </section>
    
    <section class="content">
    
        <div class="row">
            <!-- left column -->
            <div class="col-md-4">
              <!-- general form elements -->


                <div class="box box-warning">
                    <div class="box-body box-profile">
                        <img class="profile-user-img img-responsive img-circle" src="<?php echo base_url(); ?>assets/dist/img/avatar.png" alt="User profile picture">
                        <h3 class="profile-username text-center">Rp. <?= $saldo ?></h3>

                        <p class="text-muted text-center">Saldo</p>

                        <ul class="list-group list-group-unbordered">
                            <li class="list-group-item">
                                <b>Name</b> <a class="pull-right"><?= $name ?></a>
                            </li>
                            <li class="list-group-item">
                                <b>Email</b> <a class="pull-right"><?= $email ?></a>
                            </li>
                            <li class="list-group-item">
                                <b>Mobile</b> <a class="pull-right"><?= $mobile ?></a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>

            <div class="col-md-4">
              <!-- general form elements -->
                <div class="box box-warning">
                    <div class="box-body box-profile">
                        <h3 class="profile-username text-center">Top Up</h3>

                            <form action="<?php echo base_url() ?>topup/doTopup" method="post" id="doTopup" role="form">
                                <?php $this->load->helper('form'); ?>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-12">                                
                                            <div class="form-group">
                                                <label for="code">Voucher</label>
                                                <input type="text" class="form-control" id="code" name="code"  maxlength="12" />
                                                <input type="hidden" value="<?php echo $userId; ?>" name="userId" id="userId" />    
                                            </div>
                                        </div>
                                    </div>
                                </div><!-- /.box-body -->
                                <div class="box-footer">
                                    <input type="submit" class="btn btn-primary" value="Submit" />
                                    <input type="reset" class="btn btn-default" value="Reset" />
                                </div>
                            </form>


                    </div>
                </div>

            </div>

            <div class="col-md-4">
                <?php
                    $this->load->helper('form');
                    $error = $this->session->flashdata('error');
                    if($error)
                    {
                ?>
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <?php echo $this->session->flashdata('error'); ?>                    
                </div>
                <?php } ?>
                <?php  
                    $success = $this->session->flashdata('success');
                    if($success)
                    {
                ?>
                <div class="alert alert-success alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <?php echo $this->session->flashdata('success'); ?>
                </div>
                <?php } ?>

                <?php  
                    $noMatch = $this->session->flashdata('nomatch');
                    if($noMatch)
                    {
                ?>
                <div class="alert alert-warning alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <?php echo $this->session->flashdata('nomatch'); ?>
                </div>
                <?php } ?>
                
                <div class="row">
                    <div class="col-md-12">
                        <?php echo validation_errors('<div class="alert alert-danger alert-dismissable">', ' <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button></div>'); ?>
                    </div>
                </div>
            </div>
        </div>    
    </section>
</div>

<script src="<?php echo base_url(); ?>assets/js/doTopup.js" type="text/javascript"></script>