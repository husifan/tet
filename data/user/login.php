<?php
    require_once("../init.php");
    @$uemail=$_REQUEST['uemail'] or die('{"code":401,"msg":"uemail required"}');
    @$upwd=$_REQUEST['upwd'] or die('{"code":402,"msg":"upwd required"}');
    if($uemail&&$upwd){
        $sql="SELECT uid,uemail FROM shop_user WHERE uemail='$uemail' and binary upwd='$upwd'";
        $result=mysqli_query($conn,$sql);
        $row=mysqli_fetch_row($result);
        if($row){
            session_start();
            $_SESSION["uid"]=$row[0];
            $_SESSION["uemail"]=$row[1];
            echo json_encode(["ok"=>1,"msg"=>"WELCOME YOU ${uemail}"]);
        }else{
            echo json_encode(["ok"=>0,"msg"=>"EMAIL OR PASSWORD IS ERROR"]);
        }
    }
    /*
    <?php
    require_once("../init.php");
    @$uemail=$_REQUEST['uemail'] or die('{"code":401,"msg":"uemail required"}');
    @$upwd=$_REQUEST['upwd'] or die('{"code":402,"msg":"upwd required"}');
    if($uemail&&$upwd){
        $sql="SELECT uid,uemail FROM shop_user WHERE uemail='$uemail' and binary upwd='$upwd'";
        $result=mysqli_query($conn,$sql);
        $row=mysqli_fetch_row($result);
        if($row){
            session_start();
            $_SESSION["loginUid"]=$row[0];
            $_SESSION["loginUemail"]=$row[1];
            //echo json_encode(["ok"=>1,"msg"=>"WELCOME YOU ${uemail}"]);
            $pageToJump=@$_SESSION['pageToJump'];
            if($pageToJump==='shop_cart.html'&&@$_SESSION['toBuysdid']){
                //完成购物车添加功能
                $sql="SELECT iid FROM shop_cart WHERE uid=$_SESSION[loginUid] AND shop_id=$_SESSION[toBuyLid]";
                $result=mysqli_query($conn,$sql);
                $row=mysqli_fetch_row($result);
                if($row){
                    //如果购物车内有这件商品 就修改其数量  
                    $sql = "UPDATE shop_cart SET count=count+1 WHERE uid=$_SESSION[loginUid] AND shop_id=$_SESSION[toBuyLid]";
                }else {
                    //如果购物车没有这件商品 就增加该商品
                    $sql = "INSERT INTO shop_cart  VALUES(NULL, $_SESSION[loginUid], $_SESSION[toBuyLid], $_SESSION[toBuyCount],false)";
                }
                    $result = mysqli_query($conn, $sql);
                //释放所有session变量
                unset($_SESSION['toBuyLid']);
                unset($_SESSION['toBuyCount']);
                unset($_SESSION['pageToJump']);
                echo('{"code":200, "msg":"login succ", "pageToJump":"'.$pageToJump.'"}');  
            }else if($pageToJump==='cart.html'){
                //完成购物车查看
                unset($_SESSION['pageToJump']);
                echo('{"code":200, "msg":"login succ", "pageToJump":"'.$pageToJump.'"}');
            }else{
                echo('{"code":200, "msg":"WELCOME YOU"}');
            }
        }else{
            echo json_encode(["ok"=>0,"msg"=>"EMAIL OR PASSWORD IS ERROR"]);
        }
    }
?>
    */
?>
