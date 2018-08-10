<?php
    require_once("../init.php");
    @$cid=$_REQUEST['cid'];
    $result=[];
    if($cid){
        // $sql="SELECT sdname,sdprice,sdpic,sdid,(SELECT details from shop_family WHERE cid=$cid) as details FROM shop_details WHERE family_id=$cid";
        $sql="SELECT sdname,sdprice,sdpic,sdid,sdhref FROM shop_details WHERE family_id=$cid";
        $sql1="SELECT sf_details FROM shop_family where cid=$cid";
    }
    else{
        $sql="SELECT sdname,sdprice,sdpic,sdid,sdhref FROM shop_details  WHERE family_id=1";
        $sql1="SELECT sf_details FROM shop_family where cid=1";
    }
        $res=mysqli_query($conn,$sql);
        $result['sons']=mysqli_fetch_all($res,1);
        $res=mysqli_query($conn,$sql1);
        $result['titles']=mysqli_fetch_row($res);
        $sql="SELECT sf_name,cid FROM shop_family";
        $res=mysqli_query($conn,$sql);
        $result['shops']=mysqli_fetch_all($res,1);
    echo json_encode($result);


