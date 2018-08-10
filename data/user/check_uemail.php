<?php
    require_once("../init.php");
    @$uemail=$_REQUEST['email'];
    $sql="SELECT uemail FROM shop_user WHERE uemail='$uemail'";
    $result=mysqli_query($conn,$sql);
    if(!$result){
        echo('{"code":500,"msg":"please check your emails"}');
    }else{
        $row=mysqli_fetch_all($result,1);
        if(!$row){
            echo('{"code":200, "msg":"non-exists"}');
        }else{
            echo('{"code":201, "msg":"have be exists"}');
        }
    }
?>