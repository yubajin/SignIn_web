<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="https://g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    <link rel="stylesheet" href="https://g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">

  </head>
<body>
 <script language="Javascript">  
	document.oncontextmenu=new Function("event.returnValue=false");  
	document.onselectstart=new Function("event.returnValue=false");  
 </script>
 <div class="page">
  <header class="bar bar-nav">
    <h1 class="title">我来帮你上课——————致敬ye2moe</h1>
  </header> 
  
 <div class="content">
  <div class="list-block">
    <ul>
      <li class="align-top">
        <div class="item-content" >
			 <div class="item-inner" >
               <img style="margin:0 auto; width:60%"
                    src="g.gif">
				</div>
        </div>
      </li>
      <li>
        <div class="item-content">
          <div class="item-media"><i class="icon icon-form-name"></i></div>
          <div class="item-inner">
            <div  class="item-title label">学号</div>
            <div class="item-input">
              <input id="id" type="text" placeholder="一卡通账号">
            </div>
          </div>
        </div>
      </li>
    </ul>
  </div>
  <div class="content-block">
    <div class="row">
      <div class="col-100">
      	<a href="javascript:login()" class="button button-big button-fill button-success">登录</a>
      </div>
    </div>
  </div>
</div>
</div> 
    <script type='text/javascript' src='https://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='https://g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='https://g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
	<link rel="stylesheet" href="https://g.alicdn.com/msui/sm/0.6.2/css/??sm.min.css,sm-extend.min.css">
	<script type='text/javascript' src='https://g.alicdn.com/msui/sm/0.6.2/js/??sm.min.js,sm-extend.min.js' charset='utf-8'></script>
  
  <script>
      $(document).ready(function(){
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath }/preLogin",
			success:function(){
				console.log("prelogin");
			}
		});
        if(localStorage.name == undefined)
            return;
        $("#id").val(localStorage.name);
        $.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath }/Login?stuNo="+localStorage.name,
			success:function(){
				console.log("prelogin");
			}
		});
      })
      
      
      function login(){
  		var id = $("#id").val();
  		if(id.length != 10)
  			$.toast("话说学号不是10位的吗？");
  		else {
  		    localStorage.name = id ;
            window.location.href = "signPage.jsp";
        }
  	}
  	
  	
  </script>
</body>

</html>