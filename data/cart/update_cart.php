<?php
    require_once("../init.php");
    @$count = intval($_REQUEST['count']);
    @$shop_id = intval($_REQUEST['shop_id']);
    $sql="UPDATE shop_cart SET count=$count WHERE shop_id=$shop_id";
    $result=mysqli_query($conn,$sql);
    $count=mysqli_affected_rows($conn);
    if($count=1){
        echo json_encode(["ok"=>1,"msg"=>"SECCESS TO UPDATE"]);
    }else{
        echo json_encode(["ok"=>0,"msg"=>"DEFAULT TO ADD CART"]);
    }
    /* 
    数据库的字符类型错误
    <b>Warning</b>:  mysqli_error() expects parameter 1 to be mysqli, string given in <b>C:\xampp\htdocs\00---Koenigsegg\data\cart\add.php</b> on line <b>8</b><br />
    <br />
    <b>Warning</b>:  mysqli_error() expects parameter 1 to be mysqli, boolean given in <b>C:\xampp\htdocs\00---Koenigsegg\data\cart\add.php</b> on line <b>10</b><br />
    <br />*/
?>