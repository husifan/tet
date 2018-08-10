<?php
    //根据is_check查询价格，如果is_check=1,则显示价格,用来计算勾选后的价格
    require_once("../init.php");
    session_start();
    @$uid=$_SESSION["uid"]; 
    // @$is_check=$_REQUEST['is_check'];
    // $sql="SELECT s.uid,s.count,s.shop_id,d.sdname,d.sdprice,d.sdcount,d.sdid FROM shop_details as d, shop_cart as s WHERE is_check=1 AND shop_id=sdid";
    $sql="SELECT is_check FROM shop_cart WHERE uid=$uid";
    $result=mysqli_query($conn,$sql);
    $output=mysqli_fetch_all($result,1);
    echo json_encode($output);
?>
