$(()=>{
    $.ajax({
        type:"get",
        url:"data/cart/cart_message.php"
    }).then(output=>{
        console.log(output);
        var html="";
        for(var p of output){
            html+=`<tr>
                <td>${p.sdname}</td>
                <td>${p.sdprice}</td>
            </tr>
            <tr></tr>`
        }
        $(".floor4 .floor4_mains .checked tbody").html(html);
    })
    
    var $inputs=$(".floor3 .pay_check .check_right .check_right_title input");
    var $inputs_main=$(".floor3 .pay_check .check_right .check_right_main");
    $inputs_main.css("display","none");
    $inputs.on("click",function(e){
        //判断其属性 如果为真则显示
        if($inputs.prop('checked')){
            $inputs_main.css("display","block");
        }else{
            $inputs_main.css("display","none");
        }
    });
})