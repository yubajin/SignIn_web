﻿<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="initial-scale=1, maximum-scale=1">
	    <link rel="shortcut icon" href="/favicon.ico">
	    <meta name="apple-mobile-web-app-capable" content="yes">
	    <meta name="apple-mobile-web-app-status-bar-style" content="black">
	
	    <link rel="stylesheet" href="https://g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    	<link rel="stylesheet" href="https://g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css"><script type='text/javascript' src='https://g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
	    <script type='text/javascript' src='https://g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
	    <script type='text/javascript' src='https://g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
	    <link rel="stylesheet" href="https://g.alicdn.com/msui/sm/0.6.2/css/??sm.min.css,sm-extend.min.css">
	    <script type='text/javascript' src='https://g.alicdn.com/msui/sm/0.6.2/js/??sm.min.js,sm-extend.min.js' charset='utf-8'></script>
		
	</head>
	<body>
		<script language="Javascript">  
			document.oncontextmenu=new Function("event.returnValue=false");  
			document.onselectstart=new Function("event.returnValue=false");  
	 	</script>
		<div class="page"> 
		<input type="hidden" id="hidden_input">
        <nav class="bar bar-tab">
            <a class="tab-item active" href="#">
                <span class="icon icon-star"></span>
                <span class="tab-label">今日签到</span>
            </a>
            <a class="tab-item external" href="javascript:$.toast('打赏？不存在的！')">
                <span class="icon icon-gift"></span>
                <span class="tab-label">打赏一下</span>
            </a>
        </nav>
		<header class="bar bar-nav">
            <a class="icon icon-refresh pull-right" href="javascript:location.reload(true);"></a>

            <a class="icon icon-left pull-left" href="login.jsp"></a>
		  <h1 class="title" id="time" >致敬ye2moe</h1>
		</header>
        <div class="content" id="my-content"> 

            <div id="model"  style="display:none;">
                <div class="list-block">
                    <ul>
                        <li class="item-content">
                            <div class="item-media">
                                <i class="icon icon-f7"></i>
                            </div>
                            <div class="item-inner">
                                <div class="item-title">任课老师</div>
                                <div class="item-after name"></div>
                            </div>
                        </li>
                        <li class="item-content">
                            <div class="item-media">
                                <i class="icon icon-f7"></i>
                            </div>
                            <div class="item-inner">
                                <div class="item-title">上课时间</div>
                                <div class="item-after time"></div>
                            </div>
                        </li>
                        <li class="item-content" id="signin">
                            <div class="item-media">
                                <i class="icon icon-f7"></i>
                            </div>
                            <div class="item-inner">
                                <div class="item-title sign-info">签到开始</div>
                                <div class="item-after sign-time"></div>
                            </div>
                        </li>
                        <li class="item-content" id="class-room">
                            <div class="item-media">
                                <i class="icon icon-f7"></i>
                            </div>
                            <div class="item-inner">
                                <div class="item-title">教室</div>
                                <div class="item-after class-room"></div>
                            </div>
                        </li>
                        <li class="item-content">
                            <div class="item-media">
                                <i class="icon icon-f7"></i>
                            </div>
                            <div class="item-inner">
                                <div class="item-title">☆</div>
                                <div class="item-after" id="sign-area">
                                    <!--    <a class="button button-round sign" href="#">签到</a>
                                       <a class="button button-round sign-re" style="margin-left: 5px; ;border-bottom-color:darkred ; color: darkred;display: none;" href="#">续签</a>
                                       <a class="button button-round sign-out" style="" href="#">签退</a>
                                   -->
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
		<script type="text/javascript">
			$(document).ready(function(){
				queryStu();
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath }/preLogin",
					success:function(){}
				});
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath }/Login?stuNo="+localStorage.name,
					success:function(){}
				});
			})
			$.toast("服务器响应较慢，请耐心等待几秒钟 ");

				 
			function getQueryString(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
				var r = window.location.search.substr(1).match(reg);
				if (r != null)
					return unescape(r[2]);
				return localStorage.name;
			}

			function queryStu() {
				var stuNo = getQueryString("id");
				if (stuNo == null) {
					$.toast("请登录! ");
					return;
				}
				localStorage.name = stuNo;
				$.getJSON(
						"${pageContext.request.contextPath }/QueryCourse?stuNo="
								+ stuNo, function(json) {
							queryStuSuccess(json);
						});
			}

			function queryStuSuccess(json) {
				if (json == null || json.length <= 0) {
					$("#my-content") 
							.append(
									"<center><span style=''>残忍，今天没课需要用小程序签到 ！</span></center>");
					return;
				}
				var objs = json;
				var isAllDone = 0;
				for (var i = 0; i < objs.length; i++) {
					var obj = objs[i];
					var s = $("#model").clone();
					s.attr("id", "");
					s.css("display", "block");
					s.find(".name").html(obj.teacher);
					s.find(".time").html(obj.courseStartTime);
					s.find(".sign-time").html(obj.signStartTime);
					s.find(".class-room").html(obj.caption);

					generateSignBtn(s, obj);

					updateSignState(s.find('#sign-area'), obj);

					$("#my-content").append(
							"<h2 style='margin-left:10px;margin-bottom:0px;'>"
									+ obj.courseName + "</h2>")
					$("#my-content").append(s);
				}

			}

			function signIn(id, name,week,signStatusId,a) {
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath }/SignIn",
					data : {
						"id" : id,
						"name" : name,
						"week" : week,
						"signStatusId" : signStatusId
					},
					success : function(data) {
						$.toast(data.message);
						if (data.code == 1) {
	                        a.innerHTML = dateFormatUtil(new Date()) + " 正常";
	                        a.setAttribute('onclick','');
	                        if(signStatusId == 7){
	                        	 $("#"+cid+" .sign-state9").hide();
	                        }
	                        if(signStatusId == 9){
	                        	 $("#"+cid+" .sign-state7").hide();
	                        }
	                    }
					}
				});
			}

			//生成签到按钮
			function generateSignBtn(model, obj) {
				var target = model.find('#sign-area');
				var signs = obj.scheduleArrangeParam;

	            var arr = new Array(signs.length);
				for(var i=0;i<signs.length;i++){
	                arr[i] = signs[i];
	            }
	            signs.sort(function(a,b){
	                return a.stateId - b.stateId;
	            });
	            if(signs.length>1 && signs[1].stateId == 7){
	                var temp = signs[0];
	                signs[0] = signs[1];
	                signs[1] = temp;
	            }
				for (var i = 0; i < signs.length; i++) {

					if (signs[i].state == 1) {

						generateInfo(model, signs[i].stateId, signs[i].name,
								obj);

						var a = document.createElement("a");

						a.className = "button button-round sign-state"
								+ signs[i].stateId;
						if (signs[i].stateId == 9)
							a.innerText = "被" + signs[i].name;
						else
							a.innerText = signs[i].name;
						a.setAttribute('style', 'margin-left: 5px;');
						if (signs[i].stateId != 7) {
							var color = '';
							if (signs[i].stateId == 6)
								color = 'border-color:#8A2BE2 ; color: #8A2BE2;';
							else if (signs[i].stateId == 9)
								color = '';
							else if (signs[i].stateId == 8)
								color = 'border-color:red ; color: red;';
							a.setAttribute('style', a.getAttribute('style')
									+ color);
						}
						a.setAttribute("onclick",
								"signIn('" + obj.id + "','" + obj.courseName + "','"+ obj.week +"',"+signs[i].stateId+",this)");

						target.append(a);

					}
				}
			}
			//
			function generateInfo(model, id, name, obj) {
				if (id == 7 || id == 9)
					return;

				var info = model.find("#signin");
				var cp = info.clone();
				cp.attr('id', obj.id);
				if (id == 6) {
					cp.find('.sign-info').html(name + "开始").css('color',
							'#8A2BE2');
					cp.find('.sign-time').html(obj.reSignStartTime).css(
							'color', '#8A2BE2');
				} else {
					cp.find('.sign-info').html(name + "开始").css('color', 'red');
					cp.find('.sign-time').html(obj.signOutStartTime).css(
							'color', 'red');
				}

				model.find("#class-room").before(cp);
			}

			//更新按钮状态
			function updateSignState(target, obj) {

				var ssi = 0;
				var sA = new Array(4);
				for ( var item in obj.signStatusAndSignDate) {
					if (obj.signStatusAndSignDate[item] == null)
						continue;
					sA[ssi++] = item;
				}
				sA.sort(function(a, b) {
					return a - b;
				});
				if (ssi >= 3) {
					target.find(".sign-state9").hide();
				}
				var mark = 0;
				var signs = obj.scheduleArrangeParam;
				for (var i = 0; i < signs.length && mark < ssi; i++) {
					if (signs[i].state == 1) {
						if (signs[i].stateId == 7)
							target.find(".sign-state9").hide();
						var dateStr = obj.signStatusAndSignDate[sA[mark++]];
						
						target
								.find(".sign-state" + signs[i].stateId)
								.html(dateFormatUtil(dateStr) + " 正常");
						target.find(".sign-state" + signs[i].stateId).attr(
								'onclick', '');
					}
				}
			}

			function dateFormatUtil(longTypeDate) {
				var dateTypeDate = "";
				var date = new Date();
				
				date.setTime(longTypeDate);
				dateTypeDate += "" + getHours(date); //时
				
				dateTypeDate += ":" + getMinutes(date); //分
				
				return dateTypeDate;
			}
			
			function sortTime(a,b){
		            return a - b;
		    }
			
			//返回小时
			function getHours(date) {
				var hours = "";
				hours = date.getHours();
				if (hours < 10) {
					hours = "0" + hours;
				}
				return hours;
			}
			//返回分
			function getMinutes(date) {
				var minute = "";
				minute = date.getMinutes();
				if (minute < 10) {
					minute = "0" + minute;
				}
				return minute;
			}
		</script>
	</body>
</html>