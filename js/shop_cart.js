$(()=>{
	function topay(shop_id,count){
		$.ajax({
			type:"get",
			url:"data/cart/cart_message.php"
		}).then(output=>{
		//拼购物车付款列表	
			//console.log(output);
			var html="";
			for(var p of output){
				// <td class="checkd">
				// 	<input type="checkbox" data-ischeck=${p.is_check}>
				// </td>
				html+=`<tr>
				<td>${p.sdname}</td>
				<td class="moneys">${p.sdprice}</td>
				<td class="adds">
					<span class="jian" data-id=${p.shop_id}><a>-</a></span>
					<span class="pcounts" data-count=${p.count} data-counts=${p.sdcount}>${p.count}</span>
					<span class="jia" data-id=${p.shop_id}><a>+</a></span>
				</td>
				<td>${p.sdprice.split("$")[1]}*${p.count}</td>
				<td class="deletes">
					<a data-id=${p.shop_id}>DELETE</a>
				</td>
			</tr>`
			//为a存一个自有属性 直接拿来使用即可
			}
			$(".cart_details table tbody").html(html);
		//单选
		var $checkd=$(".cart_details table tbody tr .checkd input");//单选
		var $checkd_top=$(".cart_details table thead tr .check_top input");//全选	
		// $checkd_top.on("click",function(e){
		// 	// var isgou =$(e.target).parent().parent().parent().next().children();
		// 	var isgou=$checkd.data("ischeck");
		// 	console.log(isgou);
		// 	//勾选了
		// 	if(isgou==1){
		// 		$checkd.prop('checked',true);
		// 		$.ajax({
		// 			type:"get",
		// 			url:"data/cart/becheck.php"
		// 		}).then(data=>{
		// 			//console.log(data);
		// 			//location.reload();
		// 			//$checkd.prop('checked',true);
		// 			// topay();
		// 			// var html13="";
		// 			// html13+=`<input type="checkbox" checked>`;
		// 			// $(".cart_details table tbody tr .checkd").html(html13);
		// 		})
		// 	}
		// 	else{
		// 		$checkd.prop('checked',false);
		// 		$.ajax({
		// 			type:"get",
		// 			url:"data/cart/notcheck.php"
		// 		}).then(data=>{
		// 			//console.log(data);                      
		// 			//location.reload();
		// 			// topay();
		// 			// var html13="";
		// 			// html13+=`<input type="checkbox" checked>`;
		// 			// $(".cart_details table tbody tr").html(html13);
		// 		})
		// 	}
		// })
		//拼结算表（总表）	
			var money=0;
			var pcounts=document.querySelectorAll(".cart_details table tbody tr .pcounts"); //数量
			var moneys=document.querySelectorAll(".cart_details table tbody tr .moneys");//单价
			for(var i=0;i<output.length;i++){
				var adds=parseInt(moneys[i].innerHTML.split("$")[1])*parseInt(pcounts[i].innerHTML);
				money+=adds;
			}		
			var tax=parseInt(money*0.15);//国际通用关税
			var total=tax+money;
			var html1="";
			html1+=`<div class="last_title">
				<span>CART TOTALS</span>
				</div>
				<div>
					<span>SUBTOTAL：</span>
					<span>$${money}(ex.VAT)</span>
				</div>
				<div>
					<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TAX：</span>
					<span>$${tax}</span>
				</div>
				<div>
					<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TOTAL：</span>
					<span>$${total}</span>
				</div>
				<div>
					<a href="shop_check.html">PROCEED TO CHECKOUT</a>
				</div>`;
			$(".last_checks").html(html1); 
			$jia=$(".cart_details table tbody tr .adds .jia a");
			$jian=$(".cart_details table tbody tr .adds .jian a");
			$shan=$(".cart_details table tbody tr .deletes a");
		//商品增加
			$jia.on("click",function(e){
				e.preventDefault;
				var counts=$(e.target).parent().prev().html();//现在商品数量
				var countss=$(e.target).parent().prev().data("counts");//库存商品数量	
				var meme_id=$(e.target).parent().parent().next().next().children().data("id");//商品ID
				$(e.target).parent().prev().html(++counts);
				if(counts>countss){
					alert("COUNT IS 0");
					$(e.target).parent().prev().html(countss);
				}else{
					$.ajax({
						type:"get",
						url:"data/cart/update_cart.php",
						data:{shop_id:meme_id,count:counts}
					}).then(data=>{
						console.log(data);
						//location.reload();
						topay();
					})
				}
			})
		//商品减少
			$jian.on("click",function(e){
				e.preventDefault;
				var counts=$(e.target).parent().next().html();//现在商品数量
				var countss=$(e.target).parent().next().data("counts");//库存商品数量	
				var meme_id=$(e.target).parent().parent().next().next().children().data("id");//商品ID
				$(e.target).parent().next().html(--counts);
				if(counts<=0){
					$.ajax({
						type:"get",
						url:"data/cart/delete.php",
						data:{shop_id:meme_id}
					}).then(data=>{
						//location.reload();
						topay();
					})
				}else{
					$.ajax({
						type:"get",
						url:"data/cart/update_cart.php",
						data:{shop_id:meme_id,count:counts}
					}).then(data=>{
						console.log(data.msg);
						topay();
					})
				}
			})
		//商品删除
			$shan.on("click",function(e){
				e.preventDefault;
				//取出自有属性值
				var me =$(e.target).data("id");
				var sures=confirm("ARE YUO SURE？");
				if(sures){
					$.ajax({
						type:"get",
						url:"data/cart/delete.php",
						dataType:"json",
						data:{shop_id:me}
					}).then(data=>{
						if(ok=1){
							//刷新一遍页面
							topay();
							alert(data.msg);
						}else{
							alert(data.msg);
							topay();
						}
					})
				}else{
					return false;
				}
			})
		})
	}
	topay();
})