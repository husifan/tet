<?php
header("Content-Type:application/json");
$conn=mysqli_connect("127.0.0.1","root","","Koenigsegg",3306);
$result=mysqli_query($conn,"SET NAMES UTF8");
?>