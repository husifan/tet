(()=>{
//引入外部header---------------------------------------------------------------
	$.ajax({
		type:"get",
		url:"header.html"
	}).then(html=>{
		$(".header").html(html);
		window.onscroll=function(){
			var scrollTop=document.documentElement.scrollTop||document.body.scrollTop;
			//console.log(scrollTop);
			var $img_1=$(".floor2 .floor2_cars .floor2_cars_texts .img_1");
			var $text_1=$(".floor2 .floor2_cars .floor2_cars_texts .text_1");
			var $img_2=$(".floor2 .floor2_cars .floor2_cars_texts_right .img_2");
			var $text_2=$(".floor2 .floor2_cars .floor2_cars_texts_right .text_2");
			var $img_3=$(".floor2 .floor2_cars .floor2_cars_texts .img_3");
			var $text_3=$(".floor2 .floor2_cars .floor2_cars_texts .text_3");
			//第一个动画
			if(scrollTop>=400&&scrollTop<500){
				$text_1.css({"opacity":0.2,"width":"18%"});
				$img_1.css({"opacity":0.2,"width": "7%"});
			}else if(scrollTop>=500&&scrollTop<600){
				$text_1.css({"opacity":0.4,"width":"24%"});
				$img_1.css({"opacity":0.4,"width": "17%"});
			}else if(scrollTop>=600&&scrollTop<700){
				$text_1.css({"opacity":0.6,"width":"30%"});
				$img_1.css({"opacity":0.6,"width": "27%"});
			}else if(scrollTop>=700&&scrollTop<800){
				$text_1.css({"opacity":0.8,"width":"36%"});
				$img_1.css({"opacity":0.8,"width": "37%"});
			}else if(scrollTop>=800&&scrollTop<900){
				$text_1.css({"opacity":1,"width":"52%"});
				$img_1.css({"opacity":1,"width": "47%"});
			}
			//第二个动画
			else if(scrollTop>=900&&scrollTop<1000){
				$text_2.css({"opacity":0.2,"margin-left":"-10%"});
				$img_2.css({"opacity":0.2,"width": "7%"});
			}else if(scrollTop>=1000&&scrollTop<1100){
				$text_2.css({"opacity":0.4,"margin-left":"-5%"});
				$img_2.css({"opacity":0.4,"width": "17%"});
			}else if(scrollTop>=1100&&scrollTop<1200){
				$text_2.css({"opacity":0.6,"margin-left":"0%"});
				$img_2.css({"opacity":0.6,"width": "27%"});
			}else if(scrollTop>=1200&&scrollTop<1300){
				$text_2.css({"opacity":0.8,"margin-left":"5%"});
				$img_2.css({"opacity":0.8,"width": "37%"});
			}else if(scrollTop>=1300&&scrollTop<1400){
				$text_2.css({"opacity":1,"margin-left":"10%"});
				$img_2.css({"opacity":1,"width": "47%"});
			}
			//第三个动画
			else  if(scrollTop>1400&&scrollTop<1500){
				$text_3.css({"opacity":0.2,"width":"18%"});
				$img_3.css({"opacity":0.2,"width": "7%"});
			}else if(scrollTop>=1500&&scrollTop<1600){
				$text_3.css({"opacity":0.4,"width":"24%"});
				$img_3.css({"opacity":0.4,"width": "17%"});
			}else if(scrollTop>=1600&&scrollTop<1700){
				$text_3.css({"opacity":0.6,"width":"30%"});
				$img_3.css({"opacity":0.6,"width": "27%"});
			}else if(scrollTop>=1700&&scrollTop<1800){
				$text_3.css({"opacity":0.8,"width":"36%"});
				$img_3.css({"opacity":0.8,"width": "37%"});
			}else if(scrollTop>=1800&&scrollTop<1900){
				$text_3.css({"opacity":1,"width":"52%"});
				$img_3.css({"opacity":1,"width": "47%"});
			}
		}
		// console.log($img_1);
		// console.log($text_1);
		// console.log($img_2);
		// console.log($text_2);
		// console.log($img_3);
		// console.log($text_3);
	});
})();