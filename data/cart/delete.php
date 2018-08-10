<?php
    require_once("../init.php");
    @$shop_id = $_REQUEST['shop_id'];
    $sql="DELETE  FROM  shop_cart  WHERE  shop_id='$shop_id'";
    $result=mysqli_query($conn,$sql);
    $count=mysqli_affected_rows($conn);
    if($count!=0){
        echo json_encode(["ok"=>1,"msg"=>"SUCCESS DELETE"]);
    }else{
        echo json_encode(["ok"=>0,"msg"=>"DEFAULT DELETE"]);
    }
?>