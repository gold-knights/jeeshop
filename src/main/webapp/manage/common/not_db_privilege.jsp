<%@page import="net.jeeshop.core.front.SystemManager"%>
<%@page import="net.jeeshop.core.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- Viewport metatags -->
<meta name="HandheldFriendly" content="true" />
<meta name="MobileOptimized" content="320" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="shortcut icon" href="<%=SystemManager.systemSetting.getShortcuticon()%>">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/404/1/css/dandelion.css"  media="screen" />

<title>xw素材网-404错误页面</title>

</head>

<body>
    
	<!-- Main Wrapper. Set this to 'fixed' for fixed layout and 'fluid' for fluid layout' -->
	<div id="da-wrapper" class="fluid">
    
        <!-- Content -->
        <div id="da-content">
            
            <!-- Container -->
            <div class="da-container clearfix">
            
            	<div id="da-error-wrapper">
                	
                   	<div id="da-error-pin"></div>
                    <div id="da-error-code">
                    	权限受限 <br></br>
                    	<div style="font-size: 22px;">
                    		<%=request.getSession().getAttribute(ManageContainer.action_db_error)%>
                    	</div>                    
                    </div>
                
                	<h1 class="da-error-heading" >
                		<a href="javascript:window.history.back();">返回</a>
                	</h1>
                </div>
            </div>
        </div>
        
        <!-- Footer 
        <div id="da-footer">
        	<div class="da-container clearfix">
           	<p> 2013 xwcms . All Rights Reserved. xw素材网 | 备案号：晋ICP备13005902号</div>
        </div>-->
    </div>
    
</body>
</html>
