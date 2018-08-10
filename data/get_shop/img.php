<?php
    require_once("../init.php");
    @$siid=$_REQUEST['siid'];
    $sql="SELECT siid,sism,sidm,sibm FROM shop_imgs WHERE siid=$siid";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_assoc($result);
    echo json_encode($row);
?>