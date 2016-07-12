<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>还未想好...</title>
<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="./京华亿家/index.htm">
				<img src="${pageContext.request.contextPath}/image/r___________renleipic_01/logo.gif" alt=" "/>
			</a>
		</div>
	</div>
	<div class="span9">
		<div class="headerAd">
			<img src="${pageContext.request.contextPath}/image/header.jpg" width="320" height="50"  />
		</div>	
	</div>

	 <%@ include file="header.jsp" %>
	 <%@ include file="menu.jsp" %>
</div>	

<div class="container index">
		

		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
					<div class="title">
						<strong>热门</strong>
						<!-- <a  target="_blank"></a> -->
					</div>
					<ul class="tab">
							<li class="current">
								<a href="./新闻.htm?tagIds=1" target="_blank"></a>
							</li>
							<li>
								<a  target="_blank"></a>
							</li>
							<li>
								<a target="_blank"></a>
							</li>
					</ul>

					<ul class="tabContent" style="display: block;">
						<s:iterator value="hotList">
								<li>						
									<a href="${pageContext.request.contextPath}/multmedia_findByMid.action?mid=<s:property value="mid"/>" target="_blank">
										<img src="${pageContext.request.contextPath}/<s:property value="image"/>" style="display: block;"></a>
								</li>
						</s:iterator>
					</ul>

			</div>
		</div>
		<div class="span24">
			<div id="newProduct" class="newProduct clearfix">
					<div class="title">
						<strong>最新</strong>
						<a  target="_blank"></a>
					</div>
					<ul class="tab">
							<li class="current">
								<a href="./新闻.htm?tagIds=2" target="_blank"></a>
							</li>
							<li>
								<a  target="_blank"></a>
							</li>
							<li>
								<a target="_blank"></a>
							</li>
					</ul>
				 <ul class="tabContent" style="display: block;">
				 
				 <s:iterator value="newList">
								<li>						
									<a href="${pageContext.request.contextPath}/multmedia_findByMid.action?mid=<s:property value="mid"/>" target="_blank">
										<img src="${pageContext.request.contextPath}/<s:property value="image"/>" style="display: block;"></a>
								</li>
				</s:iterator>
				 
				 <!--  
							<li>
								<a  target="_blank"><img src="${pageContext.request.contextPath}/image/0a.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/4a51167a-89d5-4710-aca2-7c76edc355b8-thumbnail.jpg" style="display: block;"></a>									</li>
							<li>
								<a  target="_blank"><img src="${pageContext.request.contextPath}/image/0b.jpg" style="display: block;"></a>									</li>
							
							<li>
								<a target="_blank"><img src="${pageContext.request.contextPath}/image/0c.jpg" style="display: block;"></a>									</li>
							<li>
								<a target="_blank"><img src="${pageContext.request.contextPath}/image/0d.jpg" style="display: block;"></a>									</li>
							<li>
								<a target="_blank"><img src="${pageContext.request.contextPath}/image/0a.jpg" style="display: block;"></a>									</li>
							<li>
								<a target="_blank"><img src="${pageContext.request.contextPath}/image/0b.jpg" style="display: block;"></a>									</li>
							<li>
								<a  target="_blank"><img src="${pageContext.request.contextPath}/image/0c.jpg" style="display: block;"></a>
							<li>
								<a  target="_blank"><img src="${pageContext.request.contextPath}/image/0d.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/b499fb5e-999f-431b-a375-172ee09e4a3e-thumbnail.jpg" style="display: block;" /></a>
							</li>
							<li>
								<a  target="_blank"><img src="${pageContext.request.contextPath}/image/0a.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/b499fb5e-999f-431b-a375-172ee09e4a3e-thumbnail.jpg" style="display: block;" /></a>
							</li>
							<li>
								<a  target="_blank"><img src="${pageContext.request.contextPath}/image/0b.jpg" data-original="http://storage.shopxx.net/demo-image/3.0/201301/b499fb5e-999f-431b-a375-172ee09e4a3e-thumbnail.jpg" style="display: block;" /></a>
							</li>
						-->
				</ul>
			</div>
		</div>
		<div class="span24">
			<div class="friendLink">
				<dl>
					<dt>新手指南</dt>
							<dd>
								<a  target="_blank">服务</a>
								|
							</dd>
							<dd>
								<a  target="_blank">帮助</a>
								|
							</dd>
							
					<dd class="more">
						<a >更多</a>
					</dd>
				</dl>
			</div>
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd" width="950" height="52">
					
</div>	</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a>关于我们</a>
						|
					</li>
					<li>
						<a>联系我们</a>
						|
					</li>
					<li>
						<a>招贤纳士</a>
						|
					</li>
					<li>
						<a>法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						|
					</li>
					<li>
						<a>服务声明</a>
						|
					</li>
					<li>
						<a>广告声明</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2005-2013 Mango商城 版权所有</div>
	</div>
</div>
</body></html>