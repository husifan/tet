<?php
    require_once("../init.php");
    //所需数据：根据商品ID和用户名ID查询出购物车内商品的价格 缩略图 购买数量以及库存剩余数量
    session_start();
    @$uid=$_SESSION["uid"]; 
    $sql="SELECT s.uid,s.count,s.is_check,s.shop_id,d.sdname,d.sdprice,d.sdpic,d.sdcount,d.sdid FROM shop_details as d, shop_cart as s WHERE uid=$uid and s.shop_id=d.sdid ";
    $result=mysqli_query($conn,$sql);
    $output=mysqli_fetch_all($result,1);
    //var_dump($output);
    echo json_encode($output);
?>