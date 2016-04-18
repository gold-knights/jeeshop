<%@ page contentType="text/html; charset=UTF-8"%>
<!-- tyy -->
<%@ page session="false"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/resource/common_css.jsp"%>
<style>
	#advert img{
		max-width: 364px;
		max-height: 290px;
		border:0px;
	}
	#otherLogin a:hover{
		text-decoration: none;
	}
</style>
</head>

<body>
<input value="<%=SystemManager.systemSetting.getWww()%>" type="hidden" id="wwwInput"/>
	<%request.getSession().setAttribute(FrontContainer.selectMenu,FrontContainer.not_select_menu); %>
	<%@ include file="/indexMenu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-xs-4" style="background-color:#fff;border:0px;">

			</div>
			
			<div class="col-xs-8">
				<caption>
					<%
					Object errorMsg = request.getSession().getAttribute(FrontContainer.login_errorMsg);
					//out.println("errorMsg="+errorMsg);
					if(errorMsg!=null){
					%>
					<!-- 
					<div class="alert alert-info alert-dismissable" style="display: none;">
					  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					  <strong>登陆失败!</strong> 账号或密码错误！
					</div>
					 -->
					
					<div class="bs-callout bs-callout-danger author" style="text-align: left;font-size: 14px;margin: 2px 0px;">
						<strong>登陆失败!</strong> <%=errorMsg %>
					</div>
					
					<%}
					request.setAttribute("errorMsg",null);
					%>
					
					<%request.setAttribute("errorMsg",null); %>
				</caption>
				
				<div class="panel panel-success" style="width:500px;">
		              <div class="panel-heading">
		                <h3 class="panel-title">
		                	<span class="glyphicon glyphicon-user"></span>&nbsp;用户登陆
		                </h3>
		              </div>
		              <div class="panel-body">
	              		<form role="form" id="form" class="form-horizontal" action="${ctx}/user/doLogin.html" theme="simple">   
<%-- 						  <s:token/> --%>
						  <div class="form-group">
						    <label for="account" class="col-md-2 control-label">账号</label>
						    <div class="col-md-6">
							    <input  name="account" type="text" class="form-control" id="account" data-rule="账号:required;account;" placeholder="请输入账号" />
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="password" class="col-md-2 control-label">密码</label>
						    <div class="col-md-6">
							    <input name="password" type="password" class="form-control" id="password" data-rule="密码:required;password;" placeholder="请输入密码" />
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <div class="col-md-offset-2 col-md-6">
						      <button type="submit" class="btn btn-success btn-sm" value="登陆">
						      	<span class="glyphicon glyphicon-ok"></span>&nbsp;登陆
						      </button>
						      <a href="<%=request.getContextPath() %>/user/forget.html">忘记密码？</a>
						    </div>
						  </div>
						</form>
		              </div>
	            </div>
			</div>
		</div>
	</div>
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.4.2.min.js"></script> --%>
<%--<%@ include file="/foot.jsp"%>--%>
<%--<%@ include file="/resource/common_html_validator.jsp"%>--%>

<%-- <script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=3176592960" type="text/javascript" charset="utf-8"></script> --%>
<%-- <script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" charset="utf-8" data-appid="101020775" data-callback="true"></script> --%>
<script type="text/javascript">
	(function(){
		//if(QC.Login.check()){//如果已登录
			//console.log('QC.Login.check()=true');
			//QC.Login.signOut();
			//showQQLogin();	
		//}else{
			//console.log('QC.Login.check()=false');
			//showQQLogin();
		//}
	})();
	
	function showQQLogin(){
		//调用QC.Login方法，指定btnId参数将按钮绑定在容器节点中
		   QC.Login({
		       //btnId：插入按钮的节点id，必选
		       btnId:"qqLoginBtn",	
		       //用户需要确认的scope授权项，可选，默认all
		       scope:"all",
		       //按钮尺寸，可用值[A_XL| A_L| A_M| A_S|  B_M| B_S| C_S]，可选，默认B_S
		       size: "A_M"
			   }, function(reqData, opts){//登录成功
				   
				   console.log('QQ登录 登陆成功reqData='+reqData);
				   $.each(reqData,function(index,value){
					   console.log("index="+index+"value="+value);
				   });
				   console.log('获取openId...');
				   try{
				    	QC.Login.getMe(function(openId, accessToken){
							//alert(["当前登录用户的", "openId为："+openId, "accessToken为："+accessToken].join("\n"));
							console.log(["当前登录用户的", "openId为："+openId, "accessToken为："+accessToken].join("\n"));
							//$("#qqLoginBtn").html("qq登陆了");
							notifySession("login",openId,accessToken,reqData.nickname);
						});
				    }catch(e){
				    	console.log("QC.Login.getMe异常="+e);
				    }
			   }, function(opts){//注销成功
					console.log('QQ登录 注销成功');
				}
			);
	}
	function notifySession(status,openId,accessToken,nickname){
		var _url = "<%=SystemManager.systemSetting.getWww()%>/user/qqCallbackNotifySession.html?status="+status+"&openId="+openId+"&accessToken="+accessToken+"&nickname="+nickname;
		console.log("_url="+_url);
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  success: function(data){
			  console.log("notifySession.data="+data);
			  window.location.href = "<%=SystemManager.systemSetting.getWww()%>";
		  },
		  dataType: "text",
		  error:function(er){
			  console.log("notifySession.er="+er);
		  }
		});
	}
</script>

<script type="text/javascript">
(function(){
})();
function _login3213123(){
	WB2.login(function(){
		console.log("登陆成功");
	});
}
function _logout321312323(){
	WB2.logout(function(){
		console.log("退出成功");
	});
}

function showSinaWeiboButton(){
	WB2.anyWhere(function(W){
	    W.widget.connectButton({
	        id: "wb_connect_btn",
	        type: '3,2',
	        callback : {
	            login:function(o){
	                console.log("logout,screen_name"+o.screen_name+"id="+o.id);
	                //sinaWeiboLoginNotifySession("login",o.id,o.screen_name);
	                
	                var _url = "/user/sinaWeiboLoginNotifySession.html?status=login"+"&id="+o.id+"&nickname="+o.screen_name;
					console.log("_url="+_url);
					$.ajax({
					  type: 'POST',
					  url: _url,
					  data: {},
					  success: function(data){
						  console.log("success.sinaWeiboLoginNotifySession.data="+data);
						  window.location.href = "<%=SystemManager.systemSetting.getWww()%>";
					  },
					  dataType: "text",
					  error:function(er){
						  console.log("sinaWeiboLoginNotifySession.er="+er);
					  }
					});
					
	            },
	            logout:function(){
	            	console.log("logout");
	            }
	        }
	    });
	});
}

function sinaWeiboLoginNotifySession(status,id,nickname){
	var _url = "user/sinaWeiboLoginNotifySession.html?status="+status+"&id="+id+"&nickname="+nickname;
	console.log("_url="+_url);
	$.ajax({
	  type: 'POST',
	  url: _url,
	  data: {},
	  success: function(data){
		  console.log("sinaWeiboLoginNotifySession.data="+data);
		  window.location.href = "<%=SystemManager.systemSetting.getWww()%>";
	  },
	  dataType: "text",
	  error:function(er){
		  console.log("sinaWeiboLoginNotifySession.er="+er);
	  }
	});
}
</script>

</body>
</html>
