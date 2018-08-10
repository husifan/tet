/*实现购物车下拉效果*/
$(()=>{
	$("[data-trigger=dropdowns]").parent().mouseenter(function(){
		$(this).children(":last-child").css({
			height:"300%",opacity:1
		});
	}).mouseleave(function(){
		$(this).children(":last-child").css({
			height:0,opacity:0
		});
	});
})
/*加载商品展示页面*/
$(()=>{
    $.ajax({
        type:'get',
        url:"data/get_shop/shop_mains.php",
        dataType:'json'
    }).then(output=>{
        var sf_name=output.shops;
        var html="",html1="";
        for(var p of sf_name){
          html+=`<li><a href="${p.sf_href}" data-cid=${p.cid}>${p.sf_name}</a></li>`  
        }
        $(".floor1>.list").html(html);
        $(".floor2 .floor2_title .floor2_title_1 .floor2_title_title").html($('[data-cid]').html());
        $(".floor1>.list li").on("click",function(e){
            e.preventDefault();
           var cid=$(e.target).data("cid");
           $(".floor2 .floor2_title .floor2_title_1 .floor2_title_title").html($(e.target).html());
           ajaxs(cid);
        })
    })
    function ajaxs(cid){
        $.ajax({
                type:'get',
                url:"data/get_shop/shop_mains.php",
                data:{cid},
                dataType:'json'
            }).then(result=>{
                var {shops,sons,titles}=result;
                html="";html1="";
                for(var p of sons){
                    html+=`<a href="${p.sdhref}">
                        <li class="products">
                            <img src="${p.sdpic}" alt=""/>
                            <span>${p.sdname}</span>
                            <span>${p.sdprice}</span>
                        </li>
                    </a>`
                }
                $(".floor2_mains ul").html(html);
                html1="";
                html1+=`<span>${titles[0]}</span>`
                $(".floor2 .floor2_title .floor2_title_2").html(html1);
                html3="";
                html3+=`SHOWING 1–9 OF ${sons.length} RESULTS`
                $(".floor2 .floor2_title .floor2_title_3 span").html(html3);
                
            })
    }
    ajaxs()
})
/*加载商品详细页面*/
$(()=>{
    var sdid=location.search.split('=')[1];
    $.ajax({
        type:"get",
        url:"data/get_shop/details.php",
        data:{sdid:sdid},
        dataType:"json"
    }).then(output=>{
    //拼详情页
        var html="";
        var {details,family,picList}=output;
        html+=`<span>${details.sdname}</span><span>${details.sdprice}</span>`
        $(".f3>.f3_right>.f3_right_1").html(html);
        var html4="";
        html4+=`<span>Category:</span>
        <a href="">${family[0].sf_name}</a>`
        $(".f3>.f3_right>.f3_right_3").html(html4);
        //中等图
        var html5="";
        html5+=`<img src="${details.sdpic}" alt="">
            <div class="fangda"></div>
            <div class="zhezhao"></div>`
        $(".f3 .f3_left .f3_left_title").html(html5);
        //缩略图
        var html6="";
        for(var img of picList){
            html6+=`<img src="${img.sidm}" alt="" data-siid=${img.siid}>`
        }
        $(".f3 .f3_left .f3_left_mains").html(html6);
        //商品简介
        var li_img=$(".f3 .f3_left .f3_left_mains")[0];
        var html7="";
        html7+=`<span>PRODUCT DESCRIPTION</span>
        <span>${details.sddetails}</span>`;
        $(".f4 .f4_mains").html(html7);
        //剩余库存
        var html8="";
        html8+=`<span>Merchandise Inventory:  <u>${details.sdcount}</u></span>`
        $(".f3 .f3_right .f3_right_2 .f3_right_2_1 .counts").html(html8);
        //修改占位符
        var inputs=document.querySelector(".f3 .f3_right .f3_right_2_1 .f3_right_2_1_input");    
        inputs.placeholder="MAX:"+details.sdcount;
        inputs.value="";
    //鼠标切图功能
        var $middleimg=$(".f3 .f3_left .f3_left_title");//下面的缩略图
        var $imglist=$(".f3 .f3_left .f3_left_mains img");
        $imglist.mouseenter(function(e){
            var siid =$(e.target).data("siid");
            $.ajax({
                type:"get",
                url:"data/get_shop/img.php",
                dataType:"json",
                data:{siid:siid}
            }).then(data=>{
                var html11=`<img src="${data.sidm}">
                    <div class="fangda"></div>
                    <div class="zhezhao"></div>`;
                $middleimg.html(html11);//中图
    //放大镜功能            
                var fangda=document.querySelector(".f3 .f3_left .f3_left_title .fangda");//放大镜
                var show_large=document.querySelector(".main .f3 .f3_left .show_large");//展示图片
                var zhezhao=document.querySelector(".main .f3 .f3_left .zhezhao");//遮罩层
				var middleimg=document.querySelector(".f3 .f3_left .f3_left_mains img");//中图
                show_large.style.backgroundImage=`url(${data.sibm})`;  
                zhezhao.onmouseover=e=>{
					fangda.style.display="block";
					show_large.style.display="block";
				}
				zhezhao.onmouseout=e=>{
					fangda.style.display="none";
					show_large.style.display="none";
				}
                zhezhao.onmousemove=e=>{
                    //放大镜移动的距离
					var x = event.clientX-zhezhao.offsetLeft-fangda.offsetWidth*2;
					var y = event.clientY-zhezhao.offsetTop-fangda.offsetHeight;
                    //最大可移动的距离
                    var maxX = zhezhao.clientWidth-fangda.offsetWidth;
                    var maxY = zhezhao.clientHeight-fangda.offsetHeight;
					//边界判断
					if(x<=0){
						x=0;
					}else if(x>=maxX){
						x=maxX;
					}
					if(y<=0){
						y=0;
					}else if(y>=maxY){
						y=maxY;
					}
					//放大镜的位置
					fangda.style.left = x+"px";
					fangda.style.top = y+"px";
					//移动比例
					var yidongX = x/maxX;
					//console.log(yidongX);
					var yidongY = y/maxY;
					//移动
					show_large.style.backgroundPositionX= -yidongX * (show_large.clientWidth - middleimg.offsetWidth)*4 + "px";
                    show_large.style.backgroundPositionY= -yidongY * (show_large.clientHeight - middleimg.offsetHeight)*2 + "px";  
                }
            })
        });
    //数量增删
        var f3_less=document.querySelector(".f3 .f3_right .f3_right_2_1 .f3_less");    //-
        var f3_add=document.querySelector(".f3 .f3_right .f3_right_2_1 .f3_add");      //+
        f3_add.onclick=function(e){
            e.preventDefault();
            if(inputs.value<details.sdcount){
                inputs.value++;
                $.ajax({
                    type:"get",
                    url:"data/cart/count.php",
                    data:{shop_id:sdid}
                }).then(data=>{
                    var html9=data.sdcount-inputs.value;
                    var html10=`<span>Merchandise Inventory:  <u>${html9}</u></span>`;
                    if(html9<=0){
                        $(".f3 .f3_right .f3_right_2 .f3_right_2_1 .counts").html("NO COUNT！");
                    }else{
                        $(".f3 .f3_right .f3_right_2 .f3_right_2_1 .counts").html(html10);
                    }
                })
            }else{
                alert("NOW COUNT IS MAX!");
            }
        }
        f3_less.onclick=function(e){
            e.preventDefault();
            if(inputs.value>0){
                inputs.value--;
            }else{
                alert("NOW COUNT IS 0!");
            }
        }
    //添加到购物车
        $(".f3 .f3_right .f3_right_2 .f3_right_2_1 .adds a").on("click",function(e){
            e.preventDefault();
            var sdid=location.search.split('=')[1];
            //判断是否登录
            $.ajax({
                type:"get",
                url:"data/user/islogin.php",
                dataType:"json"
              }).then(data=>{
                var inputs=document.querySelector(".f3 .f3_right .f3_right_2_1 .f3_right_2_1_input");   //ADD
                var inputss=inputs.value;
                if(data.ok==1){ //如果登录了
                    if(inputss!=0){     //如果输入数量为空
                        if(inputss>details.sdcount){     //如果输入数量大于库存
                            alert("SORRY,COUNT NOT ENOUGH");  
                        }else{      //添加到购物车
                            $.ajax({
                                type:"get",
                                url:"data/cart/add_cart.php",
                                dataType:"json",
                                data:`sdid=${sdid}&count=${inputss}`
                            }).then(data=>{
                                if(data.ok==1){
                                    alert("ADD SUCCESS");
                                    carts();
                                    //location.reload();
                                }else{
                                    alert("PLEASE CHEACK YOUR CART");
                                    carts();
                                }
                            })
                        }
                    }else{
                        alert("NUMBER CANT BE EMPTY");
                    }
                }else{
                    alert("PLEASE TO LOGIN");
                }
              })
        })
        function carts(uid){
            $.ajax({
                type:"get",
                url:"data/cart/cart_message.php"
            }).then(output=>{
                var html="";
                for(var p of output){
                    html+=`<div class="drop_message">
                    <span><img src="${p.sdpic}" alt=""></span>
                    <span class="moneys">$${p.sdprice.split("$")[1]}</span>
                    <a></a>
                    <span class="pcounts">*${p.count}</span>
                    <a></a>
                    <hr/>
                    </div>`
                }
                $(".floor2>.floor2_title .dropdowns .dropdown-menus .dropssss").html(html);
                var moneys=document.querySelectorAll(".floor2>.floor2_title .dropdowns .dropdown-menus .dropssss .moneys");
                var html1="";
                var money=0;
                var pcounts=document.querySelectorAll(".floor2>.floor2_title .dropdowns .dropdown-menus .dropssss .pcounts");
                //实现购物车的价格计算
                for(var i=0;i<output.length;i++){
                    var adds=parseInt(moneys[i].innerHTML.split("$")[1])*parseInt(pcounts[i].innerHTML);
                    money+=adds
                }
                html1+=`<span>$ubtotal:(ex.VAT):</span><span>${money}</span>`
                $(".floor2>.floor2_title .dropdowns .dropdown-menus .drop_all").html(html1);
            })
        }
        carts();
    })
})