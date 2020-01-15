<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-users"></i> Voucher Management
        <small>Add, Edit, Delete</small>
      </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12 text-right">
                <div class="form-group">
                    <a class="btn btn-primary" href="<?php echo base_url(); ?>voucher/addNew"><i class="fa fa-plus"></i> Add New</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                    <h3 class="box-title">Voucher List</h3>
                    <div class="box-tools">
                        <form action="<?php echo base_url() ?>voucher" method="POST" id="searchList">
                            <div class="input-group">
                              <input type="text" name="searchText" value="<?php echo $searchText; ?>" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                              <div class="input-group-btn">
                                <button class="btn btn-sm btn-default searchList"><i class="fa fa-search"></i></button>
                              </div>
                            </div>
                        </form>
                    </div>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                    	<th>No</th>
                        <th>Code</th>
                        <th>Nominal</th>
                        <th>Note</th>
                        <th>Status</th>
                        <th class="text-center">Actions</th>
                    </tr>
                    <?php
                    if(!empty($voucherRecords))
                    {
                    	$i=1;
                        foreach($voucherRecords as $record)
                        {
                    ?>
                    <tr>
                    	<td><?php echo $i ?></td>
                        <td><?php echo $record->code ?></td>
                        <td><?php echo 'Rp. '.number_format($record->nominal,2,',','.'); ?></td>
                        <td><?php echo $record->note ?></td>
                        <td><?php echo ($record->isUsed==0)?'Available':'Used'; 


                            ?>   
                        </td>
                        <td class="text-center">
                            <a class="btn btn-sm btn-danger" href="<?php echo base_url().'voucher/deleteVoucher/'.$record->voucherId; ?>" title="Delete"><i class="fa fa-trash"></i></a>
                        </td>
                    </tr>
                    <?php
                        $i++;
                        }
                    }
                    ?>
                  </table>
                  
                </div><!-- /.box-body -->
                <div class="box-footer clearfix">
                    <?php echo $this->pagination->create_links(); ?>
                </div>
              </div><!-- /.box -->
            </div>
        </div>
    </section>
</div>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/deleteContact.js" charset="utf-8"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){
        jQuery('ul.pagination li a').click(function (e) {
            e.preventDefault();            
            var link = jQuery(this).get(0).href;            
            var value = link.substring(link.lastIndexOf('/') + 1);
            jQuery("#searchList").attr("action", baseURL + "contact/" + value);
            jQuery("#searchList").submit();
        });
    });
</script>
