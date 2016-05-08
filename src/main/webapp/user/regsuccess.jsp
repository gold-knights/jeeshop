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
</head>

<body>
	<%@ include file="/indexMenu.jsp"%>

		<div class="container">
			<div class="row" style="margin-top: 10px;">
				<div class="col-xs-12">
					<div class="row">
						<div class="col-xs-12" style="font-size: 14px;font-weight: normal;">
							<span class="label label-default" style="font-size:100%;">
								1.填写注册信息 
							</span>
<%-- 							&nbsp;<span class="glyphicon glyphicon-arrow-right"></span> --%>
							&nbsp;<span class="glyphicon glyphicon-circle-arrow-right"></span>
							<span class="label label-success" style="font-size:100%;">
								2.注册成功
							</span>
						</div>
					</div>
					<hr>
					<h2>
						注册成功
					</h2>


					<hr>

				</div>
			</div>
		</div>
	<%@ include file="/foot.jsp"%>
</body>
</html>
