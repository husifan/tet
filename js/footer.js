//加载尾部
$(()=>{
  $.ajax({
    type:"get",
    url:"footer.html"
  }).then(html=>{
    var $footer=$(".footer")[0];
    $footer.innerHTML=html;
    var $uemails=$(".footer .footer_top>ul:nth-child(4) #uemail")[0];
    var $upwds=$(".footer .footer_top>ul:nth-child(4) #upwd")[0];
    var $bef=$(".footer .footer_top>ul:nth-child(4)")[0];
    var $aft=$(".footer .footer_top>ul:nth-child(5)")[0];
    var namesss=document.querySelector(".footer .footer_top>ul:nth-child(5) li div .namesss");
    var logout=document.querySelector(".footer .footer_top>ul:nth-child(5) li #logout");
    var logins=document.querySelectorAll(".footer .footer_top>ul:nth-child(4) .footer_btnss #login")[0];
    var $signs=$(".footer .footer_top>ul:nth-child(4) .footer_btnss #sign")[0];
    var $carta=$(".dropdowns .oncarta");
    var uemailsvalue=$uemails.value;
    var upwdsvalue=$upwds.value;
    //判断是否登录
    $.ajax({
      type:"get",
      url:"data/user/islogin.php",
      dataType:"json"
    }).then(data=>{
      if(data.ok==1){
        $bef.style.display="none";
        $aft.style.display="block";
        namesss.innerHTML="WELCOME YOU"+data.data.uemail;
        $(".dropdowns .oncarta").css('display',"block");
      }else{
        $bef.style.display="block";
        $aft.style.display="none";
        $(".dropdowns .oncarta").css('display',"none");
      }
    })
    //用户登录
    logins.onclick=function(e){
      e.preventDefault();  
      $.ajax({
        type:"get",
        url:"data/user/login.php",
        dataType:"json",
        data:`uemail=${uemailsvalue}&upwd=${upwdsvalue}`
      }).then(result=>{
        alert(result.msg);
        if(result.ok==1){
          $bef.style.display="none";
          $aft.style.display="block";
          namesss.innerHTML=result.msg;
          $(".dropdowns .oncarta").css('display',"block");
        }else{
          $bef.style.display="block";
          $aft.style.display="none";
          $(".dropdowns .oncarta").css('display',"none");
        }
      })
    };
    //用户注销
    logout.onclick=function(e){
      e.preventDefault;
      $.ajax({
        type:"get",
        url:"data/user/loginout.php"
      }).then(()=>{
        $bef.style.display="block";
        $aft.style.display="none";
        $(".dropdowns .oncarta").css('display',"none");
      })
    }
    //用户注册
    // $signs.onclick=function(){
    //   $.ajax({
    //     type:"get",
    //     url:"data/user/register.php"
    //   })
    // }
  })
})
