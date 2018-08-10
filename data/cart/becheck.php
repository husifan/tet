<?php
    //全选，不管有没有勾选，全部改成勾选
    require_once("../init.php");
    @$is_check=$_REQUEST['is_check'];
    $sql="UPDATE shop_cart SET is_check=1 WHERE is_check=0";
    $result=mysqli_query($conn,$sql);
    $count=mysqli_affected_rows($conn);
    echo json_encode($count);
?>