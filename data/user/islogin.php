<?php
    require_once("../init.php");
    session_start();
    @$uid=$_SESSION["uid"];
    @$uemail=$_SESSION["uemail"];
    if($uid){
        $sql="SELECT uemail,uid from shop_user where uid=$uid";
        $result=mysqli_query($conn,$sql);
        $data=mysqli_fetch_assoc($result);
        echo json_encode(["ok"=>1,"data"=>$data]);
    }else{
        echo json_encode(["ok"=>0]);
    }
?>