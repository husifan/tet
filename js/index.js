$(()=>{
    //obj为对象 json为json值 fn是回调函数
    function animate(obj,json,fn){
        clearInterval(obj.timer);   //清除定时器
        obj.timer=setInterval(function(){ //给对象设置一个定时器
            var flag=true;  //判断定时器什么时候停止
            for(var attr in json){  //遍历json对象
                var current=0;
                if(attr=="opacity"){    //当前对象
                    current=parseInt(getStyle(obj,attr)*100);
                }else{
                    current=parseInt(getStyle(obj,attr));
                }
                //步长
                var step=(json[attr]-current)/10;
                step=step>0?Math.ceil(step):Math.floor(step);
                //判断透明度
                if(attr=="opacity"){
                    //in是一个二元的运算符 意思是第一个操作数的值的第二个操作数的值的属性名 会返回true
                    //这样就可以判断这个对象的样式上是否有opac属性了
                    if("opacity" in obj.style){
                        obj.style.opacity=(current+step)/100;
                    }else{
                        obj.style.filter="alpha(opacity="+(current+step)+")";
                    }
                }else if(attr=="zIndex"){
                    obj.style.zIndex=json[attr];
                }else{
                    obj.style[attr]=current+step+"px";
                }
                //截止值
                if(current!=json[attr]){
                    flag=false;
                }
            }
            if(flag){
                clearInterval(obj.timer);
                if(fn){
                    fn();
                }
            }
        },5)
    }
    //兼容性问题
    function getStyle(obj,attr){
        if(obj.currentStyle){
            return obj.currentStyle[attr];
        }else{
            return window.getComputedStyle(obj,null)[attr];
        }
    }
    var $js_box=$("#js-box");//包括banner和导航条
    var $slider_main_block=$("#slider-main-block");//banner
    var $imgs=$slider_main_block.children();//所有图片
    var $slider_ctrl=$("#slider-ctrl");
    for(var i=0;i<$img.length;i++){
        var span=document.createElement("span"); //创建一个span
        span.className="slider-ctrl-con";
    }
    //console.log($slider_ctrl);
})

// $(()=>{
//     // var banner=[
//     //     "img/banner/index6.jpg",
//     //     "img/banner/index3.jpg",
//     //     "img/banner/index1.jpg",
//     //     "img/banner/index5.jpg"
//     // ];
//     // var html="";
//     // for(var p in banner){
//     //     html+=`<li><img src="img/banner/index5.jpg" class="b-img"></li>`
//     // }
//     // $(".banner-img").html(html);
//     // var $imgs=$(".b-img");
//     // var timer=setInterval(()=>{
//     //     var opa=$imgs.css("opacity");
//     //     opa-=0.2;
//     //     $imgs.css("opacity",opa);
//     //     $imgs.css("transition","1s all linear");
//     //     if(opa<=0.2){
//     //         $imgs.attr("src","img/banner/index1.jpg");
//     //         var opa=$imgs.css("opacity");
//     //         opa=0.9;
//     //         $imgs.css("opacity",opa);
//     //     }
//     //     if(opa>=0.8){
//     //         $imgs.attr("src","img/banner/index5.jpg");
//     //         var opa=$imgs.css("opacity");
//     //         opa-=0.2;
//     //         $imgs.css("opacity",opa);
//     //     }
//     //     console.log(opa);
//     //     // if(opa<=0.1){
//     //     //     var opa=$imgs.css("opacity");
//     //     //     opa+=0.2;
//     //     //     $imgs.css("opacity",opa);
//     //     //     $imgs.attr("src","img/banner/index5.jpg");
//     //     //     console.log(opa);
//     //     // }
//     // },500)

//     {/* <img src="logo1.gif" name="img" border=0
//     alt="Image" style="filter:alpha(opacity=0)"> 
//     <script language="JavaScript">
//     var bOpa = 1;
//     var c = true;
//     function fade()
//     {
//     if(document.all);
//     if(c == true) {
//         bOpa++;
//     }
//     if(bOpa==100) {   //透明度到100时，开始减少
//         bOpa--;
//     c = false         
//     }
//     if(bOpa==10) {   //透明度到10时，控制透明度增减的参数变为true
//     bOpa++;
//     c = true;
//     }
//     if(c == false) {  //控制透明度是加还是减
//     bOpa--;
//     }
//     img.filters.alpha.opacity=0 + bOpa; //改变图像的透明度
//     setTimeout("fade()",50);            //定时执行fade方法
//     } */}
// })