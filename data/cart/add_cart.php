<?php
    require_once("../init.php");
    session_start();
    @$uid=$_SESSION["uid"];
    @$sdid=$_REQUEST["sdid"];
    @$count=$_REQUEST["count"];
    @$is_check=$_REQUEST["is_check"];
    $sql="SELECT iid,uid,shop_id,count,is_check FROM shop_cart WHERE uid=$uid and shop_id=$sdid";
    $result=mysqli_query($conn,$sql);
    //echo mysqli_error($conn);
    $row=mysqli_fetch_assoc($result);
    if($row!=NULL){
        $sql="DELETE FROM shop_cart WHERE uid=$uid and shop_id=$sdid";
        mysqli_query($conn,$sql);
        echo json_encode(["ok"=>-1,"msg"=>"CANCEL JOIN TO CART"]);
    }else{
        $sql="INSERT INTO shop_cart values(null,$uid,$sdid,$count,0)";
        mysqli_query($conn,$sql);
        echo json_encode(["ok"=>1,"msg"=>"SECCESS TO ADD CART"]);
    }
// session_start();
// if(! @$_SESSION['loginUid']){
//   $_SESSION['pageToJump'] = 'cart.html';
//   $_SESSION['toBuyLid'] = $lid;
//   $_SESSION['toBuyCount'] = $buyCount;
//   die('{"code":300, "msg":"login required"}');
// }
// $sql = "SELECT iid FROM xz_shoppingcart_item WHERE user_id=$_SESSION[loginUid] AND product_id=$lid";
// $result = mysqli_query($conn, $sql);
// if( mysqli_fetch_row($result) ){
//   $sql = "UPDATE xz_shoppingcart_item SET count=count+1 WHERE user_id=$_SESSION[loginUid] AND product_id=$lid";
// }else {
//   $sql = "INSERT INTO xz_shoppingcart_item VALUES(NULL, $_SESSION[loginUid], $lid, $buyCount, false)";
// }
// $result = mysqli_query($conn, $sql);
// if($result){
//   echo '{"code":200, "msg":"add succ"}';
// }else {
//   echo '{"code":500, "msg":"add err"}';
// }