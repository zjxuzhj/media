<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>商品列表</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/product.css" rel="stylesheet" type="text/css"/>

</head>
<body>

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="./京华亿家/index.htm">
				<img src="${pageContext.request.contextPath}/image/r___________renleipic_01/logo.gif" alt="传智播客"/>
			</a>
		</div>
	</div>
	<div class="span9">
		<div class="headerAd">
			<img src="${pageContext.request.contextPath}/image/header.jpg" width="320" height="50" alt="正品保障" title="正品保障"/>
		</div>		
	</div>

	 <%@ include file="header.jsp" %>
	 <%@ include file="menu.jsp" %>
</div>	

<div class="container productList">
	<div class="span6">
		<div class="hotProductCategory">
			<!-- 一级分类显示 -->
			<s:iterator var="cs" value="categorySecondList">
				<dl>
					<dt>
						<!-- 显示二级分类 -->
						<a href=""><s:property value="#cs.csname"/></a>
					</dt>
						<!-- 显示三级分类-->
						<s:iterator var="ct" value="#cs.categoryThirds">
							<dd>
								<a href="${pageContext.request.contextPath}/multmedia_findByCtid.action?ctid=<s:property value="#ct.ctid"/>&page=1"><s:property value="#ct.ctname"/></a>
							</dd>
						</s:iterator>	  
				</dl>
			</s:iterator>	
		</div>
	</div>
	<div class="span18 last">
			
		<form id="productForm" action="${pageContext.request.contextPath}/image/蔬菜 - Powered By Mango Team.htm" method="get">
			<input type="hidden" id="brandId" name="brandId" value="">
			<input type="hidden" id="promotionId" name="promotionId" value="">
			<input type="hidden" id="orderType" name="orderType" value="">
			<input type="hidden" id="pageNumber" name="pageNumber" value="1">
			<input type="hidden" id="pageSize" name="pageSize" value="20">
					
			<div id="result" class="result table clearfix">
				<ul>
					<s:iterator var="m" value="pageBean.list">
						<li>
							<a href="${pageContext.request.contextPath}/multmedia_findByMid.action?mid=<s:property value="#m.mid"/>">
								<img src="${pageContext.request.contextPath}/<s:property value="#m.image"/>" width="170" height="170"  style="display: inline-block;">
								   
								<span style='color:green'>
								 <s:property value="#m.mname"/>
								</span>
							</a>
						</li>
					</s:iterator>	
				</ul>
			</div>
			<div class="pagination">
				第  <s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页
				<s:if test="pageBean.page != 1">
					<a href="${ pageContext.request.contextPath }/multmedia_findByCsid.action?cid=<s:property value="cid"/>&page=1" class="firstPage">&nbsp;</a>		
					<a href="${ pageContext.request.contextPath }/multmedia_findByCsid.action?cid=<s:property value="cid"/>&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>	
				</s:if>	
				<s:iterator var="i" begin="1" end="pageBean.totalPage" step="1">
					<s:if test="pageBean.page==#i">
						<span class="currentPage"><s:property value="#i"/></span>
					</s:if>
					<s:else>
						<a href="${ pageContext.request.contextPath }/multmedia_findByCsid.action?cid=<s:property value="cid"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a>
					</s:else>
				</s:iterator>
				
				<s:if test="pageBean.page != pageBean.totalPage">
					<a class="nextPage" href="${ pageContext.request.contextPath }/multmedia_findByCsid.action?cid=<s:property value="cid"/>&page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
					<a class="lastPage" href="${ pageContext.request.contextPath }/multmedia_findByCsid.action?cid=<s:property value="cid"/>&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
				</s:if>	
			</div>
		</form>
	</div>

</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd" width="950" height="52"></div>	
	</div>
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