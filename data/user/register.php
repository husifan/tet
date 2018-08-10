<?php
	require_once("../init.php");
	@$upwd=$_REQUEST["upwd"];
    @$uemail=$_REQUEST["uemail"];
    $sql="SELECT uemail FROM shop_user WHERE uemail='$uemail'";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_row($result);
    //var_dump($row);
    if($row==null){
        if($uemail!=""&$upwd!=""){
            $sql="INSERT INTO shop_user(upwd,uemail) values('$upwd','$uemail')";
            $result=mysqli_query($conn,$sql);
            echo '{"code":1,"msg":"REGISTER IS SUCCESS"}';
        }else{
            echo '{"code":-1,"msg":"REGISTER IS FAIL"}';
        }
    }else{
        echo '{"code":-1,"msg":"UEMAIL IS EXIST"}';
    }
?>