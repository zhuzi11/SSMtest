<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="${pageContext.request.contextPath }/resources/admin/css/common.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath }/resources/admin/css/main.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
	
<style type="text/css">
* {
	font: 12px tahoma, Arial, Verdana, sans-serif;
}

html, body {
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>

<script type="text/javascript">
	$(function() {
		var $nav = $("#nav a:not(:last)");
		var $menu = $("#menu dl");
		var $menuItem = $("#menu a");

		$nav.click(function() {
			var $this = $(this);
			$nav.removeClass("current");
			$this.addClass("current");
			var $currentMenu = $($this.attr("href"));
			$menu.hide();
			$currentMenu.show();
			return false;
		});

		$menuItem.click(function() {
			var $this = $(this);
			$menuItem.removeClass("current");
			$this.addClass("current");
		});

	});
</script>


</head>
<body>
    
    <script type="text/javascript">
		if (self != top) {
			top.location = self.location;
		};
	</script>
	<table class="main">
		<tr>
			<th class="logo">
				<a href="main.jhtml">
					<img src="${pageContext.request.contextPath }/resources/admin/images/header_logo.png" width="160" height="46" alt="CRM" />
				</a>
			</th>
			<th>
				<div id="nav" class="nav">
					<ul>
					           <li>
									<a href="#basic">基础数据</a>
								</li>
								<li>
									<a href="#staff">员工</a>
								</li>
								<li>
									<a href="#question">试题</a>
								</li>	 
						<li>
							<a href="${pageContext.request.contextPath }/admin/systeminfo.action" target="iframe">首页</a>
						</li>
					</ul>
				</div>
				<div class="link">
					<a href="#" target="_blank">官方网站</a>|
					<a href="#" target="_blank">交流论坛</a>|
					<a href="#" target="_blank">关于我们</a>
				</div>
				<div class="link">
					<strong>admin</strong>
					您好!
					<a href="../profile/edit.jhtml" target="iframe">[账号设置]</a>
					<a href="../logout.jsp" target="_top">[注销]</a>
				</div>
			</th>
		</tr>
		
		
		<tr>
			<td id="menu" class="menu">
			
			    <dl id="basic" class="default">
					<dt>xxxx</dt>
						<dd>
							<a href="#" target="iframe">xx</a>
						</dd> 
						<dd>
							<a href="#" target="iframe">xx</a>
						</dd> 
				</dl>
				
				
				<dl id="staff"  >
					<dt>员工管理</dt>
						<dd>
							<a href="${pageContext.request.contextPath }/admin/dept/search.action" target="iframe">部门管理</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath }/admin/staff/search.action" target="iframe">员工信息</a>
						</dd>						 
				</dl>
				 
				<dl id="question">
					<dt>试题管理</dt>
						<dd>
							<a href="${pageContext.request.contextPath }/admin/type/search.action" target="iframe">试题分类</a>
						</dd>
						<dd>
							<a href="${pageContext.request.contextPath }/admin/question/search.action" target="iframe">试题列表</a>
						</dd>
						 
				</dl>
				 
				 
				 
			</td>
			<td>
				<iframe id="iframe" name="iframe" src="${pageContext.request.contextPath }/admin/systeminfo.action" frameborder="0"></iframe>
			</td>
		</tr>
	</table>
    
    
    
    
</body>
</html>