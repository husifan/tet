<?php
    // 根据商品的id查询到商品的所有信息
    require_once("../init.php");
    @$sdid=$_REQUEST['sdid'];
    if(!$sdid){
        $sdid=11;
    }
    $output=[
        'details'=>[],
        'family'=>[],
        'picList'=>[]
    ];
    //读取商品信息
    $sql="SELECT * FROM `shop_details` WHERE sdid=$sdid";
    $result=mysqli_query($conn,$sql);
    $output['details']=mysqli_fetch_assoc($result);
    //获取其图片信息
    $sql="SELECT * FROM shop_imgs WHERE shop_id=$sdid ORDER BY siid";
    $output['picList']=mysqli_fetch_all((mysqli_query($conn,$sql)),1);
    //获取其所属类别信息
    $family_id=$output['details']['family_id'];
    $sql="SELECT * FROM shop_family WHERE cid=$family_id";
    $output['family']=mysqli_fetch_all(mysqli_query($conn,$sql),1);
    //获取相同类别的其他商品信息
    // $sql = "SELECT lid,spec FROM xz_laptop WHERE family_id=$fid";
    // $result = mysqli_query($conn, $sql);
    // $output['family']['laptopList'] = mysqli_fetch_all((mysqli_query($conn, $sql))), MYSQLI_ASSOC);
    //var_dump($output);
    echo json_encode($output);
?>