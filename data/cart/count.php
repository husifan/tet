<?php
    require_once("../init.php");
    //所需数据：根据商品ID查出购物车内商品的剩余库存
    session_start();
    @$sdid=$_REQUEST['shop_id']; 
    $sql="SELECT sdcount FROM shop_details WHERE sdid='$sdid'";
    $result=mysqli_query($conn,$sql);
    $row=mysqli_fetch_assoc($result);
    echo json_encode($row);
?>